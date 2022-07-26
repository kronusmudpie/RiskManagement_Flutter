// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/material.dart';

import '../styles/metric_container.dart';
import 'package:riskmanagement/classes/metric.dart';
import 'package:riskmanagement/styles/risk_container.dart';

class MetricInfoBuilder {
  final MetricContainer? myMetricContainer;
  late final Metric? myMetric;
  MetricInfoBuilder(this.myMetricContainer, this.myMetric);

  late final OverlayEntry _overlayEntry;

  void showInfo(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: ((context) => buildOverlay()),
    );
    final overlay = Overlay.of(context)!;
    overlay.insert(_overlayEntry);
  }

  void removeInfo() {
    _overlayEntry.remove();
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
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, double.infinity),
                splashFactory: NoSplash.splashFactory,
              ),
              child: Text(''),
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
