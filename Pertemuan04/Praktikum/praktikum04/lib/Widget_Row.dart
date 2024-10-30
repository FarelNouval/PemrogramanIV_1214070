import 'package:flutter/material.dart';

// Widget utama yang akan ditampilkan sebagai bagian dari halaman
class MyWidgetRow extends StatelessWidget {
  const MyWidgetRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Menyusun widget di tengah secara horizontal dalam kolom
      children: <Widget>[
        SizedBox(height: 16), // Memberikan jarak antara judul dan teks pertama

        // Bagian pertama dengan pengaturan mainAxisAlignment.spaceEvenly
        Text('MainAxisAlignment.spaceEvenly'), // Teks penjelas alignment
        SizedBox(height: 8), // Jarak antara teks penjelas dan baris ikon pertama
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Menyebarkan ikon dengan jarak yang sama di antara mereka
          children: <Widget>[
            IconButton(
              onPressed: () {}, // Fungsi kosong ketika ikon ditekan
              icon: Icon(Icons.share), // Ikon Share
            ),
            IconButton(
              onPressed: () {}, // Fungsi kosong ketika ikon ditekan
              icon: Icon(Icons.thumb_up), // Ikon Like
            ),
            IconButton(
              onPressed: () {}, // Fungsi kosong ketika ikon ditekan
              icon: Icon(Icons.thumb_down), // Ikon Dislike
            ),
          ],
        ),
        SizedBox(height: 16), // Jarak antara baris ikon pertama dan teks penjelas berikutnya

        // Bagian kedua dengan mainAxisAlignment.spaceAround
        Text('MainAxisAlignment.spaceAround'), // Teks penjelas alignment
        SizedBox(height: 8), // Jarak antara teks dan baris ikon kedua
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Menyebarkan ikon dengan jarak seimbang dari tepi dan antar ikon
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.thumb_up),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.thumb_down),
            ),
          ],
        ),
        SizedBox(height: 16), // Jarak antara baris ikon kedua dan teks penjelas berikutnya

        // Bagian ketiga dengan mainAxisAlignment.spaceBetween
        Text('MainAxisAlignment.spaceBetween'),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Menempatkan ikon di tepi luar kiri dan kanan, dengan satu ikon di tengah
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.thumb_up),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.thumb_down),
            ),
          ],
        ),
        SizedBox(height: 16),

        // Bagian keempat dengan mainAxisAlignment.start
        Text('MainAxisAlignment.start'),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start, // Menyusun ikon mulai dari tepi kiri
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.thumb_up),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.thumb_down),
            ),
          ],
        ),
        SizedBox(height: 16),

        // Bagian kelima dengan mainAxisAlignment.end
        Text('MainAxisAlignment.end'),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end, // Menyusun ikon di tepi kanan
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.thumb_up),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.thumb_down),
            ),
          ],
        ),
        SizedBox(height: 16),

        // Bagian terakhir dengan mainAxisAlignment.center
        Text('MainAxisAlignment.center'),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Menyusun ikon di tengah
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.thumb_up),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.thumb_down),
            ),
          ],
        ),
      ],
    );
  }
}
