import 'package:flutter/material.dart';
import 'package:simple_timeline/entity/timeline_entity.dart';
import 'package:simple_timeline/presenter/timeline_item.dart';

class SimpleTimeLine extends StatefulWidget {
  final List<TimelineEntity> timelineList;

  final Color? lineColor;

  final Color? backgroundColor;

  final Color? headingColor;

  final Color? descriptionColor;

  const SimpleTimeLine(
      {Key? key,
      required this.timelineList,
      this.lineColor,
      this.backgroundColor,
      this.headingColor,
      this.descriptionColor})
      : super(key: key);

  @override
  TimelineComponentState createState() {
    return new TimelineComponentState();
  }
}

class TimelineComponentState extends State<SimpleTimeLine>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  late AnimationController controller;
  double fraction = 0.0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
          children: widget.timelineList
              .asMap()
              .map((index, timeLineList) => MapEntry(
                  index,
                  new TimelineItem(
                    lineColor: timeLineList.enable
                        ? widget.lineColor == null
                            ? Theme.of(context).colorScheme.secondary
                            : widget.lineColor!
                        : timeLineList.disableColor,
                    backgroundColor: widget.backgroundColor == null
                        ? Colors.white
                        : widget.backgroundColor!,
                    entity: timeLineList,
                    firstElement: index == 0,
                    lastElement: widget.timelineList.length == index + 1,
                    controller: controller,
                    headingColor: widget.headingColor,
                    descriptionColor: widget.descriptionColor,
                  )))
              .values
              .toList()),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
