import 'dart:io';

class sendImageModel {
  int id;
  final String title;
  final File image;

  sendImageModel({required this.id, required this.title, required this.image});

  factory sendImageModel.fromJson(Map<String, dynamic> json) {
    return sendImageModel(
        id: json['id'], title: json['title'], image: json['image']);
  }
  dynamic toJson() => {'id': DateTime.now(), 'title': title, 'image': image};
}
