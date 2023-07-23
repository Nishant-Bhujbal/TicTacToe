import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class mainPage extends StatelessWidget {
  const mainPage({super.key});

  static var customFont = GoogleFonts.coiny(
      textStyle: TextStyle(
    color: Colors.white,
    letterSpacing: 3,
    fontSize: 20,
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 205, 205),
      appBar: AppBar(
        title: Text(
          'Tic-Tac-Toe',
          style: customFont,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/tictactoe.jpg",height: 400,width: 300,fit: BoxFit.cover,),
            SizedBox(height: 50,),
            Container(
              height: 55,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/2Player');
                },
                child: Text('2 Players',
                style: TextStyle(fontSize: 20.0),),
                style: ElevatedButton.styleFrom(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    padding: EdgeInsets.all(10.0)),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 55,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/3Player');
                },
                child: Text('3 Players',
                style: TextStyle(fontSize: 20.0),),
                style: ElevatedButton.styleFrom(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    padding: EdgeInsets.all(10.0)),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
