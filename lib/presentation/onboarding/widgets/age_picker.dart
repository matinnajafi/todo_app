// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/app_colors.dart';

class AgePicker extends StatefulWidget {
  final double width;
  final double height;

  const AgePicker({Key? key, this.width = 320, this.height = 80});

  @override
  _AgePickerState createState() => _AgePickerState();
}

class _AgePickerState extends State<AgePicker>
    with SingleTickerProviderStateMixin {
  double sliderPadding = 50;
  double _sliderPercent = 0;
  double _sliderPosition = 0;

  final int minValue = 0;
  final int maxValue = 100;

  late Animation<double> _animation;
  late AnimationController _animationController;

  void _updatePosition(Offset offSet) {
    double newPosition;

    if (offSet.dx <= 0) {
      newPosition = 0;
    } else if (offSet.dx >= widget.width - sliderPadding) {
      newPosition = widget.width - sliderPadding;
    } else {
      newPosition = offSet.dx;
    }

    setState(() {
      _sliderPosition = newPosition;
      _sliderPercent = newPosition / widget.width - sliderPadding;
    });
  }

  void _horizontalDragStart(BuildContext context, DragStartDetails details) {
    RenderBox? box = context.findRenderObject() as RenderBox?;
    Offset? offset = box?.globalToLocal(details.globalPosition);

    _animationController.forward();

    _updatePosition(offset!);
  }

  void _horizontalDragUpdate(BuildContext context, DragUpdateDetails details) {
    RenderBox? box = context.findRenderObject() as RenderBox?;
    Offset? offset = box?.globalToLocal(details.globalPosition);
    _updatePosition(offset!);
  }

  void _horizontalDragEnd(DragEndDetails details) {
    _animationController.reverse();
    setState(() {});
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _animation = Tween<double>(begin: 0, end: 15).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: GestureDetector(
        onHorizontalDragStart: (d) => _horizontalDragStart(context, d),
        onHorizontalDragUpdate: (d) => _horizontalDragUpdate(context, d),
        onHorizontalDragEnd: _horizontalDragEnd,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (c, ch) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  left: 0,
                  bottom: widget.height / 6.5,
                  child: Text('$minValue', style: TextStyle(color: blackColor)),
                ),
                Positioned(
                  right: 0,
                  bottom: widget.height / 6.5,
                  child: Text('$maxValue', style: TextStyle(color: blackColor)),
                ),
                SizedBox(
                  width: widget.width - sliderPadding,
                  height: widget.height - sliderPadding,
                  child: CustomPaint(
                    painter: LinePainter(
                      minValue: minValue,
                      maxValue: maxValue,
                      indicatorMargin: _animation.value,
                      dragPercent: _sliderPercent,
                      sliderPosition: _sliderPosition,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  double sliderPosition;
  final double dragPercent;
  final Paint linePainter;
  final Paint indicatorPainter;
  final TextPainter minValuePainter;
  final TextPainter maxValuePainter;
  final TextPainter selectedValuePainter;

  final int minValue;
  final int maxValue;
  static int _selectedValue = 0;
  final double indicatorMargin;

  LinePainter({
    required this.maxValue,
    required this.minValue,
    required this.indicatorMargin,
    required this.sliderPosition,
    required this.dragPercent,
  }) : selectedValuePainter = TextPainter(
         textAlign: TextAlign.center,
         text: TextSpan(
           text: "$_selectedValue",
           style: TextStyle(
             color: Colors.black,
             fontWeight: FontWeight.bold,
             fontSize: 20.45 + indicatorMargin,
           ),
         ),
       )..textDirection = TextDirection.ltr,
       maxValuePainter = TextPainter(
         textAlign: TextAlign.center,
         text: TextSpan(
           text: "$maxValue",
           style: TextStyle(color: Colors.grey, fontSize: 18),
         ),
       )..textDirection = TextDirection.ltr,
       minValuePainter = TextPainter(
         textAlign: TextAlign.center,
         text: TextSpan(
           text: "$minValue",
           style: TextStyle(color: Colors.grey, fontSize: 18),
         ),
       )..textDirection = TextDirection.ltr,
       indicatorPainter =
           Paint()
             ..color = blueColor
             ..style = PaintingStyle.fill,
       linePainter =
           Paint()
             ..color = greyyColor
             ..style = PaintingStyle.stroke
             ..strokeWidth = 1.9;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(0, size.height / 2.2);

    _selectedValue = (sliderPosition / size.width * 100).toInt();

    double controlHeight = indicatorMargin;
    double bezierWidth = 40.0;
    double bendWidth = 40.0;
    double indicatorRadius = 9.0;

    double centerPoint = sliderPosition;
    centerPoint = centerPoint > size.width ? size.width : centerPoint;

    double startBend = sliderPosition - bendWidth / 2;
    double startOfBezier = startBend - bezierWidth;
    double endBend = sliderPosition + bendWidth / 2;
    double endOfBezier = endBend + bezierWidth;
    double lcp1 = startBend;
    double lcp2 = startBend;
    double rcp1 = endBend;
    double rcp2 = endBend;

    startBend = (startBend <= 0.0) ? 0.0 : startBend;
    startOfBezier = (startOfBezier <= 0.0) ? 0.0 : startOfBezier;
    endBend = (endBend >= size.width) ? size.width : endBend;
    endOfBezier = (endOfBezier >= size.width) ? size.width : endOfBezier;

    Path p = Path();
    p.moveTo(-25, 0);
    p.lineTo(startOfBezier, 0);

    p.cubicTo(lcp1, 0, lcp2, -controlHeight, centerPoint, -controlHeight);
    p.cubicTo(rcp1, -controlHeight, rcp2, 0, endOfBezier, 0);
    p.lineTo(size.width + 25, 0);
    canvas.drawPath(p, linePainter);

    canvas.drawCircle(
      Offset(sliderPosition, 14 - indicatorMargin),
      indicatorRadius,
      indicatorPainter,
    );

    /*
    minValuePainter.layout();
    minValuePainter.paint(canvas, Offset(marginStart, 16));
    maxValuePainter.layout();
    maxValuePainter.paint(canvas, Offset(marginEnd, 16));
*/

    selectedValuePainter.layout();
    selectedValuePainter.paint(
      canvas,
      Offset(
        (sliderPosition - indicatorRadius),
        -42 - indicatorMargin - controlHeight,
      ),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class AgeTitle extends StatelessWidget {
  const AgeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'سن',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: blackColor,
          ),
        ),
      ],
    );
  }
}
