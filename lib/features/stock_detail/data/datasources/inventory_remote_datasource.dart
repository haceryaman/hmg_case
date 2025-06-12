import 'package:dio/dio.dart';
import 'package:hmg_case/core/utils/hmg_constants.dart';

abstract class InventoryRemoteDataSource {
  Future<void> startCounting(int id);
}

class InventoryRemoteDataSourceImpl implements InventoryRemoteDataSource {
  final Dio _dio;
  InventoryRemoteDataSourceImpl(this._dio);

  @override
  Future<void> startCounting(int id) async {
    try {
      final resp = await _dio.post(
        INVENTORY_COUNTING_START,
        data: {'inventory_counting_id': id},
      );

      if (resp.statusCode != 200) {
        if (resp.statusCode == 401) {
          throw Exception('Yetkisiz erişim (401)');
        }
        throw Exception('İstek başarısız: ${resp.statusCode}');
      }
    } on DioError catch (e) {
      final code = e.response?.statusCode;
      if (code == 401) {
        throw Exception('Yetkisiz erişim (401)');
      }
      throw Exception('Sunucu hatası: ${code ?? 'Bilinmiyor'}');
    }
  }
}
