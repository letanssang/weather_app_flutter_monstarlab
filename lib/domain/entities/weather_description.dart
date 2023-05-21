import 'package:json_annotation/json_annotation.dart';

part 'weather_description.g.dart';

@JsonSerializable()
class WeatherDescription {
  String description;
  int code;
  String icon;

  WeatherDescription(this.description, this.code, this.icon);

  factory WeatherDescription.fromJson(Map<String, dynamic> json) =>
      _$WeatherDescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDescriptionToJson(this);
}
