import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomImageNetwork extends StatelessWidget {
  final String _path;
  final double? _width;
  final double? _height;

  const CustomImageNetwork(
    String path, {
    super.key,
    double? width,
    double? height,
  }) : _path = path,
       _width = width,
       _height = height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      _path,
      width: _width,
      height: _height,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress != null) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        }

        return FadeIn(child: child);
      },
    );
  }
}
