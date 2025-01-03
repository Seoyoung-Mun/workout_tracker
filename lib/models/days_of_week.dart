//enum타입은 고정된 값을 가지는 타입 (상수)
//Simple enum은 index, value 를 가진다. value자리에 한글 값을 입력할 수 없다 따라서 enganced enum으로 확장시켜야 한다.
// enum DaysOfWeekSimple { monday, tuesday, wednesday, thursday, friday, saturday, sunday}

//enhanced enum
enum DaysOfWeek {
  monday('월'),
  tuesday('화'),
  wednesday('수'),
  thursday('목'),
  friday('금'),
  saturday('토'),
  sunday('일');

  final String kor; //프로퍼티
  const DaysOfWeek(this.kor); //생성자(constructor)

  static DaysOfWeek fromIndex(int index) {
    return DaysOfWeek.values[index];
  }
}

//장점은 외부에서 DaysOfWeek.monday.name, DaysOfWeek.monday.kor, DaysOfWeek.values[0] 등으로 사용할 수 있다
