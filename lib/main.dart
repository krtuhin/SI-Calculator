import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Calculator App",
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Simple Interest Calculator"),
      ),
      body: MyApp(),
    ),
    theme: ThemeData(
      accentColor: Colors.tealAccent,
      brightness: Brightness.dark,
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _currencies = ["Select", "Rupees", "Dollars", "Pounds", "Others"];
  var _currentItem = "Select";
  var rate = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          getImg(),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Principal",
                  labelStyle: Theme.of(context).textTheme.titleMedium,
                  hintText: "Enter principal ex, 12000",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 7.0, right: 7.0, bottom: 7.0),
            child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Rate of Interest",
                  labelStyle: Theme.of(context).textTheme.titleMedium,
                  hintText: "In percent",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                )),
          ),
          Row(
            children: [
              Expanded(
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 7.0, right: 7.0, bottom: 7.0),
                    child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Term",
                          labelStyle: Theme.of(context).textTheme.titleMedium,
                          hintText: "Enter Years",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        )),
                  )),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: DropdownButton<String>(
                      items: _currencies.map((String strItem) {
                        return DropdownMenuItem<String>(
                            value: strItem, child: Text(strItem));
                      }).toList(),
                      onChanged: (var nowValue) {
                        setState(() {
                          _currentItem = nowValue.toString();
                        });
                      },
                      value: _currentItem,
                    ),
                  ))
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      elevation: 6,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Reset",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        elevation: 6,
                      ),
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 6.0, right: 6.0),
            child: Text(
              "Interest will be $rate $_currentItem",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget getImg() {
  AssetImage img = AssetImage("images/money.png");
  Image image = Image(
    image: img,
    width: 140,
    height: 140,
  );
  return Container(
    child: image,
    margin: EdgeInsets.only(top: 60, bottom: 40),
  );
}
