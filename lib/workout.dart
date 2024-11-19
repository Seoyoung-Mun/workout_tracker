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
  return '${name}, ${minutes}, ${imageName}, ${audioName}, ${kcal}';
  return super.toString();
  }

}
