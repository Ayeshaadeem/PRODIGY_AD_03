import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch_app/model.dart';
import 'package:stopwatch_app/video.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => StopwatchModel(),
      child: StopwatchApp(),
    ),
  );
}

class StopwatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StopwatchScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StopwatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stopwatchModel = Provider.of<StopwatchModel>(context);

    String formatDuration(Duration duration) {
      String twoDigits(int n) => n.toString().padLeft(2, "0");
      String threeDigits(int n) => n.toString().padLeft(3, "0");
      String minutes = twoDigits(duration.inMinutes.remainder(60));
      String seconds = twoDigits(duration.inSeconds.remainder(60));
      String milliseconds =
          threeDigits(duration.inMilliseconds.remainder(1000));
      return "$minutes:$seconds:$milliseconds";
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 20,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          BackgroundVideo(),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 220, left: 60, right: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    formatDuration(stopwatchModel.elapsed),
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      letterSpacing: 3,
                      shadows: [
                        Shadow(color: Colors.pink.shade800, blurRadius: 4),
                        Shadow(color: Colors.pink.shade600, blurRadius: 8),
                        Shadow(color: Colors.pink.shade400, blurRadius: 12),
                        Shadow(color: Colors.pink.shade200, blurRadius: 12),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: stopwatchModel.lap,
                        child: Text('Lap'),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: BorderSide(
                                color: Colors.white,
                                width: 1.5,
                              ),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent,
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white,
                          ),
                          elevation: MaterialStateProperty.resolveWith<double>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return 1;
                              }
                              return 1;
                            },
                          ),
                          shadowColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.pink.shade100;
                              }
                              return Colors.pink.shade600;
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: stopwatchModel.start,
                        child: Text('Start'),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: BorderSide(
                                color: Colors.white,
                                width: 1.5,
                              ),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent,
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white,
                          ),
                          elevation: MaterialStateProperty.resolveWith<double>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return 1;
                              }
                              return 1;
                            },
                          ),
                          shadowColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.pink.shade100;
                              }
                              return Colors.pink.shade600;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: stopwatchModel.pause,
                        child: Text('Pause'),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: BorderSide(
                                color: Colors.white,
                                width: 1.5,
                              ),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent,
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white,
                          ),
                          elevation: MaterialStateProperty.resolveWith<double>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return 1;
                              }
                              return 1;
                            },
                          ),
                          shadowColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.pink.shade100;
                              }
                              return Colors.pink.shade600;
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: stopwatchModel.reset,
                        child: Text('Reset'),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: BorderSide(
                                color: Colors.white,
                                width: 1.5,
                              ),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent,
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white,
                          ),
                          elevation: MaterialStateProperty.resolveWith<double>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return 1;
                              }
                              return 1;
                            },
                          ),
                          shadowColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.pink.shade100;
                              }
                              return Colors.pink.shade600;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: stopwatchModel.laps.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 0.0),
                          padding: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.pink.shade200, blurRadius: 3),
                              BoxShadow(
                                  color: Colors.pink.shade100, blurRadius: 6),
                            ],
                          ),
                          child: ListTile(
                            title: Text(
                              'Lap ${index + 1}: ${formatDuration(stopwatchModel.laps[index])}',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 129, 13, 66)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
