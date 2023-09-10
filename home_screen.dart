import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var weightController = TextEditingController();
  var heightControllerFeet = TextEditingController();
  var heightControllerInch = TextEditingController();
  var result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Center(
          child: Text(
            'BMI',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // weight information
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.line_weight),
                hintText: 'Enter your weight',
                hintStyle: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(120)),
                  borderSide: BorderSide(),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(120)),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            // end of weight section
            const SizedBox(height: 30),
            //height information in feet
            TextField(
              controller: heightControllerFeet,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.line_weight),
                hintText: 'Enter your height in feet ',
                hintStyle: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(120)),
                  borderSide: BorderSide(),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(120)),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            // end of height information in feet
            const SizedBox(height: 30),
            //height information in inch
            TextField(
              controller: heightControllerInch,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.line_weight),
                hintText: 'Enter your height in inch',
                hintStyle: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(120)),
                  borderSide: BorderSide(),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(120)),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            //end of height information in inch
            const SizedBox(height: 30),
            // calculation section
            ElevatedButton(
              onPressed: () {
                var tempweight = weightController.text.toString();
                var tempheightFeet = heightControllerFeet.text.toString();
                var tempheightInch = heightControllerInch.text.toString();
                if (tempweight != '' &&
                    tempheightFeet != '' &&
                    tempheightInch != '') {
                  var intweight =
                      int.parse(tempweight); // convert into integers
                  var intHeightFeet =
                      int.parse(tempheightFeet); // convert into integers
                  var intHeightInch =
                      int.parse(tempheightInch); // convert into integers
                  var inchHeight = (intHeightFeet * 12) + intHeightInch;
                  var totalcm = inchHeight * 2.54;
                  var totalHeight = totalcm / 100;
                  var bmi = intweight / (totalHeight * totalHeight);
                  setState(() {
                    result = " The BMI = ${bmi.toStringAsFixed(3)}";
                  });
                } else {
                  setState(() {
                    result = 'please fill the blanks';
                  });
                }
              },
              child: const Text(
                'Calculate',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // result showing scetion
            Text(
              result,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
