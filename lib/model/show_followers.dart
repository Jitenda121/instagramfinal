class FollowersModel {
  FollowersModel({
    required this.statusCode,
    required this.type,
    required this.data,
  });
  late final int statusCode;
  late final String type;
  late final Data data;
  
  FollowersModel.fromJson(Map<String, dynamic> json){
    statusCode = json['statusCode'];
    type = json['type'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
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
  
  Data.fromJson(Map<String, dynamic> json){
    followers = List.from(json['Followers']).map((e)=>Followers.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Followers'] = followers.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Followers {
  Followers({
    required this.user,
  });
  late final User user;
  
  Followers.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['User']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['User'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.profilePic,
    required this.accountVerify,
  });
  late final String id;
  late final String username;
  late final String email;
  late final String profilePic;
  late final int accountVerify;
  
  User.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    profilePic = json['profilePic'];
    accountVerify = json['accountVerify'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['profilePic'] = profilePic;
    _data['accountVerify'] = accountVerify;
    return _data;
  }
}