import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Kategori {
  final String id;
  final String nama;

  Kategori({required this.id, required this.nama});

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return Kategori(
      id: (json['id'] ?? '').toString(),
      nama: json['nama'] ?? 'Nama kosong',
    );
  }
}

class KategoriProvider with ChangeNotifier {
  List<Kategori> _kategoriList = [];

  List<Kategori> get kategoriList => _kategoriList;

  final String apiUrl =
      "http://192.168.100.153:8000/sql-myrecipe/kategori_api.php"; // ganti dengan ip kamu disini

  Future<void> fetchKategori() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        _kategoriList = data.map((json) => Kategori.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception("Gagal memuat data kategori");
      }
    } catch (e) {
      debugPrint("Error saat fetchKategori: $e");
    }
  }

  Future<void> tambahKategori(String nama) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'nama': nama,
        }), // ubah dari 'nama_kategori' ke 'nama'
      );
      if (response.statusCode == 200) {
        await fetchKategori(); // refresh data setelah tambah
      }
    } catch (e) {
      debugPrint("Error saat tambahKategori: $e");
    }
  }

  Future<void> hapusKategori(String id) async {
    try {
      final response = await http.delete(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: "id=$id",
      );
      if (response.statusCode == 200) {
        _kategoriList.removeWhere((kat) => kat.id == id);
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Error saat hapusKategori: $e");
    }
  }
}
