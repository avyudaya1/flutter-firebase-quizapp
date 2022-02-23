import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Food {
  String id;
  String title;
  String description;
  String img;

  Food({
    this.id = '',
    this.title = '',
    this.description = '',
    this.img = 'default.png',
  });

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);
  Map<String, dynamic> toJson() => _$FoodToJson(this);
}
