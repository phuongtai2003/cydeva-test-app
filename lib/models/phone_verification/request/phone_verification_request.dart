import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/type_def.dart';
part 'phone_verification_request.g.dart';

@JsonSerializable()
class PhoneVerificationRequest {
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  PhoneVerificationRequest({required this.phoneNumber});

  factory PhoneVerificationRequest.fromJson(DataMap json) =>
      _$PhoneVerificationRequestFromJson(json);

  DataMap toJson() => _$PhoneVerificationRequestToJson(this);
}
