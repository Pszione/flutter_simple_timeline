import 'package:flutter/material.dart';

class TimelineEntity {
  final String title;
  final bool enable;
  final String? description;
  final Color disableColor;
  final TextStyle? style;

  TimelineEntity(
      {required this.title,
      required this.enable,
      this.disableColor = Colors.grey,
      this.style,
      this.description});
}
