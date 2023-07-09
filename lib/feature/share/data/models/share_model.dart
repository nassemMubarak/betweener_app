
import 'package:betweener_app/feature/share/domain/entities/share.dart';

class ShareModel extends Share{
  ShareModel({required super.id, required super.name, required super.link});
  factory ShareModel.fromJson(Map<String,dynamic> json){
    return ShareModel(id: json['id'], name: json['name'], link: json['link']);
  }

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'name':name,
      'link':link
    };
  }
}