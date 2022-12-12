import 'package:flutter/material.dart';
import 'package:footer/footer.dart';

Footer buildFooter(BuildContext context) {
  double widt = MediaQuery.of(context).size.width;

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
                        child: const Image(
                          image: AssetImage('assets/images/logo_small.png'),
                        ),
                      ),
                Column(children: const [
                  Text(
                    "JejaKarbon",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'PBP B06',
                    style: TextStyle(
                      color: Colors.white,
                      overflow: TextOverflow.visible,
                    ),
                  )
                ]),
              ],
            ),
          ),
        ],
      ));
}
