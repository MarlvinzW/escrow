
import 'package:json_annotation/json_annotation.dart';

part 'impl/api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiResponse {
  bool successful;
  String data;

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  ApiResponse({
    required this.successful, required this.data
});
}