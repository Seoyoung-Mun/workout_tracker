class WTException implements Exception{ //Exception 클래스를 상속받아 새로운 예외클래스를 만듦
  String? message;
  WTException(this.message);
}