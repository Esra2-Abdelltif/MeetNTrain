import 'package:equatable/equatable.dart';

class Images extends Equatable {
  final String url;

  Images({ required this.url});

  @override
  List<Object?> get props => [url];
}
