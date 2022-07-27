// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../classes/metrics_db.dart';

class AddMetric extends StatefulWidget {
  @override
  State<AddMetric> createState() => _AddMetricState();
}

class _AddMetricState extends State<AddMetric> {
  final _titleController = TextEditingController();
  final _minRiskController = TextEditingController();
  final _lowRiskController = TextEditingController();
  final _reasonableRiskController = TextEditingController();
  final _highRiskController = TextEditingController();

  bool checkIfInputComplete() {
    if (_titleController.text.isEmpty ||
        _minRiskController.text.isEmpty ||
        _lowRiskController.text.isEmpty ||
        _reasonableRiskController.text.isEmpty ||
        _highRiskController.text.isEmpty) {
      return false;
    }
    return true;
  }

  void addToMetricDB() {
    if (checkIfInputComplete()) {
      MetricsDB.addToMetric(
          _titleController.text,
          _minRiskController.text,
          _lowRiskController.text,
          _reasonableRiskController.text,
          _highRiskController.text);

      _titleController.text = "";
      _minRiskController.text = "";
      _lowRiskController.text = "";
      _reasonableRiskController.text = "";
      _highRiskController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color.fromARGB(243, 197, 200, 206),
                Colors.white,
                Colors.white,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Add a Metric",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                        maxLength: 50,
                        controller: _titleController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter a metric title',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        maxLength: 100,
                        controller: _minRiskController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.circle, color: Colors.green),
                          border: UnderlineInputBorder(),
                          labelText: 'Minimal risk description',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        maxLength: 100,
                        controller: _lowRiskController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.circle, color: Colors.yellow),
                          border: UnderlineInputBorder(),
                          labelText: 'Low risk description',
                          
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        maxLength: 100,
                        controller: _reasonableRiskController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.circle, color: Colors.orange),
                          border: UnderlineInputBorder(),
                          labelText: 'Reasonable risk description',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        maxLength: 100,
                        controller: _highRiskController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.circle, color: Colors.red),
                          border: UnderlineInputBorder(),
                          labelText: 'High risk description',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: addToMetricDB,
                          child: Text("Add"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
