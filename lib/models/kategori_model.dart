
class KategoriModel {
  String? namaKategori;
  String? image;

  KategoriModel({this.namaKategori, this.image});

  KategoriModel.fromJson(Map<String, dynamic> json) {
    namaKategori = json['nama_kategori'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama_kategori'] = namaKategori;
    data['image'] = image;
    return data;
  }
}
