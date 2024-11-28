import 'package:pixabay_flutter/core/data/api/schemes/api.dart';
import 'package:pixabay_flutter/core/data/di/types.dart';
import 'package:retrofit/retrofit.dart';

@RestApi()
class MockedApi extends BaseApi {

  MockedApi(super.dio, {@baseUrl required super.baseUrl});

  // @override
  // Future<BaseResponse<ResponseGetAbc>> getAbc() async {
  //   await Future.delayed(const Duration(milliseconds: 1500));
  //
  //   final json = await rootBundle.loadString(Assets.data.mocks.abc);
  //
  //   fromJson(json) => ResponseGetAbc.fromJson(json);
  //
  //   return BaseResponse.fromJson(jsonDecode(json), fromJson);
  // }
}
