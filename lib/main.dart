import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  String output = '0';

  String _output = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = '';

  bool clear = false;

  Pressed(String buttonText) {
    if (clear == true) {
      _output = '0';
      clear = false;
    }
    if (buttonText == 'CLEAR') {
      _output = '0';
      num1 = 0;
      num2 = 0;
      operand = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '÷' ||
        buttonText == 'x') {
      num1 = double.parse(output);

      operand = buttonText;

      _output = '0';
    } else if (buttonText == '.') {
      if (_output.contains('.')) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == '=') {
      setState(() {
        clear = true;
      });
      num2 = double.parse(output);

      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == 'x') {
        _output = (num1 * num2).toString();
      }
      if (operand == '÷') {
        _output = (num1 / num2).toString();
      }

      num1 = 0;
      num2 = 0;
      operand = '';
    } else {
      _output = _output + buttonText;
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
    var a = output.split('.');
    print(a[1]);
    if (a[1] == '00') {
      setState(() {
        output = int.parse(_output).toString();
      });
    }
    if (output == '0.00') {
      setState(() {
        output = '0';
      });
    }
  }

  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(child: SizedBox()),
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 167, 197, 255),
              border: Border.all(color: Colors.blueAccent, width: 4),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 90.w,
          height: 12.h,
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 2.w),
                    Text(
                      output,
                      style:
                          TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 2.w),
                  ])),
        ),
        SizedBox(
          height: 3.h,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          GestureDetector(
            onTap: () {
              Pressed('CLEAR');
            },
            child: Container(
              color: Colors.transparent,
              child: Ink(
                height: 20.w,
                width: 42.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(119, 165, 255, 1),
                      Color.fromRGBO(0, 87, 255, 1)
                    ]),
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Center(
                  child: Text(
                    'Clear',
                    style: TextStyle(
                        fontSize: 6.w,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 3.w,
          ),
          GestureDetector(
            onTap: () {
              Pressed('.');
            },
            child: Container(
              color: Colors.transparent,
              child: Ink(
                height: 20.w,
                width: 20.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(119, 165, 255, 1),
                    Color.fromRGBO(0, 87, 255, 1)
                  ]),
                ),
                child: Center(
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 8.w,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          GestureDetector(
            onTap: () {
              Pressed('=');
            },
            child: Container(
              color: Colors.transparent,
              child: Ink(
                height: 20.w,
                width: 20.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(119, 165, 255, 1),
                    Color.fromRGBO(0, 87, 255, 1)
                  ]),
                ),
                child: Center(
                  child: Text(
                    '=',
                    style: TextStyle(
                        fontSize: 8.w,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ]),
        SizedBox(
          height: 2.h,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          GestureDetector(
            onTap: () {
              Pressed('1');
            },
            child: Container(
              color: Colors.transparent,
              child: Ink(
                height: 20.w,
                width: 20.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(119, 165, 255, 1),
                    Color.fromRGBO(0, 87, 255, 1)
                  ]),
                ),
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyle(
                        fontSize: 8.w,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 3.w),
          GestureDetector(
              onTap: () {
                Pressed('2');
              },
              child: Container(
                color: Colors.transparent,
                child: Ink(
                  height: 20.w,
                  width: 20.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(119, 165, 255, 1),
                      Color.fromRGBO(0, 87, 255, 1)
                    ]),
                  ),
                  child: Center(
                    child: Text(
                      '2',
                      style: TextStyle(
                          fontSize: 8.w,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )),
          SizedBox(width: 3.w),
          GestureDetector(
            onTap: () {
              Pressed('3');
            },
            child: Container(
              color: Colors.transparent,
              child: Ink(
                height: 20.w,
                width: 20.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(119, 165, 255, 1),
                    Color.fromRGBO(0, 87, 255, 1)
                  ]),
                ),
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                        fontSize: 8.w,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 3.w),
          GestureDetector(
            onTap: () {
              Pressed('÷');
            },
            child: Container(
              color: Colors.transparent,
              child: Ink(
                height: 20.w,
                width: 20.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(119, 165, 255, 1),
                    Color.fromRGBO(0, 87, 255, 1)
                  ]),
                ),
                child: Center(
                  child: Text(
                    '÷',
                    style: TextStyle(
                        fontSize: 10.w,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ]),
        SizedBox(
          height: 2.h,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          GestureDetector(
            onTap: () {
              Pressed('4');
            },
            child: Container(
              color: Colors.transparent,
              child: Ink(
                height: 20.w,
                width: 20.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(119, 165, 255, 1),
                    Color.fromRGBO(0, 87, 255, 1)
                  ]),
                ),
                child: Center(
                  child: Text(
                    '4',
                    style: TextStyle(
                        fontSize: 8.w,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 3.w),
          GestureDetector(
            onTap: () {
              Pressed('5');
            },
            child: Container(
              color: Colors.transparent,
              child: Ink(
                height: 20.w,
                width: 20.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(119, 165, 255, 1),
                    Color.fromRGBO(0, 87, 255, 1)
                  ]),
                ),
                child: Center(
                  child: Text(
                    '5',
                    style: TextStyle(
                        fontSize: 8.w,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 3.w),
          GestureDetector(
            onTap: () {
              Pressed('6');
            },
            child: Container(
              color: Colors.transparent,
              child: Ink(
                height: 20.w,
                width: 20.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(119, 165, 255, 1),
                    Color.fromRGBO(0, 87, 255, 1)
                  ]),
                ),
                child: Center(
                  child: Text(
                    '6',
                    style: TextStyle(
                        fontSize: 8.w,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 3.w),
          GestureDetector(
            onTap: () {
              Pressed('x');
            },
            child: Container(
              color: Colors.transparent,
              child: Ink(
                height: 20.w,
                width: 20.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(119, 165, 255, 1),
                    Color.fromRGBO(0, 87, 255, 1)
                  ]),
                ),
                child: Center(
                  child: Text(
                    'x',
                    style: TextStyle(
                        fontSize: 10.w,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ]),
        SizedBox(
          height: 2.h,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          GestureDetector(
            onTap: () {
              Pressed('7');
            },
            child: Container(
              color: Colors.transparent,
              child: Ink(
                height: 20.w,
                width: 20.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(119, 165, 255, 1),
                    Color.fromRGBO(0, 87, 255, 1)
                  ]),
                ),
                child: Center(
                  child: Text(
                    '7',
                    style: TextStyle(
                        fontSize: 8.w,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 3.w),
          GestureDetector(
            onTap: () {
              Pressed('8');
            },
            child: Container(
              color: Colors.transparent,
              child: Ink(
                height: 20.w,
                width: 20.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(119, 165, 255, 1),
                    Color.fromRGBO(0, 87, 255, 1)
                  ]),
                ),
                child: Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                        fontSize: 8.w,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 3.w),
          GestureDetector(
            onTap: () {
              Pressed('9');
            },
            child: Container(
              color: Colors.transparent,
              child: Ink(
                height: 20.w,
                width: 20.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(119, 165, 255, 1),
                    Color.fromRGBO(0, 87, 255, 1)
                  ]),
                ),
                child: Center(
                  child: Text(
                    '9',
                    style: TextStyle(
                        fontSize: 8.w,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 3.w),
          GestureDetector(
            onTap: () {
              Pressed('-');
            },
            child: Container(
              color: Colors.transparent,
              child: Ink(
                height: 20.w,
                width: 20.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(119, 165, 255, 1),
                    Color.fromRGBO(0, 87, 255, 1)
                  ]),
                ),
                child: Center(
                  child: Text(
                    '-',
                    style: TextStyle(
                        fontSize: 10.w,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ]),
        SizedBox(
          height: 2.h,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          GestureDetector(
            onTap: () {
              Pressed('0');
            },
            child: Container(
              color: Colors.transparent,
              child: Ink(
                height: 20.w,
                width: 64.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(119, 165, 255, 1),
                      Color.fromRGBO(0, 87, 255, 1)
                    ]),
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Center(
                  child: Text(
                    '0',
                    style: TextStyle(
                        fontSize: 10.w,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 4.w,
          ),
          GestureDetector(
            onTap: () {
              Pressed('+');
            },
            child: Container(
              color: Colors.transparent,
              child: Ink(
                height: 20.w,
                width: 20.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(119, 165, 255, 1),
                      Color.fromRGBO(0, 87, 255, 1)
                    ]),
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Center(
                  child: Text(
                    '+',
                    style: TextStyle(
                        fontSize: 10.w,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ]),
        SizedBox(
          height: 5.h,
        )
      ]));
    });
  }
}
