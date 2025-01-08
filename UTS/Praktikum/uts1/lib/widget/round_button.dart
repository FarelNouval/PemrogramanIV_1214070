import 'package:flutter/material.dart';
import 'package:uts1/widget/color.dart'; // Mengimpor file color.dart yang berisi definisi warna.

/// Enum untuk mendefinisikan tipe tombol.
enum RoundButtonType { bgGradient, bgSGradient, textGradient } 
// bgGradient: Tombol dengan latar gradasi warna utama.
// bgSGradient: Tombol dengan latar gradasi warna sekunder.
// textGradient: Tombol dengan teks yang memiliki gradasi warna.

/// Stateless widget untuk tombol dengan fitur gradasi dan customisasi.
class RoundButton extends StatelessWidget {
  // Judul teks pada tombol.
  final String title; 
  
  // Tipe tombol berdasarkan enum.
  final RoundButtonType type; 
  
  // Callback fungsi yang dipanggil saat tombol ditekan.
  final VoidCallback onPressed; 
  
  // Ukuran font dari teks pada tombol.
  final double fontSize; 
  
  // Ketinggian bayangan tombol.
  final double elevation; 
  
  // Berat font teks pada tombol.
  final FontWeight fontWeight; 
  
  /// Konstruktor dengan parameter wajib dan default untuk beberapa properti.
  const RoundButton({
    super.key, // Key untuk mengidentifikasi widget dalam widget tree.
    required this.title, // Judul tombol wajib diisi.
    this.type = RoundButtonType.bgGradient, // Tipe default adalah bgGradient.
    this.fontSize = 16, // Ukuran font default 16.
    this.elevation = 1, // Tinggi bayangan default 1.
    this.fontWeight = FontWeight.w700, // Berat font default w700.
    required this.onPressed, // Callback wajib diisi.
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Gradient untuk latar tombol berdasarkan tipe.
        gradient: LinearGradient(
          colors: type == RoundButtonType.bgSGradient 
              ? TColor.secondaryG // Gunakan gradasi sekunder jika tipe bgSGradient.
              : TColor.primaryG, // Gunakan gradasi utama untuk tipe lainnya.
        ),
        borderRadius: BorderRadius.circular(25), // Radius untuk membuat ujung tombol bulat.
        // Bayangan hanya diterapkan pada tipe bgGradient atau bgSGradient.
        boxShadow: type == RoundButtonType.bgGradient || type == RoundButtonType.bgSGradient
            ? const [
                BoxShadow(
                  color: Colors.black26, // Warna bayangan.
                  blurRadius: 0.5, // Tingkat buram bayangan.
                  offset: Offset(0, 0.5), // Offset bayangan.
                )
              ]
            : null, // Tidak ada bayangan untuk tipe textGradient.
      ),
      child: MaterialButton(
        onPressed: onPressed, // Fungsi yang dipanggil saat tombol ditekan.
        height: 50, // Tinggi tombol.
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25), // Bentuk tombol dengan ujung bulat.
        ),
        textColor: TColor.primaryColor1, // Warna teks.
        minWidth: double.maxFinite, // Lebar tombol maksimal.
        elevation: type == RoundButtonType.bgGradient || type == RoundButtonType.bgSGradient
            ? 0 // Tanpa elevasi untuk tipe bgGradient dan bgSGradient.
            : elevation, // Gunakan elevasi yang diberikan untuk tipe lainnya.
        color: type == RoundButtonType.bgGradient || type == RoundButtonType.bgSGradient
            ? Colors.transparent // Latar transparan untuk tipe gradasi.
            : TColor.white, // Warna latar putih untuk tipe lainnya.
        child: type == RoundButtonType.bgGradient || type == RoundButtonType.bgSGradient
            ? Text(
                title, // Teks tombol untuk tipe gradasi latar.
                style: TextStyle(
                  color: TColor.white, // Warna teks putih.
                  fontSize: fontSize, // Ukuran font sesuai parameter.
                  fontWeight: fontWeight, // Berat font sesuai parameter.
                ),
              )
            : ShaderMask(
                blendMode: BlendMode.srcIn, // Blend mode untuk gradasi teks.
                shaderCallback: (bounds) {
                  return LinearGradient(
                    colors: TColor.primaryG, // Gradasi warna utama untuk teks.
                    begin: Alignment.centerLeft, // Gradasi mulai dari kiri.
                    end: Alignment.centerRight, // Gradasi berakhir di kanan.
                  ).createShader(
                    Rect.fromLTRB(0, 0, bounds.width, bounds.height), // Area gradasi.
                  );
                },
                child: Text(
                  title, // Teks tombol untuk tipe gradasi teks.
                  style: TextStyle(
                    color: TColor.primaryColor1, // Warna teks (digunakan oleh ShaderMask).
                    fontSize: fontSize, // Ukuran font sesuai parameter.
                    fontWeight: fontWeight, // Berat font sesuai parameter.
                  ),
                ),
              ),
      ),
    );
  }
}
