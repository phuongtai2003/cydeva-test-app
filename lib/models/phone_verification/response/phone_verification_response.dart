import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/type_def.dart';

part 'phone_verification_response.g.dart';

@JsonSerializable()
class Data1 {
  final String? abc;
  final String? def;

  Data1({required this.abc, required this.def});

  factory Data1.fromJson(DataMap json) => _$Data1FromJson(json);

  DataMap toJson() => _$Data1ToJson(this);
}

@JsonSerializable()
class Data2 {
  final String? ghi;
  final String? jkl;

  Data2({required this.ghi, required this.jkl});

  factory Data2.fromJson(DataMap json) => _$Data2FromJson(json);

  DataMap toJson() => _$Data2ToJson(this);
}
