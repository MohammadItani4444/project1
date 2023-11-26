import 'package:flutter/material.dart';

//Mohammad Itani 12031164
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Salary Calculator with Online Image '
              'and radio button'),
        ),
        body: SalaryCalculator(),
      ),
    );
  }
}

class SalaryCalculator extends StatefulWidget {
  @override
  _SalaryCalculatorState createState() => _SalaryCalculatorState();
}

class _SalaryCalculatorState extends State<SalaryCalculator> {
  late TextEditingController nameController;
  late TextEditingController rateController;
  late TextEditingController hoursController;
  String selectedSalaryRange = '';
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    rateController = TextEditingController();
    hoursController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    rateController.dispose();
    hoursController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Enter name'),
          ),
          TextField(
            controller: rateController,
            decoration: InputDecoration(labelText: 'Enter rate'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: hoursController,
            decoration: InputDecoration(labelText: 'Enter number of hours'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16),
          // Label for salary range
          Text(
            'Choose your Expected Salary',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          // Radio buttons for salary ranges
          ListTile(
            title: const Text('\$0 - \$500'),
            leading: Radio(
              value: '\$0-500',
              groupValue: selectedSalaryRange,
              onChanged: (value) {
                setState(() {
                  selectedSalaryRange = value.toString();
                });
              },
            ),
          ),
          ListTile(
            title: const Text('1000\$-2000\$'),
            leading: Radio(
              value: '1000\$-2000\$',
              groupValue: selectedSalaryRange,
              onChanged: (value) {
                setState(() {
                  selectedSalaryRange = value.toString();
                });
              },
            ),
          ),
          ListTile(
            title: const Text('3000\$ and more'),
            leading: Radio(
              value: '3000\$ and more',
              groupValue: selectedSalaryRange,
              onChanged: (value) {
                setState(() {
                  selectedSalaryRange = value.toString();
                });
              },
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: calculateSalary,
            child: Text('Calculate Salary'),
          ),
          SizedBox(height: 16),
          // Displaying an online image
          Image.network(
            'https://images.saymedia-content.com/.image/c_limit%2Ccs_srgb%2Cq_auto:eco%2Cw_700/MTg2ODY4NDQ2ODEzOTU1OTg0/how-much-do-hallmark-actors-get-paid.png', // Placeholder URL, replace with your image URL
            width: 100,
            height: 100,
          ),
        ],
      ),
    );
  }

  void calculateSalary() {
    String name = nameController.text;
    double rate = double.tryParse(rateController.text) ?? 0;
    int hours = int.tryParse(hoursController.text) ?? 0;
    double salary = rate * hours;
    // Display the result using a dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$name, your salary is: \$$salary for the range: '
            '$selectedSalaryRange'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
//Mohammad Itani 12031164
