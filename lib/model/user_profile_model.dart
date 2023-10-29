class UserProfileModel {
  UserProfileModel({
    required this.statusCode,
    required this.type,
    required this.data,
  });
  late final int statusCode;
  late final String type;
  late final Data data;

  UserProfileModel.fromJson(Map<String, dynamic> json) {
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
    required this.userPofile,
  });
  late final List<UserPofile> userPofile;

  Data.fromJson(Map<String, dynamic> json) {
    userPofile = List.from(json['UserPofile'])
        .map((e) => UserPofile.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['UserPofile'] = userPofile.map((e) => e.toJson()).toList();
    return _data;
  }
}

class UserPofile {
  UserPofile({
    required this.username,
    required this.email,
    required this.followerCount,
    required this.followingCount,
    required this.postCount,
    required this.userPosts,
  });
  late final String username;
  late final String email;
  late final int followerCount;
  late final int followingCount;
  late final int postCount;
  late final List<UserPosts> userPosts;

  UserPofile.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    followerCount = json['followerCount'];
    followingCount = json['followingCount'];
    postCount = json['postCount'];
    userPosts =
        List.from(json['UserPosts']).map((e) => UserPosts.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    _data['followerCount'] = followerCount;
    _data['followingCount'] = followingCount;
    _data['postCount'] = postCount;
    _data['UserPosts'] = userPosts.map((e) => e.toJson()).toList();
    return _data;
  }
}

class UserPosts {
  UserPosts({
    required this.id,
    required this.userId,
    required this.url,
    required this.mediaType,
    required this.caption,
    required this.likeCount,
    required this.commentCount,
  });
  late final String id;
  late final String userId;
  late final String url;
  late final String mediaType;
  late final String caption;
  late final int likeCount;
  late final int commentCount;

  UserPosts.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userId = json['userId'];
    url = json['url'];
    mediaType = json['mediaType'];
    caption = json['caption'];
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['userId'] = userId;
    _data['url'] = url;
    _data['mediaType'] = mediaType;
    _data['caption'] = caption;
    _data['likeCount'] = likeCount;
    _data['commentCount'] = commentCount;
    return _data;
  }
}