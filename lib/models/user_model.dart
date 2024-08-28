class UserModel {
  final String? userId;
  final String? username;
  final String? namaLengkap;
  final String? nomorKtp;
  final String? tempatLahir;
  final String? tanggalLahir;
  final String? email;
  final String?kelamin;
  final String? password;
  final String? noTelp;
  final bool? haveStore;
  final int? roleId;
  final String? photo;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserModel({
    this.userId,
    this.username,
    this.namaLengkap,
    this.nomorKtp,
    this.tempatLahir,
    this.tanggalLahir,
    this.email,
    this.password,
    this.kelamin,
    this.noTelp,
    this.haveStore,
    this.roleId,
    this.photo,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'],
      username: json['username'],
      namaLengkap: json['nama_lengkap'],
      nomorKtp: json['nomor_ktp'],
      tempatLahir: json['tempat_lahir'],
      tanggalLahir: json['tanggal_lahir'],
      email: json['email'],
      kelamin: json['kelamin'],
      password: json['password'],
      noTelp: json['no_telp'],
      haveStore: json['haveStore'],
      roleId: json['role_id'],
      photo: json['photo'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'username': username,
      'nama_lengkap': namaLengkap,
      'nomor_ktp': nomorKtp,
      'tempat_lahir': tempatLahir,
      'kelamin': kelamin,
      'tanggal_lahir': tanggalLahir,
      'email': email,
      'password': password,
      'no_telp': noTelp,
      'haveStore': haveStore,
      'role_id': roleId,
      'photo': photo,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
