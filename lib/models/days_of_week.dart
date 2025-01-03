//enum타입은 고정된 값을 가지는 타입 (상수)
// enum DaysOfWeekSimple { monday, tuesday, wednesday, thursday, friday, saturday, sunday}

enum DaysOfWeek {
  monday('월'),
  tuesday('화'),
  wednesday('수'),
  thursday('목'),
  friday('금'),
  saturday('토'),
  sunday('일');

  final String kor;

  const DaysOfWeek(this.kor);

  static DaysOfWeek fromIndex(int index) {
    return DaysOfWeek.values[index];
  }
}
