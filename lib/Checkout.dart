import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'category_model.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new CheckoutPage(),
    );
  }
}

class CheckoutPage extends StatefulWidget {
  @override
  CheckoutState createState() => CheckoutState();
}

class CheckoutState extends State<CheckoutPage> {
  List<Category> list1 = List<Category>();

  @override
  void initState() {
    {
      list1 = [
        Category('Panadol',
            'https://en.wikipedia.org/wiki/Paracetamol_brand_names#/media/File:Panadol.jpg'),
        Category('BetaDine',
            'https://en.wikipedia.org/wiki/Cipla#/media/File:Cipla_logo.svg'),
        Category('Dettol',
            'https://en.wikipedia.org/wiki/Cipla#/media/File:Cipla_logo.svg'),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: Center(
                child: Column(children: <Widget>[
              Expanded(
                  child: ListView.builder(
                itemCount: list1.length,
                padding: const EdgeInsets.all(1),
                itemBuilder: (context, i) {
                  return Container(
                      width: double.infinity,
                      child: Card(
                          elevation: 10,
                          child: Row(children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  child: Image.asset("assets/cipla.png"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Row(children: <Widget>[
                              Text(
                                list1[i].name,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ])
                          ])));
                },
              )),
                  Container(
                      alignment: Alignment.bottomCenter,
                      child:RaisedButton(
                      child:Text('Place Order'),
                      color: Colors.black,
                      textColor: Colors.white,
                      onPressed: () {
                        final snackBar =
                        SnackBar(content: Text('Order Placed'));
                        Scaffold.of(context).showSnackBar(snackBar);
                      }))
            ]))));
  }
}
