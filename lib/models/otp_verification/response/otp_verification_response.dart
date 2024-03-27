import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/type_def.dart';

part 'otp_verification_response.g.dart';

@JsonSerializable()
class OtpVerificationResponseData {
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  OtpVerificationResponseData({required this.phoneNumber});

  factory OtpVerificationResponseData.fromJson(DataMap json) =>
      _$OtpVerificationResponseDataFromJson(json);

  DataMap toJson() => _$OtpVerificationResponseDataToJson(this);
}
