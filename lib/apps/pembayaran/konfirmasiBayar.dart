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
                  'Total Pembayaran',
                  style: (
                    const TextStyle(
                      color: Color.fromARGB(255, 139, 203, 127),
                      fontSize: 25.0,
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
                      color: Color.fromARGB(255, 139, 203, 127),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ),
              ]
            )
          )

        ]
      )
      
    );
  }


}