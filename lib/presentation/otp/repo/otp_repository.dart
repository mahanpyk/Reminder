import 'package:reminder/app/base/api_result.dart';
import 'package:reminder/app/base/base_repository.dart';

//todo
abstract class OTPRepository extends BaseRepository {
  Future<ApiResult> otp({
    required String userName,
    required String key,
    required int otp,
  });
}

class OTPRepositoryImp extends OTPRepository {
  @override
  Future<ApiResult> otp({
    required String userName,
    required String key,
    required int otp,
  }) async {
    final response = await postRequest(
      url: 'auth/verify',
      parameters: <String, dynamic>{
        'username': userName,
        'key': key,
        'otp': otp
      },
    ).catchError((onError) {
      return ApiResult.failure(error: onError.message);
    });
    return ApiResult.success(data: response);
  }
}
