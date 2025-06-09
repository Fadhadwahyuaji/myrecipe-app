# myrecipe_app

Aplikasi ini adalah Aplikasi Resep Makanan yang dikembangkan menggunakan framework Flutter, dengan tujuan utama untuk membantu pengguna dalam mengelola, menyimpan, dan menemukan berbagai resep makanan berdasarkan kategori. Aplikasi ini menggabungkan Firebase dan MySQL sebagai backend, serta menggunakan Provider sebagai state management dan Shared Preferences untuk sistem autentikasi.

Tujuan pembuatan aplikasi ini adalah untuk memberikan kemudahan bagi pengguna dalam menyimpan resep pribadi atau komunitas secara digital, serta memungkinkan pengelompokan resep berdasarkan kategori makanan seperti “Makanan Berat”, “Minuman”, “Kue”, dan sebagainya. Pengguna dapat menambahkan resep baru, membaca detail resep, mengedit resep yang sudah ada, dan menghapusnya apabila tidak diperlukan lagi.

Dalam aplikasi ini terdapat aktor pengguna utama:
- Pengguna Umum: Bisa melakukan login, melihat daftar resep, mengelola kategori dan mengelola resep.

Fitur Utama Aplikasi:
- Autentikasi Login (menggunakan Shared Preferences)
- Manajemen Resep Makanan (CRUD menggunakan Firebase Firestore)
- Manajemen Kategori Resep (CRUD menggunakan MySQL via REST API PHP)
- Navigasi antar halaman menggunakan Flutter Router
- Penyimpanan status login secara lokal dengan Shared Preferences
- Pengelolaan data real-time dari Firebase

Aplikasi ini cocok digunakan oleh siapa saja yang ingin mendokumentasikan resep masakan sendiri atau komunitas, seperti ibu rumah tangga, pelajar, mahasiswa, maupun chef profesional. Aplikasi ini juga mendukung penyimpanan data lokal untuk mempercepat proses login dan menjaga user tetap masuk tanpa harus login ulang setiap saat.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

