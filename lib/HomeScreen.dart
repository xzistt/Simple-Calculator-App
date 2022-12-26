import 'package:calculatorapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userinput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                userinput.toString(),
                textAlign: TextAlign.end,
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                answer.toString(),
                textAlign: TextAlign.end,
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Divider(
                thickness: .25,
                color: grayColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Button(
                      text: 'AC',
                      color: Colors.black,
                      onpress: () {
                        userinput = '';
                        answer = '';
                        setState(() {});
                      },
                    ),
                    Button(
                      text: '+/-',
                      color: Colors.black,
                      onpress: () {
                        userinput += '';
                        answer += '';
                        setState(() {});
                      },
                    ),
                    Button(
                      text: '%',
                      color: Colors.black,
                      onpress: () {
                        userinput += '%';
                        answer += '';
                        setState(() {});
                      },
                    ),
                    Button(
                      text: '/',
                      color: Colors.black,
                      onpress: () {
                        userinput += '/';
                        answer += '';
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Button1(
                      text: '7',
                      color: Colors.black,
                      onpress: () {
                        userinput += '7';
                        answer += '';
                        setState(() {});
                      },
                    ),
                    Button1(
                      text: '8',
                      color: Colors.black,
                      onpress: () {
                        userinput += '8';
                        answer += '';
                        setState(() {});
                      },
                    ),
                    Button1(
                      text: '0',
                      color: Colors.black,
                      onpress: () {
                        userinput += '0';
                        answer += '';
                        setState(() {});
                      },
                    ),
                    Button(
                      text: 'X',
                      color: Colors.black,
                      onpress: () {
                        userinput += 'X';
                        answer += '';
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Button1(
                      text: '4',
                      color: Colors.black,
                      onpress: () {
                        userinput += '4';
                        answer += '';
                        setState(() {});
                      },
                    ),
                    Button1(
                      text: '5',
                      color: Colors.black,
                      onpress: () {
                        userinput += '5';
                        answer += '';
                        setState(() {});
                      },
                    ),
                    Button1(
                      text: '6',
                      color: Colors.black,
                      onpress: () {
                        userinput += '6';
                        answer += '';
                        setState(() {});
                      },
                    ),
                    Button(
                      text: '-',
                      color: Colors.black,
                      onpress: () {
                        userinput += '-';
                        answer += '';
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Button1(
                      text: '1',
                      color: Colors.black,
                      onpress: () {
                        userinput += '1';
                        answer += '';
                        setState(() {});
                      },
                    ),
                    Button1(
                      text: '2',
                      color: Colors.black,
                      onpress: () {
                        userinput += '2';
                        answer += '';
                        setState(() {});
                      },
                    ),
                    Button1(
                      text: '3',
                      color: Colors.black,
                      onpress: () {
                        userinput += '3';
                        setState(() {});
                      },
                    ),
                    Button(
                      text: '+',
                      color: Colors.black,
                      onpress: () {
                        userinput += '+';
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Button1(
                      text: '0',
                      color: Colors.black,
                      onpress: () {
                        userinput += '0';
                        setState(() {});
                      },
                    ),
                    Button(
                      text: '.',
                      color: Colors.black,
                      onpress: () {
                        userinput += '.';
                        setState(() {});
                      },
                    ),
                    Button(
                      text: 'DEL',
                      color: Colors.black,
                      onpress: () {
                        userinput =
                            userinput.substring(0, userinput.length - 1);
                        setState(() {});
                      },
                    ),
                    Button1(
                      text: '=',
                      color: const Color(0xffEE4B2B),
                      onpress: () {
                        equalpress();
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalpress() {
    String finaluserinput = userinput.replaceAll('X', '*');
    Parser p = Parser();
    Expression expression = p.parse(finaluserinput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}

class Button extends StatelessWidget {
  String text;
  Color color;
  VoidCallback onpress;
  Button({required this.color, required this.text, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        width: 95,
        height: 70,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                color: Color(0xffEE4B2B)),
          ),
        ),
      ),
    );
  }
}

class Button1 extends StatelessWidget {
  String text;
  Color color;
  VoidCallback onpress;
  Button1({required this.color, required this.text, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        width: 95,
        height: 70,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
