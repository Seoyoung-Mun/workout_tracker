// class WTException implements Exception{ //Exception 클래스를 상속받아 새로운 예외클래스를 만듦
//   String? message;
//   WTException(this.message);
// }

class WTException implements Exception {
  final String? message; // 예외 메시지
  final String? errorCode; // FirebaseAuthException 에러 코드 등 추가 정보
  final DateTime timestamp; // 예외 발생 시간
  final StackTrace? stackTrace; // 스택 트레이스 정보

  WTException(
      this.message, {
        this.errorCode,
        DateTime? timestamp,
        this.stackTrace,
      }) : timestamp = timestamp ?? DateTime.now(); // 예외 발생 시간 기본값 설정

  @override
  String toString() {
    return '[WTException] ${errorCode != null ? "ErrorCode: $errorCode, " : ""}Message: $message, Timestamp: $timestamp';
  }

  // 사용자 친화적인 메시지 생성
  String get userFriendlyMessage {
    return message ?? '알 수 없는 에러가 발생했습니다. 관리자에게 문의하세요.';
  }

  // 로깅용 JSON 데이터 생성
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'errorCode': errorCode,
      'timestamp': timestamp.toIso8601String(),
      'stackTrace': stackTrace?.toString(),
    };
  }
}
