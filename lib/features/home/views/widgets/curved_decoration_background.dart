import 'package:books_app_client/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CurvedDecorationBackground extends StatelessWidget {
  const CurvedDecorationBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurveClipper(context),
      child: Container(
        height: context.setHeight(312),
        width: double.infinity,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  CurveClipper(this.context);

  final BuildContext context;

  @override
  Path getClip(Size size) {
    double curveHeight = context.setHeight(102);
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);
    Path path = Path();
    path.lineTo(0, size.height - curveHeight);
    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
