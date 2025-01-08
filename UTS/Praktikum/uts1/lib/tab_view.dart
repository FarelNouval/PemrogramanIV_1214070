// Import library yang dibutuhkan
import 'package:flutter/material.dart';
// Import file list_view.dart yang berisi widget untuk menampilkan daftar kontak
import 'package:uts1/list_view.dart';
// Import file color.dart yang berisi konstanta warna
import 'package:uts1/widget/color.dart';
// Import file home_view.dart yang berisi widget untuk tampilan beranda
import 'package:uts1/home_view.dart';
// Import file tab_button.dart yang berisi widget untuk tombol tab
import 'package:uts1/widget/tab_button.dart';

// Kelas TabView adalah widget stateful yang digunakan untuk menampilkan tampilan tab
class TabView extends StatefulWidget {
  // Konstruktor TabView
  const TabView({super.key});

  // Method yang digunakan untuk membuat state dari TabView
  @override
  State<TabView> createState() => _TabViewState();
}

// State dari TabView
class _TabViewState extends State<TabView> {
  // Variabel untuk menyimpan tab yang dipilih
  int selectTab = 0;
  // Membuat PageStorageBucket untuk menyimpan status halaman
  final PageStorageBucket pageBucket = PageStorageBucket();
  // Widget yang ditampilkan saat ini, diatur ke ProfileScreen secara default
  Widget currentTab = ProfileScreen();

  // Method yang digunakan untuk membangun widget
  @override
  Widget build(BuildContext context) {
    // Mengembalikan Scaffold yang berisi widget lainnya
    return Scaffold(
      // Mengatur warna latar belakang menjadi putih
      backgroundColor: TColor.white,
      // Mengatur isi dari Scaffold dengan PageStorage untuk menyimpan status halaman
      body: PageStorage(bucket: pageBucket, child: currentTab),
      // Mengatur bottom navigation bar
      bottomNavigationBar: BottomAppBar(
        child: Container(
          // Mengatur dekorasi kontainer menjadi putih
          decoration: BoxDecoration(color: TColor.white),
          // Mengatur padding vertikal di dalam kontainer
          padding: const EdgeInsets.symmetric(vertical: 8), // Tambahkan padding vertikal
          // Mengatur isi dari kontainer
          child: Row(
            // Mengatur posisi anak-anak dari Row menjadi tersebar secara merata
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Sebar ikon secara merata
            // Mengatur anak-anak dari Row
            children: [
              // Tombol tab untuk tampilan beranda
              TabButton(
                // Mengatur ikon untuk tab
                icon: "assets/img/home_tab.png",
                // Mengatur ikon yang dipilih untuk tab
                selectIcon: "assets/img/home_tab_select.png",
                // Mengatur status aktif tab
                isActive: selectTab == 0,
                // Mengatur aksi ketika tab ditekan
                onTap: () {
                  // Memperbarui state ketika tab ditekan
                  setState(() {
                    selectTab = 0; // Mengatur tab yang dipilih ke 0
                    currentTab = ProfileScreen(); // Mengatur widget saat ini ke ProfileScreen
                  });
                },
              ),
              // Tombol tab untuk tampilan daftar kontak
              TabButton(
                // Mengatur ikon untuk tab
                icon: "assets/img/list_icon.png",
                // Mengatur ikon yang dipilih untuk tab
                selectIcon: "assets/img/list_icon_select.png",
                // Mengatur status aktif tab
                isActive: selectTab == 1,
                // Mengatur aksi ketika tab ditekan
                onTap: () {
                  // Memperbarui state ketika tab ditekan
                  setState(() {
                    selectTab = 1; // Mengatur tab yang dipilih ke 1
                    currentTab = ListContacts(); // Mengatur widget saat ini ke ListContacts
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}