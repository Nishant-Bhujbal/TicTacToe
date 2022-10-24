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
            SizedBox(
              height: 50.0,
              width: 100.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/2Player');
                },
                child: Text('2 Players'),
                style: ElevatedButton.styleFrom(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                    padding: EdgeInsets.all(10.0)),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 50.0,
              width: 100.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/3Player');
                },
                child: Text('3 Players'),
                style: ElevatedButton.styleFrom(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                    padding: EdgeInsets.all(10.0)),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
