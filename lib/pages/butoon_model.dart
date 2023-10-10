// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class buttonModel {
  final String title;
  final String imagePath;
  final String price;
  final String Description;
  final int isSelected;
  final String text;
  final String Volume;
  buttonModel({
    required this.title,
    required this.imagePath,
    required this.price,
    required this.Description,
    required this.isSelected,
    required this.text,
    required this.Volume,
  });
 

  buttonModel copyWith({
    String? title,
    String? imagePath,
    String? price,
    String? Description,
    int? isSelected,
    String? text,
    String? Volume,
  }) {
    return buttonModel(
      title: title ?? this.title,
      imagePath: imagePath ?? this.imagePath,
      price: price ?? this.price,
      Description: Description ?? this.Description,
      isSelected: isSelected ?? this.isSelected,
      text: text ?? this.text,
      Volume: Volume ?? this.Volume,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'imagePath': imagePath,
      'price': price,
      'Description': Description,
      'isSelected': isSelected,
      'text': text,
      'Volume': Volume,
    };
  }

  factory buttonModel.fromMap(Map<String, dynamic> map) {
    return buttonModel(
      title: map['title'] as String,
      imagePath: map['imagePath'] as String,
      price: map['price'] as String,
      Description: map['Description'] as String,
      isSelected: map['isSelected'] as int,
      text: map['text'] as String,
      Volume: map['Volume'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory buttonModel.fromJson(String source) => buttonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'buttonModel(title: $title, imagePath: $imagePath, price: $price, Description: $Description, isSelected: $isSelected, text: $text, Volume: $Volume)';
  }

  @override
  bool operator ==(covariant buttonModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.imagePath == imagePath &&
      other.price == price &&
      other.Description == Description &&
      other.isSelected == isSelected &&
      other.text == text &&
      other.Volume == Volume;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      imagePath.hashCode ^
      price.hashCode ^
      Description.hashCode ^
      isSelected.hashCode ^
      text.hashCode ^
      Volume.hashCode;
  }
}
