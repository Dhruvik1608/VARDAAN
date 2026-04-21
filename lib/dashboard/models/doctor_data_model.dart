class DoctorDataModel {
  final String id;
  final String name;
  final String hname;
  final String mno;
  final String email;

  DoctorDataModel({
    required this.id,
    required this.name,
    required this.hname,
    required this.mno,
    required this.email,
  });

  factory DoctorDataModel.formJson(Map<String, dynamic> json) {
    return DoctorDataModel(
      id: json["Id"] as String,
      name: json["name"] as String,
      hname: json["HName"] as String,
      mno: json["MNo"] as String,
      email: json["Email"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'Id': id, "name": name, "HName": hname, "MNo": mno, "Email": email};
  }
}
