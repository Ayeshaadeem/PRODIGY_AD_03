import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchModel extends ChangeNotifier {
  late Stopwatch _stopwatch;
  late Timer _timer;

  Duration _elapsed = Duration.zero;
  List<Duration> _laps = [];
  Duration _lastLapTime = Duration.zero;

  Duration get elapsed => _elapsed;
  List<Duration> get laps => _laps;

  StopwatchModel() {
    _stopwatch = Stopwatch();
  }

  void start() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      _timer = Timer.periodic(Duration(milliseconds: 1), _updateTime);
      notifyListeners();
    }
  }

  void pause() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      _timer.cancel();
      notifyListeners();
    }
  }

  void reset() {
    _stopwatch.reset();
    _elapsed = Duration.zero;
    _laps.clear();
    _lastLapTime = Duration.zero;
    notifyListeners();
  }

  void lap() {
    final currentLapTime = _stopwatch.elapsed - _lastLapTime;
    _laps.add(currentLapTime);
    _lastLapTime = _stopwatch.elapsed;
    notifyListeners();
  }

  void _updateTime(Timer timer) {
    _elapsed = _stopwatch.elapsed;
    notifyListeners();
  }
}
