import 'dart:developer';

import 'package:pokedex/domain/data/ilog_data.dart';

class LogProvider implements ILogData {
  // final firebase = FirebaseCrashelit.instance
  // final uxCam = FlutterUxCam.instance
  // final dataDog = DataDog.instance

  @override
  Future<void> logError(String message, Map<String, dynamic> addParams) async {
    // firebase.log(message, addParams);
    // uxCam.log(message, addParams);
    // dataDog.log(message, addParams);
    log('Error message: $message');
    log('Additional params: ${addParams.values}');
  }
}
