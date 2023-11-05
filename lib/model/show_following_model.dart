class FollowingModel {
  FollowingModel({
    required this.statusCode,
    required this.type,
    required this.data,
  });
  late final int statusCode;
  late final String type;
  late final Data data;

  FollowingModel.fromJson(Map<String, dynamic> json) {
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
    required this.following,
  });
  late final List<Following> following;

  Data.fromJson(Map<String, dynamic> json) {
    following =
        List.from(json['Following']).map((e) => Following.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Following'] = following.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Following {
  Following({
    required this.user,
  });
  late final User user;

  Following.fromJson(Map<String, dynamic> json) {
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
    required this.accountVerify,
  });
  late final String id;
  late final String username;
  late final String email;
  late final int accountVerify;

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    accountVerify = json['accountVerify'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['accountVerify'] = accountVerify;
    return _data;
  }
}
