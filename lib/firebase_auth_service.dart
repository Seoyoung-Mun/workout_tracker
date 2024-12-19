import 'package:firebase_auth/firebase_auth.dart';
import 'package:workout_tracker/exception_handler.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth; // instance를 private으로 선언

  FirebaseAuthService() : _auth = FirebaseAuth.instance {
    //Initializer List는 객체가 생성될 때 인스턴스 변수를 초기화하는 방법
    // 이 방식은 final 변수나 private 변수를 생성자에서 초기화할 때 주로 사용
    _auth.setLanguageCode('kr'); // 로그인 페이지의 언어를 한국어로 설정
  }

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
        //공식문서에서 참고한 에러 코드
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

  Future<void> resetPassword() async {
    //비밀번호 재설정
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
}
