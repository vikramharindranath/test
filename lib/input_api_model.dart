// To parse this JSON data, do
//
//     final fetchmodel = fetchmodelFromJson(jsonString);

class postImageModel {
  int? id;
  String? title;
  String? image;

  postImageModel({required this.id, required this.title, required this.image});

  postImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}
