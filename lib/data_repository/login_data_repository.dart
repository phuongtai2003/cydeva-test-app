import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:test_app/global_constants.dart';
import 'package:test_app/models/general_response/general_response.dart';
import 'package:test_app/models/otp_verification/request/otp_verification_request.dart';
import 'package:test_app/models/otp_verification/response/otp_verification_response.dart';
import 'package:test_app/models/phone_verification/request/phone_verification_request.dart';
import 'package:test_app/models/phone_verification/response/phone_verification_response.dart';

part 'login_data_repository.g.dart';

@RestApi(
  baseUrl: GlobalConstants.baseUrl,
)
abstract class LoginDataRepository {
  factory LoginDataRepository(Dio dio, {String baseUrl}) = _LoginDataRepository;

  @POST('/auth/user/check/exist/')
  Future<GeneralResponse<Data1>> login({
    @Body() required PhoneVerificationRequest request,
  });

  @POST('/auth/verify/otp/')
  Future<GeneralResponse<OtpVerificationResponseData>> verifyOTP({
    @Body() required OtpVerificationRequest request,
  });
}
