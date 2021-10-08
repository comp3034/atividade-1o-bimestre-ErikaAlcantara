import 'dart:math' as math;
import 'package:bodyapp/shared/colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class MedidasScreen extends StatelessWidget {
  const MedidasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Medidas'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              height: height - 64,
              child: Image.asset(
                'assets/images/women-silhouette.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              bottom: 8,
              left: width * .3,
              child: Text('atualizado em ${DateTime.now()}'),
            ),
            Positioned(
              right: 48,
              top: 48,
              child: Row(
                children: [
                  MeasureLabelWidget(
                    label: 'Altura',
                    value: '170',
                    measure: 'cm',
                  ),
                  SizedBox(width: 16),
                  MeasureLabelWidget(
                    label: 'Peso',
                    value: '70',
                    measure: 'kg',
                  ),
                ],
              ),
            ),
            Positioned(
              right: 28,
              bottom: 350,
              child: Column(
                children: [
                  SizedBox(
                    width: 90,
                    height: 95,
                    child: CustomPaint(
                      child: Padding(
                        padding: EdgeInsets.only(left: 14, right: 8, top: 16),
                        child: MeasureLabelWidget(
                        label: '  Gordura',
                        value: '170',
                        ),
                      ),
                      painter: GradientArcPainter(
                      progress: 0.7,
                      startColor: Colors.green,
                      middleColor: Colors.red,
                      endColor: Colors.blue,
                      width: 6.0
                      ),
                    ),
                  ),  
                ],
              ),
            ),
            Positioned(
              right: 28,
              bottom: 230,
              child: Column(
                children: [
                  SizedBox(
                    width: 90,
                    height: 95,
                    child: CustomPaint(
                      child: Padding(
                        padding: EdgeInsets.only(left: 25, right: 8, top: 16),
                        child: MeasureLabelWidget(
                        label: '  IMC',
                        value: '22',
                        ),
                      ),
                      painter: GradientArcPainter(
                      progress: 0.7,
                      startColor: Colors.green,
                      middleColor: Colors.red,
                      endColor: Colors.blue,
                      width: 6.0
                      ),
                    ),
                  ),  
                ],
              ),
            ),
            NestedMeasureWidget(
              top: 127,
              left: 0,
              width: width * .4,
              label: 'Pescoço',
              value: '95',
              measure: ' cm',
            ),
            NestedMeasureWidget(
              top: 167,
              left: 0,
              width: width * .6,
              label: 'Peito',
              value: '95',
              measure: ' cm',
            ),
            NestedMeasureWidget(
              top: 207,
              left: 35,
              width: width * .32,
              label: 'Biceps',
              value: '95',
              measure: ' cm',
            ),
            NestedMeasureWidget(
              top: 252,
              left: 0,
              width: width * .6,
              label: 'Cintura',
              value: '95',
              measure: ' cm',
            ),
            NestedMeasureWidget(
              top: 297,
              left: 0,
              width: width * .4,
              label: 'Quadril',
              value: '95',
              measure: ' cm',
            ),
            NestedMeasureWidget(
              top: 367,
              left: 0,
              width: width * .6,
              label: 'Coxa',
              value: '95',
              measure: ' cm',
            ),
            NestedMeasureWidget(
              top: 460,
              left: 0,
              width: width * .4,
              label: 'Panturrilha',
              value: '95',
              measure: ' cm',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
class NestedMeasureWidget extends StatelessWidget {
  NestedMeasureWidget({
    Key? key,
    required this.width,
    this.top = 0,
    this.left = 0,
    required this.label,
    required this.value,
    this.measure = '',
  }) : super(key: key);

  final double width;
  final double top;
  final double left;
  final String label;
  final String value;
  final String measure;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 8),
                child: DottedLine(
                  dashGapLength: 8,
                ),
              ),
            ),
            MeasureLabelWidget(
              label: '$label',
              value: '$value',
              measure: '$measure',
            ),
          ],
        ),
      ),
    );
  }
}

class MeasureLabelWidget extends StatelessWidget {
  final String label;
  final String value;
  final String measure;

  const MeasureLabelWidget({
    Key? key,
    required this.label,
    required this.value,
    this.measure = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label'),
        RichText(
          text: TextSpan(
            text: '$value',
            style: TextStyle(
              fontSize: 36,
              color: Colors.black
            ),
            children: [
              TextSpan(
                text: ' $measure',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class GradientArcPainter extends CustomPainter {
  const GradientArcPainter({
    required this.progress,
    required this.startColor,
    required this.middleColor,
    required this.endColor,
    required this.width,
  })  : assert(progress != null),
        assert(progress != null),
        assert(startColor != null),
        assert(middleColor != null),
        assert(endColor != null),
        assert(width != null),
        super();

  final double progress;
  final Color startColor;
  final Color middleColor;
  final Color endColor;
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = new Rect.fromLTWH(.0, 0.0, size.width, size.height);
    final gradient = new SweepGradient(
      startAngle: 3 * math.pi / 2,
      endAngle: 7 * math.pi / 2,
      tileMode: TileMode.repeated,
      colors: [startColor, middleColor, endColor],
    );

    final paint = new Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.butt  // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    final center = new Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (width / 2);
    final startAngle = math.pi;
    final sweepAngle = 2 * math.pi * progress;
    canvas.drawArc(new Rect.fromCircle(center: center, radius: radius),
        startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}