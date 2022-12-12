import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class konfirmasiPembayaran extends StatelessWidget {

  String nominal;
  
  
  
  konfirmasiPembayaran({required this.nominal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Konfirmasi pembayaran"),
        backgroundColor: Colors.green
      ),
      backgroundColor: Color.fromARGB(247, 255, 255, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          
          SizedBox(height: 20),
          Container(
            height: 45,
            width: double.infinity,
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Selamat anda telah berdonasi ',
                  style: (
                    const TextStyle(
                      color: Color.fromARGB(255, 160, 215, 150),
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ),
              ]
            )
          ),
          Container(
            height: 45,
            width: double.infinity,
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Rp ${nominal}',
                  style: (
                    const TextStyle(
                      color: Color.fromARGB(255, 131, 169, 123),
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ),
              ]
            )
          ),
          Container(
            height: 400,
            width: double.infinity,
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/success.gif'),
                  height: 250.0,
                  width: 300,
                  
                ),
                
              ]
            )
          ),
          


        ]
      )
      
    );
    
  }


}