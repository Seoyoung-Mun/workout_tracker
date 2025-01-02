import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class FirebaseStorageService {
  final storageRef = FirebaseStorage.instance.ref();

  Future<String> uploadProfileImage(
      Uint8List bytes, String path, String? uid) async {
    if (uid == null) throw Exception('잘못된 접근입니다.');
    try {
      final profileRef =
          storageRef.child('user_profiles/${uid}_profile_image.png');
      final metadata = SettableMetadata(
          contentType: 'image/png', //타입을 강제로 지정해줄 수 있다.
          customMetadata: {'picked-file-path': path});
      await profileRef.putData(bytes, metadata);
      final downloadUrl = await profileRef.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('upload 실패');
    }
  }

  Future<void> deleteProfileImage(String? uid) async {
    if (uid == null) throw Exception('잘못된 접근입니다.');
    try {
      final profileRef =
          storageRef.child('user_profiles/${uid}_profile_image.png');
      await profileRef.delete();
    } catch (e) {
      throw Exception('삭제 실패');
    }
  }
}