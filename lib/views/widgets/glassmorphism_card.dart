// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

///A widget that creates a container in the glassmorphism style
class GlassContainer extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry padding;
  final constraints;
  final margin;

  const GlassContainer({
    super.key,
    this.child,
    this.constraints,
    this.onTap,
    this.height,
    this.width,
    this.padding = const EdgeInsets.only(left: 30.0, right: 0),
    this.margin = const EdgeInsets.symmetric(vertical: 10),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
                constraints: constraints,
                height: height,
                width: width,
                padding: margin,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.01, 0.2, 0.4, 0.9],
                    colors: [
                      Colors.white.withOpacity(0.4),
                      Colors.white.withOpacity(0.3),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.1),
                    ],
                  ),
                  border: Border.all(
                    width: 1.5,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: child),
          ),
        ),
      ),
    );
  }
}
