import 'package:flutter/material.dart';
import 'package:footer/footer.dart';

Footer buildFooter(BuildContext context) {
  return Footer(
    backgroundColor: Colors.green,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Image(
                image: AssetImage('assets/images/logo_small.png'),
              ),
            ),
            Column(children: const [
              Text("JejaKarbon", style: TextStyle(
                  color: Colors.white, 
                  fontWeight: FontWeight.bold
                ),
              ),
              Text('Tugas Pemrograman Berbasis Platform B06',
                  style: TextStyle(
                    color: Colors.white
                  ),
              )
            ]),
          ],
        ),
        
      ),
    ],
  ));
}
