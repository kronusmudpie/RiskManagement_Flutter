// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:riskmanagement/homePage/homepage.dart';

import '../styles/metricContainer.dart';
import 'package:riskmanagement/classes/Metric.dart';
import 'package:riskmanagement/styles/riskContainer.dart';

class MetricInfoBuilder extends StatelessWidget {
  final MetricContainer? myMetricContainer;
  late final Metric? myMetric;
  MetricInfoBuilder(@required this.myMetricContainer, @required this.myMetric);

  late final OverlayEntry _overlayEntry;

  void showInfo(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: ((context) => buildOverlay()),
    );
    final overlay = Overlay.of(context)!;
    overlay.insert(_overlayEntry);
  }

  void removeInfo() {
    this._overlayEntry.remove();
  }

  Widget buildOverlay() => Stack(
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
