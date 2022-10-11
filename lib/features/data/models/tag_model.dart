import 'package:meet_n_train_app/features/domain/entities/tag_entity.dart';

class TagModel extends Tag {
  TagModel({
    required int id,
    required String title,
    required String icon,
}):super(id: id,title: title,icon: icon);

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(id: json['id'], title: json['title'], icon: json['icon']);
  }
}