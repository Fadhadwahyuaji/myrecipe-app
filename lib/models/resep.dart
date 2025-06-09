class Resep {
  final String id;
  final String judul;
  final String kategori;
  final String deskripsi;

  Resep({
    required this.id,
    required this.judul,
    required this.kategori,
    required this.deskripsi,
  });

  factory Resep.fromFirestore(String id, Map<String, dynamic> data) {
    return Resep(
      id: id,
      judul: data['judul'],
      kategori: data['kategori'],
      deskripsi: data['deskripsi'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'judul': judul, 'kategori': kategori, 'deskripsi': deskripsi};
  }
}
