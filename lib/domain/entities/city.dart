import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  @JsonKey(name: 'city_id')
  final int id;
  @JsonKey(name: 'city_name')
  final String name;
  @JsonKey(name: 'country_full')
  final String country;
  City(
    this.id,
    this.name,
    this.country,
  );
  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
}
