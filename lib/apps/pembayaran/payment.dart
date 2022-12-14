import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:jejakarbon_flutter/apps/buka_donasi/model/buka_donasi.dart';
import 'package:jejakarbon_flutter/apps/pembayaran/konfirmasiBayar.dart';
import 'package:jejakarbon_flutter/apps/buka_donasi/page/edit.dart';
import 'package:jejakarbon_flutter/apps/buka_donasi/model/buka_donasi.dart';

import 'package:jejakarbon_flutter/apps/buka_donasi/model/buka_donasi.dart';
import 'package:jejakarbon_flutter/apps/buka_donasi/page/open_donasi_page.dart';


import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';





class PaymentMethod extends StatefulWidget {

  DaftarDonasi detailEvent;

  PaymentMethod({super.key, required this.detailEvent});


  @override
  State<StatefulWidget> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  

  @override
  String Nominal = "";
  String Pesan = "";
  final _controller = TextEditingController();
  String? metodeDipilih;
  List<Map> _metodebayarJson = [
      {
        "id": '0',
        "image": "assets/images/logo-gopay-vector.png",
        "name": "Gopay",
      },
      {
        'id': '1',
        'image':'assets/images/shopeepay.png',
        'name': 'Shopee pay',
      }, 
      
      {
        'id':'2',
        'image':'assets/images/ovo.png',
        'name': 'OVO',
      }, 
      {
        'id':'3',
        'image':'assets/images/linkaja.png',
        'name':'Link aja',
      },
      {
        'id':'4',
        'image':'assets/images/bca.png',
        'name': 'BCA',
      }, 
      {
        'id':'5',
        'image':'assets/images/bri.png',
        'name': 'Bank BRI',
      }, 
      {
        'id':'6',
        'image':'assets/images/mandiri.png',
        'name':'Bank Mandiri',
      },
      {
        'id':'7',
        'image':'assets/images/lain.png',
        'name': 'Bank Lainnya',
      },


      // {'OVO'}, 
      // {'Link Aja'}, 
      // {'Bank BCA'},
      // {'Bank BRI'}, 
      // {'Bank Mandiri'},
      // {'Bank Lainnya'}
  ];

  void onButtonPressed(){
  _controller.text = "";
  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Donation Payment"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),

          Container(
            height: 40,
            width: double.infinity ,
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Masukkan Nominal Donasi ????',
                  style: (
                    const TextStyle(
                      color: Color.fromARGB(255, 139, 203, 127),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                
                ),
                
              ]
            ),
          ),
          Container(
            height: 35,
            width: 300 ,
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Donasi untuk ${widget.detailEvent.fields.temaKegiatan}',
                  style: (
                    const TextStyle(
                      color: Color.fromARGB(255, 139, 203, 127),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    )
                  ),
                
                ),
                
              ]
            ),
          ),
          Container(
            height: 55,
            width: double.infinity,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Container(
                  width: 115,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: Color.fromARGB(255, 145, 186, 147)
                    ),
                    onPressed: () {
                       _controller.text = "10000";
                        Nominal = "10000";
                    }, 
                    child: 
                      Text("10.000")
                  ),
                ),
                SizedBox(width: 15,),
                Container(
                  width: 115,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: Color.fromARGB(255, 145, 186, 147)
                    ),
                    onPressed: () {
                       _controller.text = "20000";
                       Nominal = "20000";
                    }, 
                    child: 
                      Text("20.000")
                  ),
                ),
                SizedBox(width: 15,),
                Container(
                  width: 115,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: Color.fromARGB(255, 145, 186, 147)
                    ),
                    onPressed: () {
                       _controller.text = "50000";
                       Nominal = "50000";
                    }, 
                    child: 
                      Text("50.000")
                  ),
                ),
              ],
            ),
          
          ),
          SizedBox(height: 5,),
          Container(
            height: 70,
            width: double.infinity,
      
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Container(
                  width: 115,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: Color.fromARGB(255, 145, 186, 147)
                      
                      
                    ),
                    onPressed: () {
                       _controller.text = "75000";
                       Nominal = "75000";
                    },
                    child: 
                      Text("75.000")
                
                      
                  ),
                ),
                SizedBox(width: 15,),
                Container(
                  width: 115,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: Color.fromARGB(255, 145, 186, 147)
                    ),
                    onPressed: () {
                       _controller.text = "100000";
                       Nominal = "100000";
                    }, 
                    child: 
                      Text("100.000")
                  ),
                ),
                SizedBox(width: 15,),
                Container(
                  width: 115,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: Color.fromARGB(255, 145, 186, 147)
                    ),
                    onPressed: () {
                       _controller.text = "200000";
                        Nominal = "200000";
                    }, 
                    child: 
                      Text("200.000")
                  ),
                ),
              ],
            ),

          ),
          Container(
            height: 55,
            width: 380,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5)
              ),
            child: TextFormField(
              controller: _controller, 
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 81, 180, 84), width: 10)
                ),
                hintText: 'Masukkan nominal lainnya',
                labelText: 'Nominal',
                suffixIcon: IconButton(
                  onPressed: (){
                    _controller.clear();
                  }, 
                  icon: Icon(Icons.clear)
                ),
                
                
              ),
              onChanged: (String value) {
                setState(() {
                  Nominal = value;
                });
              },
              onSaved: (String? value) {
                Nominal = value!;
              },
            )
          ),
          SizedBox(height: 5,),
          Container(
            height: 130,
            width: 380,
            
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5)
                
              ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Masukkan pesan',
                labelText: 'Pesan',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 81, 180, 84), width: 10)
                ),
               
              ),
              maxLines: 4,
              onChanged: (String value) {
                setState(() {
                  Pesan = value;
                });
              },
              onSaved: (String? value) {
                Pesan = value!;
              },
            )
          ),
          Container(
            height: 30,
            width: 380,
     
            
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pilih metode pembayaran',
                  style: (
                    const TextStyle(
                      color: Color.fromARGB(255, 118, 176, 108),
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                    )
                  ),
                
                ),
                
              ]
            ),
          ),
          Container(
            height: 50,
            width: 380,
            
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color.fromARGB(136, 24, 115, 35)),
              borderRadius: BorderRadius.circular(10)
              
            ),
              
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: DropdownButtonHideUnderline(
                  
                  child: ButtonTheme(
                    
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      
                      isDense: true,
                      hint: new Text("Select payment method"),
                      value: metodeDipilih,
                      onChanged: (String? newValue) {
                        setState(() {
                          metodeDipilih = newValue;
                        });

                        print(metodeDipilih);
                      },
                      
                      items: _metodebayarJson.map((Map map) {
                        return new DropdownMenuItem<String>(
                          value: map["id"].toString(),
                          // value: _mySelection,
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                map["image"],
                                width: 30,
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(map["name"])),
                                  
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          )
          ),
          SizedBox(height: 10),
          Container(
            height: 50,
            width: 380,
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Container(
                  width: 380,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 118, 188, 112),
                      foregroundColor: Color.fromARGB(255, 255, 255, 255)
                    ),
                    onPressed: () async{
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => konfirmasiPembayaran(nominal: _controller.text)));
                      var terkumpul = widget.detailEvent.fields.totalDonasiTerkumpul;
                      var nominalDonasi = int.parse(Nominal) ;
                      int total = terkumpul + nominalDonasi;
                      String totalText = "{$total}";
                      print(total);
                      print(widget.detailEvent.pk);
                      
                     
                      final response = await request.postJson(
                          "https://jejakarbon.up.railway.app/form-pembuatan-donasi/edit-event/${widget.detailEvent.pk}/",
                          jsonEncode({
                            "total_donasi_terkumpul": totalText,
                          })
                      );

                    
                    
                    }, 
                    
                    child: 
                      Text("Lakukan pembayaran"),

                  ),
                ),
              
              ]
            ),
          ),
          
        
        ],
      
      ),
      
    );
  }


}