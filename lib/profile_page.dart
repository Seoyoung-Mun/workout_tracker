import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:workout_tracker/firebase_auth_service.dart';
import 'package:workout_tracker/show_snackbar.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? profileImageURL = 'https://healthyclass.kr/sample.jpg'; //예시

  final _auth = FirebaseAuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = _auth.user?.displayName;
    email = _auth.user?.email;
    profileImageURL = _auth.user?.photoURL;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('프로필 설정'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: profileImageURL != null
                      ? NetworkImage(profileImageURL!)
                      : const AssetImage('assets/me.jpg'),
                  onBackgroundImageError: (_, __) {
                    if (profileImageURL != null) {
                      setState(() {
                        profileImageURL = null;
                      });
                    }
                    //WidgetsBinding이하로 작동되지 않아 주석처리. if문으로 대체
                    // WidgetsBinding.instance.addPostFrameCallback((_){
                    //   setState(() {
                    //     profileImageURL = null;
                    //   });
                    // });
                  },
                ),
              ),
              TextFormField(
                initialValue: name,
                decoration: InputDecoration(
                    labelText: 'name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이름을 입력해주세요.';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value;
                },
              ),
              TextFormField(
                initialValue: email, // 이메일 기본값으로 설정
                decoration: InputDecoration(
                  enabled: false,
                  // input 비활성화
                  labelText: 'Email',
                  hintText: 'example@example.com',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이메일을 입력하세요.';
                  }
                  if (!RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$')
                      .hasMatch(value)) {
                    return '이메일 형식으로 입력해주세요.';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('이메일인증을 아직 안하셨나요?'),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Send Email',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      _auth.updateName(name).then((_) {
                        showSnackBar(context, '수정 되었습니다.');
                      }).catchError((e) {
                        showSnackBar(context, e.toString());
                      });
                    }
                  },
                  child: Text('수정'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '로그아웃',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  Text('|'),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '회원탈퇴',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
