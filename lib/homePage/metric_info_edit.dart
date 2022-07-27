import 'package:flutter/material.dart';
import 'package:riskmanagement/classes/metric.dart';

class MetricEdit extends StatefulWidget {
  Metric _myMetricToEdit;
  MetricEdit(this._myMetricToEdit);

  @override
  State<MetricEdit> createState() => _MetricEditState();
}

class _MetricEditState extends State<MetricEdit> {
  late final _titleController =
      TextEditingController(text: widget._myMetricToEdit.title);
  late final _minRiskController = TextEditingController(
      text: widget._myMetricToEdit.riskListDesc.elementAt(0).riskDesc);
  late final _lowRiskController = TextEditingController(
      text: widget._myMetricToEdit.riskListDesc.elementAt(1).riskDesc);
  late final _reasonableRiskController = TextEditingController(
      text: widget._myMetricToEdit.riskListDesc.elementAt(2).riskDesc);
  late final _highRiskController = TextEditingController(
      text: widget._myMetricToEdit.riskListDesc.elementAt(3).riskDesc);

  void editInfo() {
    if (_titleController.text.isEmpty ||
        _minRiskController.text.isEmpty ||
        _lowRiskController.text.isEmpty ||
        _reasonableRiskController.text.isEmpty ||
        _highRiskController.text.isEmpty) {
      return;
    }
    setState(() {
      widget._myMetricToEdit.title = _titleController.text;
      widget._myMetricToEdit.riskListDesc.elementAt(0).riskDesc =
          _minRiskController.text;
      widget._myMetricToEdit.riskListDesc.elementAt(1).riskDesc =
          _lowRiskController.text;
      widget._myMetricToEdit.riskListDesc.elementAt(2).riskDesc =
          _reasonableRiskController.text;
      widget._myMetricToEdit.riskListDesc.elementAt(3).riskDesc =
          _highRiskController.text;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
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
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Edit",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: editInfo,
                      child: Text("Save"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancel"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
