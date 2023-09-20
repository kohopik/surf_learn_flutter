import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Helvetica'),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              child: Container(
                  constraints: const BoxConstraints(maxWidth: 400),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: CircleAvatar(
                              foregroundImage:
                                  AssetImage('assets/images/avatar.jpg')),
                        ),
                      ),
                      SizedBox(height: 13),
                      DescriptionWidget(
                          "ФИО", "Шумихин Илья", "assets/images/person.svg"),
                      DescriptionWidget(
                          "О себе",
                          "27 лет, в свободное время кодю, в несвободное тоже кодю",
                          "assets/images/about.svg"),
                      DescriptionWidget(
                          "Увлечения",
                          "Поигрываю на гитарке, увлекаюсь музыкой, придумываю хоум проекты и забиваю по-быстрому на них",
                          "assets/images/hobby.svg"),
                      DescriptionWidget(
                          "Опыт в разработке",
                          "1 год .NET, 5 лет iOS разработки",
                          "assets/images/experience.svg"),
                    ],
                  )))
        ],
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  final String _title;
  final String _subtitle;
  final String _imagePath;

  const DescriptionWidget(this._title, this._subtitle, this._imagePath,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(width: 30, height: 30, child: SvgPicture.asset(_imagePath)),
          const SizedBox(width: 4),
          Text(
            _title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
        ]),
        const SizedBox(height: 8),
        Align(
            alignment: Alignment.topLeft,
            child: Text(_subtitle,
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 14.0))),
        const SizedBox(height: 13)
      ],
    );
  }
}
