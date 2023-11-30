class UserFeeds {
  UserFeeds({
    required this.statusCode,
    required this.type,
    required this.userFeed,
  });
  late final int statusCode;
  late final String type;
  late final List<UserFeed> userFeed;

  UserFeeds.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    type = json['type'];
    userFeed =
        List.from(json['user_Feed']).map((e) => UserFeed.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['statusCode'] = statusCode;
    _data['type'] = type;
    _data['user_Feed'] = userFeed.map((e) => e.toJson()).toList();
    return _data;
  }
}

class UserFeed {
  UserFeed({
    required this.userData,
    required this.userPosts,
  });
  late final UserData userData;
  late final UserPosts userPosts;

  UserFeed.fromJson(Map<String, dynamic> json) {
    userData = UserData.fromJson(json['UserData']);
    userPosts = UserPosts.fromJson(json['UserPosts']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['UserData'] = userData.toJson();
    _data['UserPosts'] = userPosts.toJson();
    return _data;
  }
}

class UserData {
  UserData({
    required this.id,
    required this.username,
    required this.email,
    required this.fullName,
    required this.profilePic,
  });
  late final String id;
  late final String username;
  late final String email;
  late final String fullName;
  late final String profilePic;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    fullName = json['fullName'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['fullName'] = fullName;
    _data['profilePic'] = profilePic;
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
    required this.createdAt,
    required this.isLiked,
  });
  late final String id;
  late final String userId;
  late final String url;
  late final String mediaType;
  late final String caption;
  late int likeCount;
  late final int commentCount;
  late final String createdAt;
  late bool isLiked;

  UserPosts.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userId = json['userId'];
    url = json['url'];
    mediaType = json['mediaType'];
    caption = json['caption'];
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
    createdAt = json['createdAt'];
    isLiked = json['isLiked'];
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
    _data['createdAt'] = createdAt;
    _data['isLiked'] = isLiked;
    return _data;
  }
}
