class NotificationListModal {
  NotificationListModal({
    required this.statusCode,
    required this.type,
    required this.data,
  });
  late final int statusCode;
  late final String type;
  late final List<Data> data;
  
  NotificationListModal.fromJson(Map<String, dynamic> json){
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
    required this.activityId,
    required this.status,
    required this.type,
    required this.title,
    required this.message,
    required this.image,
    required this.V,
  });
  late final String id;
  late final String activityId;
  late final String status;
  late final String type;
  late final String title;
  late final String message;
  late final String image;
  late final int V;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    activityId = json['activityId'];
    status = json['status'];
    type = json['type'];
    title = json['title'];
    message = json['message'];
    image = json['image'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['activityId'] = activityId;
    _data['status'] = status;
    _data['type'] = type;
    _data['title'] = title;
    _data['message'] = message;
    _data['image'] = image;
    _data['__v'] = V;
    return _data;
  }
}