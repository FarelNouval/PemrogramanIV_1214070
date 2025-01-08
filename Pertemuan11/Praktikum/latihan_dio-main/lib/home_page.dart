import 'package:flutter/material.dart';
import 'package:latihan_dio/data_service.dart';
import 'package:latihan_dio/put_card.dart';
import 'package:latihan_dio/user.dart';
import 'package:latihan_dio/user_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DataService _dataService = DataService();

  final _formKey = GlobalKey<FormState>();
  final _nameCtl = TextEditingController();
  final _jobCtl = TextEditingController();
  String _result = 'no data';
  List<User> _users = [];
  UserCreate? usCreate;
  UserUpdate? usUpdate;

  @override
  void dispose() {
    _nameCtl.dispose();
    _jobCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API (DIO)'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameCtl,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Name',
                  suffixIcon: IconButton(
                    onPressed: _nameCtl.clear,
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: _jobCtl,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Job',
                  suffixIcon: IconButton(
                    onPressed: _jobCtl.clear,
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          final res = await _dataService.getUsers();
                          setState(() {
                            _result = res.toString();
                          });
                        } catch (e) {
                          displaySnackbar('Failed to get data: $e');
                        }
                      },
                      child: const Text('GET'),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_nameCtl.text.isEmpty || _jobCtl.text.isEmpty) {
                          displaySnackbar('All fields must be filled');
                          return;
                        }
                        try {
                          final postModel = UserCreate(
                            name: _nameCtl.text,
                            job: _jobCtl.text,
                          );
                          final res = await _dataService.postUser(postModel);
                          setState(() {
                            _result = res?.toString() ?? 'Failed to POST data';
                            usCreate = res;
                          });
                          _nameCtl.clear();
                          _jobCtl.clear();
                        } catch (e) {
                          displaySnackbar('Error: $e');
                        }
                      },
                      child: const Text('POST'),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_nameCtl.text.isEmpty || _jobCtl.text.isEmpty) {
                          displaySnackbar('All fields must be filled');
                          return;
                        }
                        try {
                          final putModel = UserUpdate(
                            name: _nameCtl.text,
                            job: _jobCtl.text,
                          );
                          final res = await _dataService.putUser('3', putModel);
                          setState(() {
                            _result = res?.toString() ?? 'Failed to PUT data';
                            usUpdate = res;
                          });
                          _nameCtl.clear();
                          _jobCtl.clear();
                        } catch (e) {
                          displaySnackbar('Error: $e');
                        }
                      },
                      child: const Text('PUT'),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          final res = await _dataService.deleteUser('3');
                          setState(() {
                            _result = res.toString();
                            usCreate = null;
                            usUpdate = null;
                          });
                        } catch (e) {
                          displaySnackbar('Failed to DELETE data: $e');
                        }
                      },
                      child: const Text('DELETE'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          final users = await _dataService.getUserModel();
                          setState(() {
                            _users = users?.toList() ?? [];
                          });
                        } catch (e) {
                          displaySnackbar('Failed to fetch user model: $e');
                        }
                      },
                      child: const Text('Model Class User Example'),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _result = 'no data';
                        _users.clear();
                        usCreate = null;
                        usUpdate = null;
                      });
                    },
                    child: const Text('Reset'),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Result',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Expanded(
                child: _users.isEmpty ? Text(_result) : _buildListUser(),
              ),
              hasilCard(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListUser() {
    return ListView.separated(
      itemBuilder: (context, index) {
        final user = _users[index];
        return Card(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(user.avatar),
            ),
            title: Text('${user.firstName} ${user.lastName}'),
            subtitle: Text(user.email),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10.0),
      itemCount: _users.length,
    );
  }

  Widget hasilCard(BuildContext context) {
    return Column(
      children: [
        if (usCreate != null)
          UserCard(usrCreate: usCreate!)
        else if (usUpdate != null)
          PutCard(usrUpdate: usUpdate!)
        else
          const Text('no data'),
      ],
    );
  }

  void displaySnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
