// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddMetric extends StatefulWidget {
  @override
  State<AddMetric> createState() => _AddMetricState();
}

class _AddMetricState extends State<AddMetric> {
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
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter a metric title',
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.circle, color: Colors.green),
                          border: UnderlineInputBorder(),
                          labelText: 'Minimal risk description',
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.circle, color: Colors.green),
                          border: UnderlineInputBorder(),
                          labelText: 'Low risk description',
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.circle, color: Colors.yellow),
                          border: UnderlineInputBorder(),
                          labelText: 'Reasonable risk description',
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.circle, color: Colors.red),
                          border: UnderlineInputBorder(),
                          labelText: 'High risk description',
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
