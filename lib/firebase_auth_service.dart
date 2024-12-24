import 'package:firebase_auth/firebase_auth.dart';
import 'package:workout_tracker/exception_handler.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth; // instance를 private으로 선언

  FirebaseAuthService() : _auth = FirebaseAuth.instance {
    //Initializer List는 객체가 생성될 때 인스턴스 변수를 초기화하는 방법
    // 이 방식은 final 변수나 private 변수를 생성자에서 초기화할 때 주로 사용
    _auth.setLanguageCode('kr'); // 로그인 페이지의 언어를 한국어로 설정
  }

  User? get user => _auth.currentUser; // 현재 로그인한 유저의 정보를 가져와 user 변수에 저장

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    String? name,
  }) async {
    String? errorMessage;
    //회원가입 코드
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _auth.currentUser?.updateDisplayName(name);
      await _auth.currentUser?.sendEmailVerification(); // 가입 후 이메일 인증 메일 발송
    } on FirebaseAuthException catch (error) {
      //회원가입 실패 시 에러 처리
      print(error);
      switch (error.code) {
      //공식문서(https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html)에서 참고한 에러 코드
        case 'weak-password':
          errorMessage = '비밀번호가 취약합니다. 최소 6자리 이상의 문자를 입력하세요.';
          break;
        case 'email-already-in-use':
          errorMessage = '이미 사용중인 이메일입니다.';
          break;
        case 'invalid-email':
          errorMessage = '유효하지 않은 이메일입니다.';
          break;
        case 'operation-not-allowed':
          errorMessage = '이메일/비밀번호 로그인이 비활성화 되어있습니다.';
          break;
        default:
          errorMessage = error.message ?? '회원가입에 실패하였습니다. 다시 시도해주세요.';
      }
    } catch (e) {
      //회원가입 실패 시 에러 처리
      errorMessage = '알 수 없는 에러 발생';
      return;
    }

    if (errorMessage != null) {
      //에러 메시지 출력
      throw WTException(errorMessage);
    }
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    //로그인 코드
    String? errorMessage;
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'invalid-email':
          errorMessage = '이메일 형식이 올바르지 않습니다.';
          break;
        case 'user-not-found':
          errorMessage = '회원이 존재하지 않는 이메일입니다.';
          break;
        case 'wrong-password':
          errorMessage = '비밀번호가 잘못되었습니다.';
          break;
        case 'user-disabled':
          errorMessage = '사용이 중지된 계정입니다.';
          break;
        default:
          errorMessage = '로그인에 실패하였습니다.';
      }
    } catch (e) {
      errorMessage = '로그인 실패: $e';
    }
    if (errorMessage != null) {
      throw WTException(errorMessage);
    }
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    String? errorMessage;
    //비밀번호 재설정
    try {
      await _auth.sendPasswordResetEmail(email: email);
      print('비밀번호 재설정 이메일이 전송되었습니다.');
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'auth/user-not-found':
          errorMessage = '해당 이메일로 가입된 사용자가 없습니다.';
          break;
        case 'auth/invalid-email':
          errorMessage = '유효하지 않은 이메일입니다.';
          break;
        default:
          errorMessage = error.message ?? '알 수 없는 오류가 발생했습니다.';
      }
    } catch (error) {
      errorMessage = '알 수 없는 오류가 발생했습니다.';
    }
    if (errorMessage != null) {
      throw Exception(errorMessage);
    }
  }

  Future<void> deleteAccount() async {
    //회원탈퇴
  }

  Future<void> singOut() async {
    //로그아웃
    try {
      await _auth.signOut();
    } catch (e) {
      throw WTException(e.toString());
    }
  }

  bool isLoggedIn() {
    //로그인 여부 확인
    return _auth.currentUser != null;
  }

  Future<void> updateName(String? displayName) async {
    //유저 이름 수정
    try {
      await _auth.currentUser?.updateDisplayName(displayName);
    } catch (e) {
      throw Exception('수정 실패:$e');
    }
  }



}
