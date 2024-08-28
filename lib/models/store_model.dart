class StoreModel {
  String? namaToko;
  String? alamat;
  String? logo;

  StoreModel({
    this.namaToko,
    this.alamat,
    this.logo,
  });

  StoreModel.fromJson(Map<String, dynamic> json) {
    namaToko = json['nama_toko'];
    alamat = json['alamat'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama_toko'] = namaToko;
    data['alamat'] = alamat;
    data['logo'] = logo;
    return data;
  }
}
