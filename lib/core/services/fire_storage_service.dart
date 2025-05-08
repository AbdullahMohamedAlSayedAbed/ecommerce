import 'dart:io';

abstract class FireStorageService {
  Future<String> uploadFile(File file,String path);
}
