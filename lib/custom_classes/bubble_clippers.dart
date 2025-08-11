import 'package:flutter/material.dart';

class SendBubbleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const radius = 12.0;
    final path = Path();

    // Bubble body
    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.lineTo(size.width - radius - 10, 0);
    path.quadraticBezierTo(size.width - 10, 0, size.width - 10, radius);
    path.lineTo(size.width - 10, size.height - radius);
    path.quadraticBezierTo(size.width - 10, size.height,
        size.width - 10 - radius, size.height);
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);
    path.close();

    // Tail at top-right corner (45-degree angle)
    path.moveTo(size.width - 10, radius);
    path.lineTo(size.width, radius - 5);
    path.lineTo(size.width - 10, radius + 10);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ReceiveBubbleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const radius = 12.0;
    final path = Path();

    // Bubble body
    path.moveTo(10, 0);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(size.width, size.height, size.width - radius, size.height);
    path.lineTo(10 + radius, size.height);
    path.quadraticBezierTo(10, size.height, 10, size.height - radius);
    path.lineTo(10, radius);
    path.quadraticBezierTo(10, 0, 10 + radius, 0);
    path.close();

    // Tail at top-left corner (45-degree angle)
    path.moveTo(10, radius);
    path.lineTo(0, radius - 5);
    path.lineTo(10, radius + 10);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}









// import 'package:flutter/material.dart';

// class SendBubbleClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final radius = 12.0;
//     final path = Path();

//     path.moveTo(0, radius);
//     path.quadraticBezierTo(0, 0, radius, 0);
//     path.lineTo(size.width - radius - 10, 0);
//     path.quadraticBezierTo(size.width - 10, 0, size.width - 10, radius);
//     path.lineTo(size.width - 10, size.height - radius);
//     path.quadraticBezierTo(size.width - 10, size.height,
//         size.width - 10 - radius, size.height);
//     path.lineTo(radius, size.height);
//     path.quadraticBezierTo(0, size.height, 0, size.height - radius);
//     path.close();

//     // Tail (Right)
//     path.moveTo(size.width - 10, 20);
//     path.lineTo(size.width, 25);
//     path.lineTo(size.width - 10, 30);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

// class ReceiveBubbleClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final radius = 12.0;
//     final path = Path();

//     path.moveTo(10, 0);
//     path.lineTo(size.width - radius, 0);
//     path.quadraticBezierTo(size.width, 0, size.width, radius);
//     path.lineTo(size.width, size.height - radius);
//     path.quadraticBezierTo(size.width, size.height, size.width - radius, size.height);
//     path.lineTo(10 + radius, size.height);
//     path.quadraticBezierTo(10, size.height, 10, size.height - radius);
//     path.lineTo(10, radius);
//     path.quadraticBezierTo(10, 0, 10 + radius, 0);
//     path.close();

//     // Tail (Left)
//     path.moveTo(10, 20);
//     path.lineTo(0, 25);
//     path.lineTo(10, 30);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
