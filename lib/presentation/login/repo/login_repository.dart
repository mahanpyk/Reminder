import 'package:reminder/app/base/api_result.dart';
import 'package:reminder/app/base/base_repository.dart';

abstract class LoginRepository extends BaseRepository {
  Future<ApiResult> login({required String userName});
}

class LoginRepositoryImp extends LoginRepository {
  @override
  Future<ApiResult> login({required String userName}) async {
    final response = await postRequest(
      url: 'auth/login',
      parameters: <String, String>{
        'username': userName,
      },
    );
    if (response == Exception()) {
      return ApiResult.failure(error: response);
    }
    return ApiResult.success(data: response);
  }
}
