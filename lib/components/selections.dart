import 'package:flutter/material.dart';

class Selections {
  final String imgPath;
  final String productNam;

  Selections({
    required this.imgPath,
    required this.productNam
});
}

class SelectionTile extends StatelessWidget {
  SelectionTile({super.key,
    required this.imgPath,
    required this.productNam
  });

  final String imgPath;
  final String productNam;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [          // Pictures
          CircleAvatar(
            radius: 45,
              backgroundImage: AssetImage(imgPath)),
          // name
          Text(productNam)
        ],
    );
  }
}
