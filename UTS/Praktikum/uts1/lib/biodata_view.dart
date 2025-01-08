import 'package:carousel_slider/carousel_slider.dart'; // Mengimpor package CarouselSlider untuk membuat carousel.
import 'package:flutter/material.dart';
import 'package:uts1/widget/color.dart'; // Mengimpor file color.dart untuk warna tema aplikasi.
import 'package:uts1/tab_view.dart'; // Mengimpor TabView untuk navigasi.
import 'package:uts1/widget/round_button.dart'; // Mengimpor RoundButton untuk tombol kustom.

/// Widget Stateful untuk menampilkan halaman Biodata dengan carousel.
class BiodataView extends StatefulWidget {
  const BiodataView({super.key});

  @override
  State<BiodataView> createState() => _BiodataViewState();
}

class _BiodataViewState extends State<BiodataView> {
  // Controller untuk CarouselSlider agar dapat dikendalikan programmatically.
  CarouselController buttonCarouselController = CarouselController();

  // List yang berisi data untuk carousel.
  List goalArr = [
    {
      "image": "assets/img/aku1.jpg", // Path gambar.
      "title": "Biodata", // Judul slide.
      "subtitle":
          "Nama : Farel Nouval Daswara\nNPM : 1214070\nKelas : 3B" // Konten deskripsi.
    },
    {
      "image": "assets/img/pak_indra.png",
      "title": "Dosen Pengampu",
      "subtitle": "Indra Riksa Herlambang, M.Kom., SFPC."
    },
    {
      "image": "assets/img/ulbi1.png",
      "title": "Kampus",
      "subtitle": "Universitas Logistik dan Bisnis Internasional\nTercintah"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size; // Mendapatkan ukuran layar perangkat.
    return Scaffold(
      backgroundColor: TColor.white, // Warna latar belakang halaman.
      body: SafeArea(
        child: Stack(
          children: [
            // Bagian tengah layar untuk carousel.
            Center(
              child: CarouselSlider(
                // Membuat item carousel dari data di goalArr.
                items: goalArr.map((gObj) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: TColor.primaryG, // Gradasi warna utama.
                        begin: Alignment.topLeft, // Gradasi mulai dari kiri atas.
                        end: Alignment.bottomRight, // Berakhir di kanan bawah.
                      ),
                      borderRadius: BorderRadius.circular(25), // Ujung membulat.
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: media.width * 0.1, // Padding vertikal.
                      horizontal: 25, // Padding horizontal.
                    ),
                    alignment: Alignment.center, // Konten berada di tengah.
                    child: FittedBox(
                      child: Column(
                        children: [
                          Image.asset(
                            gObj["image"].toString(), // Gambar dari data.
                            width: media.width * 0.5, // Lebar gambar.
                            fit: BoxFit.fitWidth, // Menyesuaikan ukuran gambar.
                          ),
                          SizedBox(
                            height: media.width * 0.1, // Jarak antar elemen.
                          ),
                          Text(
                            gObj["title"].toString(), // Judul slide.
                            style: TextStyle(
                              color: TColor.white, // Warna teks.
                              fontSize: 14, // Ukuran font.
                              fontWeight: FontWeight.w700, // Tebal font.
                            ),
                          ),
                          SizedBox(
                            height: media.width * 0.02, // Jarak antar elemen.
                          ),
                          Text(
                            gObj["subtitle"].toString(), // Subtitle/deskripsi slide.
                            textAlign: TextAlign.center, // Rata tengah.
                            style: TextStyle(
                              color: TColor.white, // Warna teks.
                              fontSize: 12, // Ukuran font.
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: false, // Tidak otomatis berpindah slide.
                  enlargeCenterPage: true, // Memperbesar slide di tengah.
                  viewportFraction: 0.7, // Proporsi lebar slide pada layar.
                  aspectRatio: 0.74, // Rasio aspek slide.
                  initialPage: 0, // Slide awal.
                ),
              ),
            ),
            // Header dan tombol di atas carousel.
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: media.width,
              child: Column(
                children: [
                  SizedBox(
                    height: media.width * 0.05, // Jarak dari atas layar.
                  ),
                  Text(
                    "Halo Semuanyaaa", // Judul utama halaman.
                    style: TextStyle(
                      color: TColor.black, // Warna teks.
                      fontSize: 20, // Ukuran font.
                      fontWeight: FontWeight.w700, // Tebal font.
                    ),
                  ),
                  Text(
                    "Ini sedikit tentang saya", // Subtitle/deskripsi halaman.
                    textAlign: TextAlign.center, // Teks rata tengah.
                    style: TextStyle(
                      color: TColor.gray, // Warna teks.
                      fontSize: 12, // Ukuran font.
                    ),
                  ),
                  const Spacer(), // Mengisi ruang kosong di antara elemen.
                  RoundButton(
                    title: "Next", // Teks tombol.
                    onPressed: () {
                      // Navigasi ke halaman TabView saat tombol ditekan.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TabView(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: media.width * 0.05, // Jarak dari bawah layar.
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
