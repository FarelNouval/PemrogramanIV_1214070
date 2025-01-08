// Import package yang diperlukan
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Untuk carousel slider
import 'package:uts1/widget/color.dart'; // File utilitas warna
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Untuk indikator halaman

// Definisi widget ProfileScreen sebagai StatefulWidget
class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState(); // Membuat state
}

// State untuk ProfileScreen
class _ProfileScreenState extends State<ProfileScreen> {
  int activeIndex = 0; // Indeks aktif carousel
  final CarouselSliderController controller =
      CarouselSliderController(); // Controller untuk mengontrol carousel
  final urlImages = [ // List path gambar untuk carousel
    'assets/img/Valorant_Logo.gif',
    'assets/img/cslogo.gif',
    'assets/img/mllogo.gif'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white, // Warna AppBar putih
        elevation: 0, // Tidak ada bayangan
        title: const Text( // Teks judul
          "Profile",
          style: TextStyle(
            fontSize: 23, // Ukuran font
            fontWeight: FontWeight.bold, // Font tebal
            color: Colors.black, // Warna hitam
            fontFamily: 'Poppins', // Font keluarga Poppins
          ),
        ),
        centerTitle: true, // Posisi judul di tengah
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Margin sekeliling 16
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Posisi elemen ke kiri
          children: [
            // Header Profil
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start, // Posisi elemen ke atas
              children: [
                CircleAvatar( // Foto profil lingkaran
                  radius: 40, // Ukuran lingkaran
                  backgroundImage: AssetImage('assets/img/aku2.jpg'), // Gambar profil
                ),
                SizedBox(width: 16), // Spasi horizontal 16
                Expanded(
                  child: Column( // Kolom teks profil
                    crossAxisAlignment: CrossAxisAlignment.start, // Teks rata kiri
                    children: [
                      Text( // Nama pengguna
                        "Farel Nouval Daswara",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: 4), // Spasi vertikal
                      Text( // Posisi atau role
                        "Mobile Developer",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: 8), // Spasi vertikal
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          
                          Text( // Informasi tambahan
                            "NPM: 1214070 \nKelas: 3B",
                            
                            style: TextStyle(
                              
                              color: Colors.white70,
                              fontSize: 17,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text( // Informasi tambahan
                        "ULBI",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 17,
                          fontFamily: 'Poppins',
                        ),
                      ),
                        ],
                      ),
                      
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 24), // Spasi vertikal

            // Seksi Hobi (Carousel)
            const Text(
              "Hobby", // Judul bagian
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 8), // Spasi vertikal
            Column(
              children: [
                CarouselSlider.builder( // Membuat carousel slider
                  carouselController: controller, // Kontrol carousel
                  itemCount: urlImages.length, // Jumlah item sesuai gambar
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = urlImages[index]; // Gambar berdasarkan indeks
                    return buildImage(urlImage, index); // Panggil fungsi buildImage
                  },
                  options: CarouselOptions( // Opsi carousel
                      height: 200, // Tinggi carousel
                      autoPlay: true, // Otomatis berjalan
                      enableInfiniteScroll: false, // Tidak ada scroll tak terbatas
                      autoPlayAnimationDuration: const Duration(seconds: 1), // Durasi animasi
                      enlargeCenterPage: true, // Halaman tengah lebih besar
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index)), // Perbarui indeks aktif
                ),
                SizedBox(height: 12), // Spasi vertikal
              ],
            ),
            const SizedBox(height: 24), // Spasi vertikal

            // Seksi Moto Hidup
            const Text(
              "Moto Hidup", // Judul bagian
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 10), // Spasi vertikal
            const Text(
              "Kesuksesan bukanlah milik mereka yang pintar, tetapi milik mereka yang tidak pernah menyerah.", // Moto hidup
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
      backgroundColor: TColor.primaryColor1, // Warna latar belakang
    );
  }

  // Fungsi untuk membuat indikator animasi
  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide, // Fungsi ketika indikator diklik
        effect: const ExpandingDotsEffect(dotWidth: 15, activeDotColor: Colors.blue), // Efek indikator
        activeIndex: activeIndex, // Indeks aktif
        count: urlImages.length, // Jumlah indikator
      );

  // Fungsi untuk mengubah halaman berdasarkan indikator
  void animateToSlide(int index) => controller.animateToPage(index);

  // Fungsi untuk membangun widget gambar carousel
  Widget buildImage(String urlImage, int index) =>
      Container(child: Image.asset(urlImage, fit: BoxFit.cover)); // Gambar sesuai ukuran
}
