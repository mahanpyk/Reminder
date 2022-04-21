import 'package:reminder/app/base/api_result.dart';
import 'package:reminder/app/base/base_repository.dart';

//todo
abstract class OTPRepository extends BaseRepository {
  Future<ApiResult<Map>> otp({
    required String userName,
    required String key,
    required int otp,
  });
}

class OTPRepositoryImp extends OTPRepository {
  @override
  Future<ApiResult<Map>> otp({
    required String userName,
    required String key,
    required int otp,
  }) async {
    final response = await postRequest(
      url: 'auth/verify',
      parameters: <String, dynamic>{
        'username': userName,
        'key': key,
        'otp': otp,
      },
    );
    if (response == Exception()) {
      return ApiResult.failure(error: response);
    } else {
      return ApiResult.success(data: response);
    }
  }
}
