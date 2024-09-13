import 'package:dio/dio.dart';

import '../../models/api_configuration_model.dart';
import '../../models/api_result_model.dart';
import '../../utils/utils.dart';
import 'get_configurations_client.dart';

class GetConfigurationsImpl implements IGetConfigurationsClient {
  @override
  Future<ApiResult<ApiConfigurationModel>> requestConfigurations() async {
    try {
      final dio = Dio();
      const token = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMjM2OGVkNDA3NTQ5NjZlYzYyYzBlNjczYTVhMzljMyIsIm5iZiI6MTcyNDcxNzcyOC4yMjIyNjUsInN1YiI6IjY2Y2QxOTgxOGYyMGMxNTllYTk3YzFjNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.us5MNUDpNHzN1wMcAj7LbplZk8hIGz-EN_dNkp_Prps';
      final response = await dio.get('https://api.themoviedb.org/3/configuration',
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
            },
          ));

      final result = response.data;

      return ApiResult.success(ApiConfigurationModel.fromJson(result));
    } catch (exception) {
      return ApiResult.error(extractErrorMessage(exception as Exception) ?? 'Error during API configurations request');
    }
  }
}
