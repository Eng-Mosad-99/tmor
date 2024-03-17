import 'package:get_storage/get_storage.dart';

class LanguageLocalStorage {
  /// write
  void saveLocalLanguage(String language) async {
    await GetStorage().write('lang', language);
  }

  /// read
  Future<String?> get localLanguageSelected async {
    // ignore: await_only_futures
    return await GetStorage().read('lang');
  }
}
