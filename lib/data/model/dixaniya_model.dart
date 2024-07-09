import 'package:cor/data/local/local_db.dart';

class DixaniyaModel {
  final int? id;
  final String title;
  final DateTime createdDate;

  DixaniyaModel({this.id, required this.title, required this.createdDate});

  // Factory constructor for creating a new DixaniyaModel instance from a map.
  factory DixaniyaModel.fromJson(Map<String, dynamic> json) {
    return DixaniyaModel(
      id: json[DixaniyaConstants.id],
      title: json[DixaniyaConstants.title],
      createdDate: DateTime.parse(json[DixaniyaConstants.createdAt]),
    );
  }

  // Method to convert a DixaniyaModel instance to a map.
  Map<String, dynamic> toJson() {
    return {
      DixaniyaConstants.id : id,
      DixaniyaConstants.title: title,
      DixaniyaConstants.createdAt :  createdDate.toIso8601String(),
    };
  }

  DixaniyaModel copyWith({int? id, String? title, DateTime? createdDate}) {
    return DixaniyaModel(
      id: id ?? this.id,
      title: title ?? this.title,
      createdDate: createdDate ?? this.createdDate,
    );
  }
}
