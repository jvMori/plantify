import 'package:flutter/cupertino.dart';

import 'colors.dart';

class BaseBg extends StatelessWidget {
  final Widget? child;

  const BaseBg({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 1],
          colors: [
            primaryColor.withOpacity(0.7),
            primaryColor.withOpacity(1),
          ],
        ),
      ),
      child: child,
    );
  }
}
