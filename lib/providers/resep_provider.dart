import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/resep.dart';

class ResepProvider with ChangeNotifier {
  final List<Resep> _reseps = [];
  final _resepCollection = FirebaseFirestore.instance.collection('reseps');

  // Tambahkan loading state
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Resep> get reseps => [..._reseps];

  Future<void> fetchReseps() async {
    _isLoading = true;
    notifyListeners();

    try {
      final snapshot = await _resepCollection.get();
      _reseps.clear();
      for (var doc in snapshot.docs) {
        _reseps.add(Resep.fromFirestore(doc.id, doc.data()));
      }
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> tambahResep(Resep resep) async {
    try {
      // Tambah ke Firestore
      final docRef = await _resepCollection.add(resep.toMap());

      // Update data lokal - JANGAN panggil fetchReseps() lagi!
      _reseps.add(
        Resep(
          id: docRef.id,
          judul: resep.judul,
          kategori: resep.kategori,
          deskripsi: resep.deskripsi,
        ),
      );
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> hapusResep(String id) async {
    try {
      // Hapus dari Firestore
      await _resepCollection.doc(id).delete();

      _reseps.removeWhere((r) => r.id == id);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
