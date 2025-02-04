import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/workout.dart';

class FirebaseService {
  final FirebaseFirestore _fs = FirebaseFirestore.instance;

  Future<void> createWorkout(Workout workout) async {
    final _workoutsCollection = _fs.collection('workouts');
    try {
      final docRef = await _workoutsCollection.add(workout.toMap());
      docRef.update({'id': docRef.id});
    } catch (e) {
      throw Exception('create workout err: $e');
    }
    //firebase에서는 batch, transaction을 이용해서 데이터 안정성을 확보할 수도 있음
  }

  Future<Workout> readWorkout(String workoutId) async {
    final _workoutsCollection =
        _fs.collection('workouts'); //collection안에 document를 가져오는 것
    final documentSnapshot = await _workoutsCollection
        .doc(workoutId)
        .get(); //workoutId를 가진 document를 가져오는 것

    //documentSnapshot은 exists로 document가 존재하는지 확인할 수 있음
    //querySnapshot은 존재하지 않을 시, empty라도 List에 담아서 보냄
    //queryDocumentSnapshot은 data()로 document를 가져올 수 있음
    if (!documentSnapshot.exists) throw Exception('workout not found');
    final mapData = documentSnapshot.data()!;

    return Workout.fromMap(mapData);
  }

  //workout을 전부 가져오는 것
  Future<List<Workout>> fetchAllWorkouts(
      {required String uid, Workout? lastWorkout}) async {
    final _workoutsCollection = _fs.collection('workouts');
    try {
      //pagination을 위한 코드
      Query<Map<String, dynamic>> query = await _workoutsCollection
          .where('uid', isEqualTo: uid) //uid가 일치하는 workout들을 가져오는 것
          .orderBy('createdAt') //최신순으로 정렬
          .orderBy('id') //id순으로 정렬
          .limit(5); //5개의 workout만 가져오도록 설정

      if (lastWorkout != null) { //lastWorkout이 null이 아니라면
        //lastWorkout의 createdAt과 id를 기준으로 이후의 workout들을 가져오도록 설정
        //startAfter를 사용하여 이전의 데이터를 가져올 수 있도록 설정
        query = query.startAfter( //cursor를 이용
            [lastWorkout.createdAt.millisecondsSinceEpoch, lastWorkout.id]);
        //orderBy에 포함된 내용들로 구성된 cursor이기 때문에 lastWorkout의 createdAt과 id를 기준으로 이후의 workout들을 가져오도록 설정
        print('자 여기가 커서입니다. : ${lastWorkout.createdAt.millisecondsSinceEpoch} + ${lastWorkout.id}');
      }
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await query.get();
      final queryDocumentSnapshotList = querySnapshot.docs; //List타입
      List<Workout> returnData = [];
      for (final QueryDocumentSnapshot<Map<String, dynamic>> doc
          in queryDocumentSnapshotList) {
        final mapData = doc.data(); //Map타입
        Workout w = Workout.fromMap(mapData); //Workout타입으로 전환
        returnData.add(w);
      }

      return returnData;
    } catch (e) {
      print(e.toString());
      throw Exception('fetch error');
    }

//이 과정을 압축하면 아래 return문으로 대체 가능
// return queryDocumentSnapshotList
//     .map((d) => Workout.fromMap(d.data()))
//     .toList();
  }

  Future<void> updateWorkout(Workout workout) async {
    final _workoutsCollection = _fs.collection('workouts');
    //workoutId를 document의 id로 사용하므로, workoutId를 지정하지 않아도 됨
    try {
      await _workoutsCollection.doc(workout.id).update(workout.toMap());
    } catch (e) {
      throw Exception('FirebaseService.updateWorkout: $e');
    }
  }

  Future<void> deleteWorkout(String workoutId) async {
    final _workoutsCollection = _fs.collection('workouts');
    try {
      await _workoutsCollection.doc(workoutId).delete();
    } catch (e) {
      throw Exception('FirebaseService.delete error: $e');
    }
  }
}
