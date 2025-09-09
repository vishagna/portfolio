import 'package:flutter/material.dart';

class PortfolioCard extends StatelessWidget {
  final double? width;
  final double? height;
  final double elevation; // thêm elevation
  final Widget child;
  final EdgeInsets padding;

  const PortfolioCard({
    super.key,
    this.padding = const EdgeInsets.all(16),
    this.width,
    this.height,
    this.elevation = 4, // mặc định giống Card
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: elevation * 2, // càng lớn càng mờ rộng
            spreadRadius: 1,
            offset: Offset(0, elevation), // bóng đổ theo độ cao
          ),
        ],
      ),
      child: child,
    );
  }
}
