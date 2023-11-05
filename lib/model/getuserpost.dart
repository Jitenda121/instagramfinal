class GetUserPost {
  GetUserPost({
    required this.statusCode,
    required this.type,
    required this.data,
  });
  late final int statusCode;
  late final String type;
  late final Data data;
  
  GetUserPost.fromJson(Map<String, dynamic> json){
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
    required this.posts,
  });
  late final List<Posts> posts;
  
  Data.fromJson(Map<String, dynamic> json){
    posts = List.from(json['Posts']).map((e)=>Posts.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Posts'] = posts.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Posts {
  Posts({
    required this.id,
    required this.userId,
    required this.url,
    required this.mediaType,
    required this.caption,
    required this.likeCount,
    required this.commentCount,
    required this.postStatus,
    required this.createdAt,
  });
  late final String id;
  late final String userId;
  late final String url;
  late final String mediaType;
  late final String caption;
  late final int likeCount;
  late final int commentCount;
  late final bool postStatus;
  late final String createdAt;
  
  Posts.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    userId = json['userId'];
    url = json['url'];
    mediaType = json['mediaType'];
    caption = json['caption'];
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
    postStatus = json['postStatus'];
    createdAt = json['createdAt'];
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
    _data['postStatus'] = postStatus;
    _data['createdAt'] = createdAt;
    return _data;
  }
}