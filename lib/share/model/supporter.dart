class Supporter {
  String _name;
  String _phone;
  String _gioi_tinh;

  Supporter(this._name, this._phone, this._gioi_tinh);

  Supporter.fromMap(dynamic obj) {
    this._name = obj['Name'];
    this._phone = obj['Phone'];
    this._gioi_tinh = obj['GioiTinh'];
  }

  Map<dynamic, dynamic> toMap() {
    var map = new Map<dynamic, dynamic>();
    map['Name'] = _name;
    map['Phone'] = _phone;
    map['GioiTinh'] = _gioi_tinh;
    return map;
  }

  String get name => _name;
  set name(String value) {
    _name = value;
  }

  String get phone => _phone;
  set phone(String value) {
    _phone = value;
  }

  String get gioi_tinh => _gioi_tinh;
  set gioi_tinh(String value) {
    _gioi_tinh = value;
  }
}
