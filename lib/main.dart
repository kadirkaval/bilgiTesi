
import 'package:bilgi_testi/test_baskasi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BilgiTesti(),
    );
  }
}

class BilgiTesti extends StatefulWidget {
  const BilgiTesti({Key? key}) : super(key: key);

  @override
  State<BilgiTesti> createState() => _BilgiTestiState();
}

class _BilgiTestiState extends State<BilgiTesti> {
  List<Widget> cevapIcon = [];
  TestListesi test_1 = TestListesi();
  int index = 0;
  void buttonFonksiyonu(bool b){
    if(test_1.testBittiMi()==true){
      //alet dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text("Bravo Testi Bitirdiniz.."),
            //content: Text("Alert Dialog body"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              TextButton(
                child: Text("Başa dön"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    //index 0
                    test_1.indexSifirla();
                    //secimleri sıfırla
                    cevapIcon = [];
                  });
                },
              ),
            ],
          );
        },
      );

    }else{
      setState(() {
        test_1.getSoruCevap() == b
            ? cevapIcon.add(const Icon(
            Icons.emoji_emotions_outlined,
            color: Colors.yellow))
            : cevapIcon.add(const Icon(
            Icons.emoji_emotions_outlined,
            color: Colors.red));
        test_1.setIndex();
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    test_1.getSoruMetni(),
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              ),
            ),
            Wrap(
              alignment: WrapAlignment.start,
              children: cevapIcon,
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          buttonFonksiyonu(true);
                        },
                        child: Container(
                          width: 150,
                          height: 50,
                          color: Colors.green,
                          child: const Icon(
                            Icons.thumb_up,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          buttonFonksiyonu(true);
                        },
                        child: Container(
                          width: 150,
                          height: 50,
                          color: Colors.red,
                          child: const Icon(
                            Icons.thumb_down,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
