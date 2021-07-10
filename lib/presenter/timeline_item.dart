import 'package:flutter/material.dart';
import 'package:simple_timeline/presenter/timeline_paint.dart';
import '../entity/timeline_entity.dart';

class TimelineItem extends StatelessWidget {
  final Color lineColor;
  final Color backgroundColor;
  final TimelineEntity entity;
  final bool firstElement;
  final bool lastElement;
  final Animation<double>? controller;
  final Color? headingColor;
  final Color? descriptionColor;

  TimelineItem(
      {required this.lineColor,
      required this.backgroundColor,
      required this.entity,
      this.firstElement = false,
      this.lastElement = false,
      this.controller,
      this.headingColor,
      this.descriptionColor});

  Widget _buildLine(BuildContext context, Widget child) {
    return new Container(
      width: 40.0,
      child: new CustomPaint(
        painter: new TimelinePaint(
            lineColor: lineColor,
            backgroundColor: backgroundColor,
            firstElement: firstElement,
            lastElement: lastElement,
            controller: controller),
      ),
    );
  }

  Widget _buildContentColumn(BuildContext context) {
    return new Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          padding: EdgeInsets.only(
              bottom: 8.0, top: entity.description == null ? 0 : 8.0),
          child: new Text(
            entity.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: entity.style ??  new TextStyle(
              fontWeight: FontWeight.bold,
              color: headingColor != null ? headingColor : Colors.black,
            ),
          ),
        ),
        entity.description == null
            ? const SizedBox(
                height: 10,
              )
            : new Expanded(
                child: new Text(
                  (entity.description!),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: entity.style ?? new TextStyle(
                    color: descriptionColor != null
                        ? descriptionColor
                        : Colors.grey,
                  ),
                ),
              )
      ],
    );
  }

  Widget _buildRow(BuildContext context) {
    return new Container(
      height: 80.0,
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          controller == null
              ? const SizedBox()
              : new AnimatedBuilder(
                  builder: (ctx, child) => _buildLine(ctx, child ?? SizedBox()),
                  animation: controller!,
                ),
          new Expanded(
            child: _buildContentColumn(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildRow(context);
  }
}
