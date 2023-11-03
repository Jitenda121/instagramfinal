// class LikeList  {
//   LikeList({
//     required this.statusCode,
//     required this.type,
//     required this.data,
//   });
//   late final int statusCode;
//   late final String type;
//   late final Data data;
  
//   LikeList.fromJson(Map<String, dynamic> json){
//     statusCode = json['statusCode'];
//     type = json['type'];
//     data = Data.fromJson(json['data']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['statusCode'] = statusCode;
//     _data['type'] = type;
//     _data['data'] = data.toJson();
//     return _data;
//   }
// }

// class Data {
//   Data({
//     required this.likes,
//   });
//   late final List<Likes> likes;
  
//   Data.fromJson(Map<String, dynamic> json){
//     likes = List.from(json['Likes']).map((e)=>Likes.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['Likes'] = likes.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }

// class Likes {
//   Likes({
//     required this.user,
//   });
//   late final User user;
  
//   Likes.fromJson(Map<String, dynamic> json){
//     user = User.fromJson(json['User']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['User'] = user.toJson();
//     return _data;
//   }
// }

// class User {
//   User({
//     required this.id,
//     required this.username,
//     required this.email,
//   });
//   late final String id;
//   late final String username;
//   late final String email;
  
//   User.fromJson(Map<String, dynamic> json){
//     id = json['_id'];
//     username = json['username'];
//     email = json['email'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['_id'] = id;
//     _data['username'] = username;
//     _data['email'] = email;
//     return _data;
//   }
// }



class LikeList  {
  LikeList ({
    required this.statusCode,
    required this.type,
    required this.data,
  });
  late final int statusCode;
  late final String type;
  late final Data data;
  
  LikeList .fromJson(Map<String, dynamic> json){
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
    required this.likes,
  });
  late final List<Likes> likes;
  
  Data.fromJson(Map<String, dynamic> json){
    likes = List.from(json['Likes']).map((e)=>Likes.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Likes'] = likes.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Likes {
  Likes({
    required this.user,
  });
  late final User user;
  
  Likes.fromJson(Map<String, dynamic> json){
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
  });
  late final String id;
  late final String username;
  late final String email;
  late final String profilePic;
  
  User.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['profilePic'] = profilePic;
    return _data;
  }
}