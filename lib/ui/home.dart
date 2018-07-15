import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  double _meter = 0.0;
  double _result = 0.0;
  String _finalResultPrint = "";
  String _doneResult = "";

  void _clear() {
    setState(() {
      _ageController.clear();
      _weightController.clear();
      _heightController.clear();
    });
  }

  void _bmiValue() {
    setState(() {
      double age = double.parse(_ageController.text);
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text);
      _meter = height/3.2808;

      if((_ageController.text.isNotEmpty || age > 0) &&
          ((_heightController.text.isNotEmpty || height > 0) &&
              (_weightController.text.isNotEmpty || weight > 0))){
        _result = weight/(_meter*_meter);
      }else{
        print("Error");
      }

      if((double.parse(_result.toStringAsFixed(1)) < 18.5)){
        _finalResultPrint = "UnderWeight";
        print(_finalResultPrint);
      }else if(double.parse(_result.toStringAsFixed(1))>18.5 &&
          (double.parse(_result.toStringAsFixed(1)) <=25.0)){
        _finalResultPrint = "Normal";
        print(_finalResultPrint);
      }else if((double.parse(_result.toStringAsFixed(1))>25.0)
      && (double.parse(_result.toStringAsFixed(1))) < 30.0){
        _finalResultPrint = "OverWeight";
        print(_finalResultPrint);
      }else if((double.parse(_result.toStringAsFixed(1))) >= 30.0){
        _finalResultPrint = "Obesity";
        print(_finalResultPrint);
      }
    });

    _doneResult = "Your BMI is ${_result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //AppBar
      appBar: new AppBar(
        title: new Text("BmiCalc"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),

      //Body
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new Center(
              child: new Column(
                children: <Widget>[
                  new Image.asset(
                    "./images/bmilogo.png",
                    width: 200.0,
                    height: 200.0,
                  ),

                  //TextField
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText: "Eg 0-100",
                      labelText: "Age",
                      icon: Icon(Icons.person),
                    ),
                  ),

                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText: "Eg 2-7",
                      labelText: "Height",
                      icon: Icon(Icons.bubble_chart),
                    ),
                  ),

                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText: "Eg 0-100",
                      labelText: "Weight",
                      icon: Icon(Icons.line_weight),
                    ),
                  ),
                  new Padding(padding: EdgeInsets.all(10.0)),

                  new Row(
                    children: <Widget>[
                      new Container(
                          margin: EdgeInsets.only(left: 100.0),
                          child: new RaisedButton(
                            onPressed: _bmiValue,
                            color: Colors.red,
                            child: new Text(
                              "Calculate",
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          )),
                      new Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: new RaisedButton(
                            onPressed: _clear,
                            color: Colors.red,
                            child: new Text(
                              "Clear",
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ))
                    ],
                  ),
                  new Padding(padding: EdgeInsets.all(10.0)),

                  new Text(
                    '$_doneResult',
                    style: new TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.red),
                  ),

                  new Text(
                    "$_finalResultPrint",
                    style: new TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.red),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
