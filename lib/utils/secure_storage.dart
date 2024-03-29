import 'package:flutter_secure_storage/flutter_secure_storage.dart';


const FlutterSecureStorage secureStorage = FlutterSecureStorage();

Future saveStringToLocalStorage(String key,String value) async{
  await secureStorage.write(key: key, value:value);
}

Future getStringFromLocalStorage(String key) async{
  return secureStorage.read(key: key);
}
