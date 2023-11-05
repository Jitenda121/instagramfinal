class FollowersModel {
  FollowersModel({
    required this.statusCode,
    required this.type,
    required this.data,
  });
  late final int statusCode;
  late final dynamic type;
  late final Data data;
  
  FollowersModel.fromJson(Map<dynamic, dynamic> json){
    statusCode = json['statusCode'];
    type = json['type'];
    data = Data.fromJson(json['data']);
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
    _data['statusCode'] = statusCode;
    _data['type'] = type;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.followers,
  });
  late final List<Followers> followers;
  
  Data.fromJson(Map<dynamic, dynamic> json){
    followers = List.from(json['Followers']).map((e)=>Followers.fromJson(e)).toList();
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
    _data['Followers'] = followers.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Followers {
  Followers({
    required this.user,
  });
  late final User user;
  
  Followers.fromJson(Map<dynamic, dynamic> json){
    user = User.fromJson(json['User']);
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
    _data['User'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.accountVerify,
  });
  late final dynamic id;
  late final dynamic username;
  late final dynamic email;
  late final int accountVerify;
  
  User.fromJson(Map<dynamic, dynamic> json){
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    accountVerify = json['accountVerify'];
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['accountVerify'] = accountVerify;
    return _data;
  }
}