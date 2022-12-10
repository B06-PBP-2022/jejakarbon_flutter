import 'package:flutter/material.dart';


void main() {
  runApp(const PaymentMethod());
}

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  String Nominal = "";
  final _controller = TextEditingController();

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
            height: 45,
            width: double.infinity ,
            color: Color.fromARGB(255, 255, 255, 255),
            
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Masukkan Nominal Donasi 💸',
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
            height: 55,
            width: double.infinity,
            color: Color.fromARGB(255, 255, 255, 255),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Container(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: Color.fromARGB(255, 145, 186, 147)
                    ),
                    onPressed: () {
                       _controller.text = "10000";
                    }, 
                    child: 
                      Text("10.000")
                  ),
                ),
                SizedBox(width: 15,),
                Container(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: Color.fromARGB(255, 145, 186, 147)
                    ),
                    onPressed: () {
                       _controller.text = "20000";
                    }, 
                    child: 
                      Text("20.000")
                  ),
                ),
                SizedBox(width: 15,),
                Container(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: Color.fromARGB(255, 145, 186, 147)
                    ),
                    onPressed: () {
                       _controller.text = "50000";
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
            color: Color.fromARGB(255, 255, 255, 255),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Container(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: Color.fromARGB(255, 145, 186, 147)
                      
                      
                    ),
                    onPressed: () {
                       _controller.text = "75000";
                    },
                    child: 
                      Text("75.000")
                
                      
                  ),
                ),
                SizedBox(width: 15,),
                Container(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: Color.fromARGB(255, 145, 186, 147)
                    ),
                    onPressed: () {
                       _controller.text = "100000";
                    }, 
                    child: 
                      Text("100.000")
                  ),
                ),
                SizedBox(width: 15,),
                Container(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: Color.fromARGB(255, 145, 186, 147)
                    ),
                    onPressed: () {
                       _controller.text = "200000";
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
              decoration: InputDecoration(
                hintText: 'Masukkan nominal lainnya',
                labelText: 'Nominal',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 81, 180, 84), width: 10)),
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
            height: 200,
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
                  Nominal = value;
                });
              },
              onSaved: (String? value) {
                Nominal = value!;
              },
            )
          )
          
        
        ],
      
      ),
      
    );
  }


}