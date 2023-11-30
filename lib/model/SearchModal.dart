// ignore: file_names
class SearchUser {
  SearchUser({
    required this.statusCode,
    required this.type,
    required this.data,
  });
  late final int statusCode;
  late final String type;
  late final List<Data> data;
  
  SearchUser.fromJson(Map<String, dynamic> json){
    statusCode = json['statusCode'];
    type = json['type'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['statusCode'] = statusCode;
    _data['type'] = type;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.username,
    required this.fullName,
    required this.profilePic,
  });
  late final String id;
  late final String username;
  late final String fullName;
  late final String profilePic;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    username = json['username'];
    fullName = json['fullName'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['fullName'] = fullName;
    _data['profilePic'] = profilePic;
    return _data;
  }
}