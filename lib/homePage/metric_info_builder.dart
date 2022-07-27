// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/material.dart';

import '../styles/metric_container.dart';
import 'package:riskmanagement/classes/metric.dart';
import 'package:riskmanagement/styles/risk_container.dart';

import 'metric_info_edit.dart';

class MetricInfoBuilder {
  final MetricContainer? myMetricContainer;
  late final Metric? myMetric;
  MetricInfoBuilder(this.myMetricContainer, this.myMetric);

  late final OverlayEntry _overlayEntry;

  void showInfo(BuildContext _context) {
    _overlayEntry = OverlayEntry(
      builder: ((context) => buildOverlay(_context)),
    );
    final overlay = Overlay.of(_context)!;
    overlay.insert(_overlayEntry);
  }

  void removeInfo() {
    _overlayEntry.remove();
  }

  void editInfo(BuildContext context) {
    removeInfo();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MetricEdit(myMetric!)),
    );
  }

  Widget buildOverlay(BuildContext context) => SafeArea(
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: TextButton(
                onPressed: removeInfo,
                style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, double.infinity),
                  splashFactory: NoSplash.splashFactory,
                ),
                child: Text(''),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: TextButton(
                child: Icon(
                  Icons.edit,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: () => editInfo(context),
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
        ),
      );
}
