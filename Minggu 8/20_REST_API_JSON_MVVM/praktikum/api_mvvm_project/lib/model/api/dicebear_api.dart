import 'package:dio/dio.dart';

class DicebearApi {
  Future<String> getDicebear({required String query, required String artStyle}) async {
    final response = await Dio().get(
      'https://api.dicebear.com/7.x/$artStyle/svg',
      queryParameters: {
        "seed" : query
      }
    );

    //Untuk menampilkan data GET berhasil difetch (Soal Prioritas 2 dan Soal Eksplorasi)
    print("Response Status Code : ${response.statusCode}");

    String svgString = response.data.toString();
    print("Svg String dari GET API : imageString = $svgString");

    return svgString;
  }
}