class Workout {
  String name;
  int minutes;
  String imageName;
  String audioName;
  int kcal;

  Workout({
    required this.name,
    required this.minutes,
    required this.imageName,
    required this.audioName,
    required this.kcal
  });
@override
  String toString() {
    // TODO: implement toString
  return 'name:${name}, minutes:${minutes}, imageName:${imageName}, audioName:${audioName}, kcal:${kcal}';
  return super.toString();
  }

}
