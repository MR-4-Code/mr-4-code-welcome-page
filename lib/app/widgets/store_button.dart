import 'package:flutter/material.dart';
import 'package:palstore_welcome_page/core/utils/launcher_utils.dart';

class StoreButton extends StatelessWidget {
  final String? link;
  final String image;

  const StoreButton({Key? key, this.link, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: link == null
            ? null
            : () {
                LauncherUtils.to(link!);
              },
        child: Container(
            width: 180,
            height: 50,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/$image.png')))));
  }
}
