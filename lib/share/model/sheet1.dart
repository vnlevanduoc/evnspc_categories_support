class Sheet1 {
  String _linh_vuc;
  String _title;
  String _desc;
  String _support;

  Sheet1(this._linh_vuc, this._title, this._desc, this._support);

  Sheet1.fromMap(dynamic obj) {
    this._linh_vuc = obj['LinhVuc'];
    this._title = obj['Title'];
    this._desc = obj['Desc'];
    this._support = obj['Support'];
  }

  Map<dynamic, dynamic> toMap() {
    var map = new Map<dynamic, dynamic>();
    map['LinhVuc'] = _linh_vuc;
    map['Title'] = _title;
    map['Desc'] = _desc;
    map['Support'] = _support;
    return map;
  }

  String get linh_vuc => _linh_vuc;
  set linh_vuc(String value) {
    _linh_vuc = value;
  }

  String get title => _title;
  set title(String value) {
    _title = value;
  }

  String get desc => _desc;
  set desc(String value) {
    _desc = value;
  }

  String get support => _support;
  set support(String value) {
    _support = value;
  }
}
