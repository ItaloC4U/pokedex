import 'package:pokedex/domain/data/ilog_data.dart';

class LogDataSpy implements ILogData {
  String? message;
  Map<String, dynamic>? addParams;

  @override
  Future<void> logError(String message, Map<String, dynamic> addParams) async {
    this.message = message;
    this.addParams = addParams;
  }
}
