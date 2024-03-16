import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final wtController = TextEditingController();
  final ftController = TextEditingController();
  final inController = TextEditingController();

  var result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'BMI App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Welcome to app',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                      label: Text('Enter your weight (In KG)'),
                      prefixIcon: Icon(Icons.line_weight),
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter your Height (In Feet)'),
                      prefixIcon: Icon(Icons.height),
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text('Enter your height (In Inch)'),
                      prefixIcon: Icon(Icons.height),
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(onPressed: () {

                  final wt = wtController.text.toString();
                  final ft = ftController.text.toString();
                  final inc = inController.text.toString();

                  if(wt != '' && ft != '' && inc != ''){

                    var intwt = int.parse(wt);
                    var intft = int.parse(ft);
                    var intinc = int.parse(inc);

                    var totalInc = (intft * 12 ) + intinc;
                    var totalCMeter = totalInc*2.54;
                    var totalMeter = totalCMeter/100;
                    var bmi = intwt/(totalMeter*totalMeter);

                    setState(() {
                      result = "Your BMI is ${bmi.toStringAsFixed(0)}";
                    });

                  }else{
                    setState(() {
                      result = 'Please fill all the field';
                    });
                  }

                }, child: Text('Calculate')),
                SizedBox(height: 15,),
                Text(result, style: TextStyle(fontSize: 22,),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

