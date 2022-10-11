import 'package:meet_n_train_app/features/domain/entities/images_entity.dart';

class ImagesModel extends Images {
  ImagesModel({required String url}):super(url: url);

  factory ImagesModel.fromJson(Map<String, dynamic> json) {
   return ImagesModel(url : json['url']);
  }
}
