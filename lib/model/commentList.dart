// class CommentList {
//   CommentList({
//     required this.statusCode,
//     required this.type,
//     required this.data,
//   });
//   late final int statusCode;
//   late final String type;
//   late final Data data;
  
//   CommentList.fromJson(Map<String, dynamic> json){
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
//     required this.comments,
//   });
//   late final List<Comments> comments;
  
//   Data.fromJson(Map<String, dynamic> json){
//     comments = List.from(json['Comments']).map((e)=>Comments.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['Comments'] = comments.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }

// class Comments {
//   Comments({
//     required this.comment,
//     required this.user,
//   });
//   late final String comment;
//   late final User user;
  
//   Comments.fromJson(Map<String, dynamic> json){
//     comment = json['comment'];
//     user = User.fromJson(json['User']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['comment'] = comment;
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



class CommentList {
  CommentList({
    required this.statusCode,
    required this.type,
    required this.data,
  });
  late final int statusCode;
  late final String type;
  late final Data data;
  
  CommentList.fromJson(Map<String, dynamic> json){
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
    required this.comments,
  });
  late final List<Comments> comments;
  
  Data.fromJson(Map<String, dynamic> json){
    comments = List.from(json['Comments']).map((e)=>Comments.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Comments'] = comments.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Comments {
  Comments({
    required this.CommentsId,
    required this.comment,
    required this.user,
  });
  late final String CommentsId;
  late final String comment;
  late final User user;
  
  Comments.fromJson(Map<String, dynamic> json){
    CommentsId = json['CommentsId'];
    comment = json['comment'];
    user = User.fromJson(json['User']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['CommentsId'] = CommentsId;
    _data['comment'] = comment;
    _data['User'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.userId,
    required this.username,
    required this.email,
    required this.profilePicture,
  });
  late final String userId;
  late final String username;
  late final String email;
  late final String profilePicture;
  
  User.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    username = json['username'];
    email = json['email'];
    profilePicture = json['profilePicture'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['username'] = username;
    _data['email'] = email;
    _data['profilePicture'] = profilePicture;
    return _data;
  }
}