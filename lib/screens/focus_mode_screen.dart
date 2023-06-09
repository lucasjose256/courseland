// ignore_for_file: prefer_const_constructors

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shake/shake.dart';

/**Mostra um timer que pode ter seu tempo definido conforme os pre-sets.
 * Com ele o usuário escolhe um tempo para estudar.
 * E com isso caso a pessoa tente mexer no celular, o programa identifica se ouve movimento
 * e mostra uma mensagem de alerta
 * 
 */
class FocusMode extends StatefulWidget {
  const FocusMode({Key? key}) : super(key: key);

  @override
  State<FocusMode> createState() => _FocusModeState();
}

class _FocusModeState extends State<FocusMode> {
  late ShakeDetector detector;
  Color colorRing = Color.fromARGB(255, 0, 0, 0);
  Color colorFill = Colors.grey;
  bool isOcupade = false;
  @override
  void initState() {
    turnOnFocusMode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void turnOffFocusMode() {
    isOcupade = false;
    _controller.reset();
    // flag = false;
  }

  void turnOnFocusMode() {
    bool flag = true;
    userAccelerometerEvents.listen(
      (UserAccelerometerEvent event) {
        /*  print('x' + event.x.toString());
        print('z' + event.z.toString());
        print('y' + event.y.toString());*/

        if ((event.x > 0.5 || event.y > 0.5 || event.z > 0.5) &&
            flag &&
            isOcupade) {
          flag = false;
          _controller.pause();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              actions: [
                TextButton(
                    onPressed: () {
                      flag = true;
                      Navigator.of(context).pop();
                      setState(() {
                        _controller.resume();
                      });
                    },
                    child: Text('Ok'))
              ],
              title: Text('FOCO'),
              content: const Text('MANTENHA O FOCO'),
            ),
          );
        }
      },
    );
  }

  CountDownController _controller = CountDownController();
  bool _isPause = true;
  int timer = 2;
  @override
  Widget build(BuildContext context) {
    var controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Focus Mode'),
        backgroundColor: colorFill,
        centerTitle: true,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: (() {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 200,
                    child: ListWheelScrollView(
                      onSelectedItemChanged: (value) {
                        timer = value;
                        if (mounted) setState(() {});
                      },
                      controller: controller,
                      itemExtent: 50,
                      children: List.generate(
                        24,
                        (index) => Text(index.toString(),
                            style: TextStyle(fontSize: 30)),
                      ),
                    ),
                  );
                },
              );
            }),
            child: Center(
              child: CircularCountDownTimer(
                autoStart: false,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                duration: timer,
                fillColor: Color.fromARGB(255, 255, 255, 255),
                ringColor: colorRing,
                backgroundGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 1),
                  colors: <Color>[
                    colorRing,
                    colorRing.withAlpha(45),
                    colorRing.withBlue(100)
                    //colorRing.withAlpha(45),
                  ], // Gradient from https://learnui.design/tools/gradient-generator.html
                  tileMode: TileMode.mirror,
                ),
                controller: _controller,
                backgroundColor: Colors.white54,
                strokeWidth: 20.0,
                strokeCap: StrokeCap.round,
                isTimerTextShown: true,
                isReverse: true,
                onComplete: () {
                  turnOffFocusMode();
                  //mudar a mensagem e o estilo do dialog
                  //  _dialogBuilder(context);
                },
                textStyle: TextStyle(fontSize: 50.0, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                preSetsTimer(20, Colors.green),
                preSetsTimer(30, Color.fromARGB(255, 184, 227, 28)),
                preSetsTimer(40, Color.fromARGB(255, 252, 134, 61)),
                preSetsTimer(50, Color.fromARGB(255, 234, 87, 14)),
                preSetsTimer(60, Color.fromARGB(255, 255, 0, 0)),
              ]),
            ),
          ),
          MaterialButton(
            child: Icon(_isPause ? Icons.play_arrow : Icons.pause),
            onPressed: () {
              setState(() {
                _controller.resume();
                _isPause = false;
              });
              /*    setState(() {
                if (_isPause) {
                  _isPause = false;

                  _controller.resume();
                } else {
                  _isPause = true;
                  _controller.pause();
                }
                _controller.start();
              });*/
            },
            color: Colors.amber,
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            child: Text('Reset'),
            color: Colors.orange,
            onPressed: () {
              setState(() {
                _controller.reset();
              });
            },
          )
        ],
      ),
    );
  }

  GestureDetector preSetsTimer(int x, Color c) {
    return GestureDetector(
        onTap: () {
          isOcupade = true;
          colorFill = c.withOpacity(0.5);
          colorRing = c;

          timer = Duration(/*minutes: x*/ seconds: 3).inSeconds;
          setState(() {
            _controller.restart(duration: timer);
          });
        },
        child: CircleAvatar(
          radius: 50,
          foregroundColor: Color.fromARGB(255, 255, 255, 255),
          child: Text(
            '$x MIN',
            style: TextStyle(
              fontSize: 25,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          backgroundColor: c,
        ));
  }
}

Future<void> dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 100,
        width: 100,
        color: Colors.green,
        child: Text('choose'),
      );
      /*AlertDialog(
        title: const Text('Basic dialog title'),
        content: const Text(
          'A dialog is a type of modal window that\n'
          'appears in front of app content to\n'
          'provide critical information, or prompt\n'
          'for a decision to be made.',
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Disable'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Enable'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );*/
    },
  );
}
