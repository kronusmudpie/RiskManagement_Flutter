// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/material.dart';

import '../styles/metricContainer.dart';
import 'package:riskmanagement/classes/Metric.dart';
import 'package:riskmanagement/styles/riskContainer.dart';

class MetricInfoBuilder extends StatelessWidget {
  final MetricContainer? myMetricContainer;
  late final Metric? myMetric;
  MetricInfoBuilder(@required this.myMetricContainer, @required this.myMetric);

  OverlayEntry? _overlayEntry;
  void showInfo(BuildContext context) async {
    _overlayEntry = OverlayEntry(
      builder: ((context) => MetricInfoBuilder(myMetricContainer, myMetric)),
    );
    final overlay = Overlay.of(context)!;
    overlay.insert(_overlayEntry!);
    (context as Element).markNeedsBuild();
    await Future.delayed(Duration(seconds: 1));
    _overlayEntry?.remove();
  }

  void removeInfo() {
    this._overlayEntry?.remove();
    print("ETSTST");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: TextButton(
            onPressed: removeInfo,
            child: Text(''),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, double.infinity),
              splashFactory: NoSplash.splashFactory,
            ),
          ),
        ),
        SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                AbsorbPointer(
                  child: myMetricContainer,
                ),
                AbsorbPointer(
                  child: Column(
                    children: [
                      ...(myMetric!.riskListDesc).map((currMetric) {
                        return RiskContainer(
                          currMetric,
                        );
                      }).toList(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
