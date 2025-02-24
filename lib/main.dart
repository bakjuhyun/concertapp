import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:concertapp/logonpage.dart';


// Splash 상태를 관리하는 Provider
final splashCompletedProvider = StateProvider<bool>((ref) => false);
// Firebase 인증 상태를 관리하는 Provider
final authStateProvider = StreamProvider<User?>(
      (ref) => FirebaseAuth.instance.authStateChanges(),
);

//  main 함수
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Firebase 초기화
  runApp(ProviderScope(child: MyApp()));
}

//  MyApp 클래스
class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Splash 상태를 참조
    final isSplashCompleted = ref.watch(splashCompletedProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isSplashCompleted ? AuthGate() : SplashScreen(),

    );
  }
}

// 스플래쉬 화면 클래스
class SplashScreen extends ConsumerStatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      ref.read(splashCompletedProvider.notifier).state = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Center(
          child: Image.asset(
            'asset/logo/concert_splash.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}

// 로딩, 오류발생화면 클래스
class AuthGate extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) {
        if (user == null) {
          return LoginPage();
        } else {
          return HomePage(); // Replace with your home page
        }
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('오류 발생: $err')),
    );
  }
}

// AuthState 상태 클래스 정의
class AuthState {
  final bool isLoading;
  final String? errorMessage;

  AuthState({this.isLoading = false, this.errorMessage});
}

// AuthNotifier: 로그인 및 회원가입 상태 관리
class AuthNotifier extends StateNotifier<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthNotifier() : super(AuthState());

  // 로그인
  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      state = AuthState(errorMessage: '이메일과 비밀번호를 입력해주세요.');
      return;
    }

    state = AuthState(isLoading: true);
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      state = AuthState(); // 성공 시 초기 상태로
    } catch (e) {
      state = AuthState(errorMessage: '로그인 실패: ${e.toString()}');
    }
  }

  // 회원가입
  Future<void> register(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      state = AuthState(errorMessage: '이메일과 비밀번호를 입력해주세요.');
      return;
    }

    state = AuthState(isLoading: true);
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      state = AuthState(errorMessage: '회원가입 성공! 로그인 해주세요.');
    } catch (e) {
      state = AuthState(errorMessage: '회원가입 실패: ${e.toString()}');
    }
  }
}

// Provider 정의
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

// 로그인 화면 클래스
class LoginPage extends ConsumerWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // AuthState 참조
    final authState = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text('concert')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'E.mail'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(height: 50),
            if (authState.isLoading)
              Center(child: CircularProgressIndicator()),
            if (!authState.isLoading) ...[
              ElevatedButton(
                onPressed: () {
                  authNotifier.login(
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: Text('sign in'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  authNotifier.register(
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: Text('sign up'),
              ),
            ],
            if (authState.errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  authState.errorMessage!,
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
