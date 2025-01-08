// Import library yang dibutuhkan
import 'package:flutter/material.dart';
// Import file biodata_view.dart yang berisi widget untuk menampilkan biodata
import 'package:uts1/biodata_view.dart';
// Import file color.dart yang berisi konstanta warna
import 'package:uts1/widget/color.dart';
// Import file round_button.dart yang berisi widget tombol bulat
import 'package:uts1/widget/round_button.dart';

// Kelas StartedView adalah widget stateful yang digunakan untuk menampilkan tampilan awal aplikasi
class StartedView extends StatefulWidget {
  // Konstruktor StartedView
  const StartedView({super.key});

  // Method yang digunakan untuk membuat state dari StartedView
  @override
  State<StartedView> createState() => _StartedViewState();
}

// State dari StartedView
class _StartedViewState extends State<StartedView> {
  // Variabel untuk mengubah warna latar belakang
  bool isChangeColor = false;

  // Method yang digunakan untuk membangun widget
  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran media (lebar dan tinggi) dari konteks
    var media = MediaQuery.of(context).size;
    // Mengembalikan Scaffold yang berisi widget lainnya
    return Scaffold(
      // Mengatur warna latar belakang menjadi putih
      backgroundColor: TColor.white,
      // Mengatur isi dari Scaffold
      body: Container(
          // Mengatur lebar container menjadi sama dengan lebar media
          width: media.width,
          // Mengatur dekorasi kontainer dengan gradien jika isChangeColor true
          decoration: BoxDecoration(
            gradient: isChangeColor
                ? LinearGradient(
                    // Mengatur warna gradien
                    colors: TColor.primaryG,
                    // Mengatur posisi awal gradien
                    begin: Alignment.topLeft,
                    // Mengatur posisi akhir gradien
                    end: Alignment.bottomRight)
                : null,
          ),
          // Mengatur isi dari container
          child: Column(
            // Mengatur posisi anak-anak dari Column menjadi di tengah
            mainAxisAlignment: MainAxisAlignment.center,
            // Mengatur anak-anak dari Column
            children: [
              // Mengatur spasi di atas
              const Spacer(),
              // Menampilkan judul "Ujian Tengah Semester"
              Text(
                "Ujian Tengah Semester",
                // Mengatur style dari teks
                style: TextStyle(
                    // Mengatur warna teks
                    color: TColor.black,
                    // Mengatur ukuran teks
                    fontSize: 25,
                    // Mengatur font weight teks
                    fontWeight: FontWeight.w700),
              ),
              // Menampilkan subjudul "Pemrograman IV"
              Text(
                "Pemrograman IV",
                // Mengatur style dari teks
                style: TextStyle(
                  // Mengatur warna teks
                  color: TColor.gray,
                  // Mengatur ukuran teks
                  fontSize: 18,
                ),
              ),
              // Mengatur spasi di bawah
              const Spacer(),
              // Mengatur area yang aman dari notch
              SafeArea(
                // Mengatur isi dari SafeArea
                child: Padding(
                  // Mengatur padding di sekitar tombol
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  // Menampilkan tombol bulat
                  child: RoundButton(
                      // Mengatur judul tombol
                      title: "Start",
                      // Mengatur jenis tombol
                      type: isChangeColor
                          ? RoundButtonType.textGradient
                          : RoundButtonType.bgGradient,
                      // Mengatur aksi ketika tombol ditekan
                      onPressed: () {
                        // Mengarahkan ke halaman biodata
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BiodataView()));
                      }),
                ),
              ),
              // Mengatur spasi di bawah tombol
              SizedBox(
                  height: media.width * 0.05,
                ),
            ],
          )),
    );
  }
}