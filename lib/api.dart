import 'package:crossover_test/models/flashcard.dart';
import 'package:crossover_test/models/mcq.dart';
import 'package:crossover_test/models/mcqresponse.dart';
import 'package:dio/dio.dart';

class Api {
  late Dio dio;

  Api() {
    var dioOptions = BaseOptions(
        baseUrl: "https://cross-platform.rp.devfactory.com",
        headers: Map<String, dynamic>.of({
          "Content-Type": "application/json",
          "Accept": "application/json"
        }));
    dio = Dio(dioOptions);
  }

  Future<FlashCard> fetchNextFollowing() async {
    var response = await dio.get('/following');
    return FlashCard.fromJson(response.data);
  }

  Future<MCQ> fetchNextForYou() async {
    var response = await dio.get('/for_you');
    return MCQ.fromJson(response.data);
  }

  Future<McqResponse> fetchMcqAnswer(int id) async {
    var response = await dio.get('/reveal', queryParameters: {"id": id});
    return McqResponse.fromJson(response.data);
  }
}
