// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_verification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneVerificationRequest _$PhoneVerificationRequestFromJson(
        Map<String, dynamic> json) =>
    PhoneVerificationRequest(
      phoneNumber: json['phone_number'] as String,
    );

Map<String, dynamic> _$PhoneVerificationRequestToJson(
        PhoneVerificationRequest instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
    };
