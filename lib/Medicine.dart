import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'category_model.dart';
import 'HomePage.dart';
import 'package:swag_health/Checkout.dart';

class Medicine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MedicinePage(),
    );
  }
}

class MedicinePage extends StatefulWidget {
  @override
  MedicineState createState() => MedicineState();
}

class MedicineState extends State<MedicinePage> {
  List<Category> list1 = List<Category>();

  @override
  void initState() {
    {
      list1 = [
        Category('Panadol',
            'https://en.wikipedia.org/wiki/Paracetamol_brand_names#/media/File:Panadol.jpg'),
        Category('LIV 52',
            'https://en.wikipedia.org/wiki/The_Himalaya_Drug_Company#/media/File:Logo_of_Himalaya_-_The_Drug_Company.svg'),
        Category('Astra Zeneca',
            'https://en.wikipedia.org/wiki/AstraZeneca#/media/File:AstraZeneca.svg'),
        Category('Moderna',
            'https://en.wikipedia.org/wiki/Moderna#/media/File:Moderna_Therapeutics_company_logo.png'),
        Category('CoVaxin',
            'https://en.wikipedia.org/wiki/Bharat_Biotech#/media/File:Bharat_Biotech_logo.svg'),
        Category('Vaxart',
            'https://en.wikipedia.org/wiki/Vaxart#/media/File:Vaxart_logo.svg'),
        Category('Medline',
            'ahttps://en.wikipedia.org/wiki/Cipla#/media/File:Cipla_logo.svg'),
        Category('Moov',
            'https://en.wikipedia.org/wiki/Cipla#/media/File:Cipla_logo.svg'),
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
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home())),
          ),
          centerTitle: true,
          title: Text(
            "Medicine Store",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: Container(
            color: Colors.white,
            child: Center(
                child: Expanded(
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
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Buy",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  onPressed: (){
                                    setState(() {

                                    });;
                                  },
                                    icon: Icon(
                                  Icons.add_shopping_cart,
                                  size: 20.0,
                                ))
                              ],
                            )
                          ])
                        ])));
              },
            )))));
  }
}
