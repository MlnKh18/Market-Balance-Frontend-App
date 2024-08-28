class ProductModel {
  String? produkId;
  String? nama_toko;
  String? nama_kategori;
  String? alamat;
  int? hargaPerkg;
  int? beratp;
  String? namaProduk;
  int? harga;
  String? deskripsi;
  String? image;
  String? expired;
  int? stock;
  String? createdAt;
  String? updatedAt;

  ProductModel(
      {this.produkId,
      this.nama_toko,
      this.nama_kategori,
      this.alamat,
      this.hargaPerkg,
      this.beratp,
      this.namaProduk,
      this.harga,
      this.deskripsi,
      this.image,
      this.expired,
      this.stock,
      this.createdAt,
      this.updatedAt});

  ProductModel.fromJson(Map<String, dynamic> json) {
    produkId = json['produk_id'];
    nama_toko = json['nama_toko'];
    nama_kategori = json['nama_kategori'];
    alamat = json['alamat'];
    hargaPerkg = json['harga_perkg'];
    beratp = json['berat_p'];
    namaProduk = json['nama_produk'];
    harga = json['harga'];
    deskripsi = json['deskripsi'];
    image = json['image'];
    expired = json['expired'];
    stock = json['stock'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['produk_id'] = produkId;
    data['nama_toko'] = nama_toko;
    data['nama_kategori'] = nama_kategori;
    data['alamat'] = alamat;
    data['harga_perKG'] = hargaPerkg;
    data['berat_p'] = beratp;
    data['nama_produk'] = namaProduk;
    data['harga'] = harga;
    data['deskripsi'] = deskripsi;
    data['image'] = image;
    data['expired'] = expired;
    data['stock'] = stock;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
