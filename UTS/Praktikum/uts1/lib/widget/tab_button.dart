import 'package:flutter/material.dart';
import 'package:uts1/widget/color.dart'; // Mengimpor file warna (color.dart) untuk mendefinisikan warna gradasi.

/// Stateless widget untuk membuat tombol tab navigasi.
class TabButton extends StatelessWidget {
  // Ikon default yang ditampilkan saat tab tidak aktif.
  final String icon;

  // Ikon yang ditampilkan saat tab aktif.
  final String selectIcon;

  // Callback yang dipanggil ketika tab ditekan.
  final VoidCallback onTap;

  // Status apakah tab ini sedang aktif atau tidak.
  final bool isActive;

  /// Konstruktor untuk inisialisasi parameter.
  const TabButton({
    super.key,
    required this.icon, // Parameter wajib: ikon default.
    required this.selectIcon, // Parameter wajib: ikon aktif.
    required this.isActive, // Parameter wajib: status aktif atau tidak.
    required this.onTap, // Parameter wajib: fungsi yang dipanggil saat ditekan.
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // InkWell memberikan efek sentuhan saat widget ditekan.
      onTap: onTap, // Menjalankan callback `onTap` saat tombol ditekan.
      child: Column(
        mainAxisSize: MainAxisSize.min, // Meminimalkan ukuran kolom.
        children: [
          // Menampilkan ikon, bergantung pada status aktif/tidak.
          Image.asset(
            isActive ? selectIcon : icon, // Menampilkan ikon aktif atau default.
            width: 25, // Lebar ikon.
            height: 25, // Tinggi ikon.
            fit: BoxFit.fitWidth, // Menyesuaikan lebar ikon dengan tepat.
          ),
          SizedBox(
            height: isActive ? 8 : 12, // Jarak antar-elemen lebih kecil jika aktif.
          ),
          // Jika tab aktif, tampilkan indikator lingkaran kecil di bawah ikon.
          if (isActive)
            Container(
              width: 4, // Lebar indikator.
              height: 4, // Tinggi indikator.
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: TColor.secondaryG, // Gradasi warna sekunder.
                ),
                borderRadius: BorderRadius.circular(2), // Membuat indikator berbentuk lingkaran.
              ),
            ),
        ],
      ),
    );
  }
}
