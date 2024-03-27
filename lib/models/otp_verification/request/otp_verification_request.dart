import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/type_def.dart';

part 'otp_verification_request.g.dart';

@JsonSerializable()
class OtpVerificationRequest {
  @JsonKey(name: 'code')
  final String code;

  OtpVerificationRequest({required this.code});

  factory OtpVerificationRequest.fromJson(DataMap json) =>
      _$OtpVerificationRequestFromJson(json);

  DataMap toJson() => _$OtpVerificationRequestToJson(this);
}
