import 'package:json_annotation/json_annotation.dart';

// run flutter pub run build_runner build to generate the part file
part 'location.g.dart';

@JsonSerializable()
class Location {
  const Location({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  final int id;
  final String name;
  final double latitude;
  final double longitude;
}
