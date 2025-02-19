/*
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

// 1. Riverpod 상태 관리 클래스를 정의합니다.
class StepCounterStateNotifier extends StateNotifier<int> {
  StepCounterStateNotifier() : super(0);

  // 걸음 수 업데이트 메소드
  void updateStepCount(StepCount event) {
    state = event.steps;
  }

  // 걸음 수 초기화 메소드
  void resetStepCount() {
    state = 0;
  }
}

// 2. Riverpod Provider 생성
final stepCounterProvider = StateNotifierProvider<StepCounterStateNotifier, int>((ref) {
  return StepCounterStateNotifier();
});

void main() {
  runApp(const ProviderScope(child: MyApp())); // ProviderScope로 앱을 감싸줍니다.
}


class _StepCounterScreenState extends State<StepCounterScreen> {
  late Stream<StepCount> _stepCountStream;

  @override
  void initState() {
    super.initState();
    _startStepCounting();
  }

  // 만보기 시작
  void _startStepCounting() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(_onStepCount);
  }

  // 걸음 수 업데이트
  void _onStepCount(StepCount event) {
    // Riverpod을 통해 상태를 업데이트합니다.
    context.read(stepCounterProvider.notifier).updateStepCount(event);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step Counter with Riverpod'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, watch, child) {
            final steps = watch(stepCounterProvider); // Riverpod 상태 값 읽기
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '걸음 수: $steps',
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // 걸음 수 초기화
                    context.read(stepCounterProvider.notifier).resetStepCount();
                  },
                  child: const Text('초기화'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
*/