import 'package:flutter/material.dart';
import 'dart:math' as math;

class SlantedImageCards extends StatelessWidget {
  final List<String> assetPaths;

  const SlantedImageCards({required this.assetPaths, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      final double cardWidth = width * 0.35;
      final double cardHeight = width * 0.45;
      double spacing = 95.0;
      double slant = 0.125;

      // Calculate the horizontal displacement due to rotation
      // Using sin(angle) * height/2 gives the horizontal shift of corners
      final List<double> horizontalShifts =
          List.generate(assetPaths.length, (index) {
        final angle = -slant + index * slant;
        return math.sin(angle) * cardHeight / 2;
      });

      // Total visual width considering rotation effects
      final totalVisualWidth = cardWidth + (assetPaths.length - 1) * spacing;

      // Average horizontal shift to apply as offset
      final avgShift =
          horizontalShifts.reduce((a, b) => a + b) / horizontalShifts.length;

      return Center(
        child: SizedBox(
          width: width,
          child: Stack(
            alignment: Alignment.center,
            children: List.generate(assetPaths.length, (index) {
              final angle = -slant + index * slant;

              return Positioned(
                left: (width - totalVisualWidth) / 2 +
                    (index * spacing) -
                    avgShift,
                top: 20,
                child: Transform.rotate(
                  angle: angle,
                  alignment: Alignment.center,
                  child: Container(
                    width: cardWidth,
                    height: cardHeight,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(2, 4),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(assetPaths[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      );
    });
  }
}
