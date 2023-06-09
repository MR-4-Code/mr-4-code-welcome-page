import 'package:flutter/material.dart';
import 'package:palstore_welcome_page/app/widgets/build_text.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _LangButton('العربية'),
            _LangButton('English'),
          ],
        ),
      ),
    );
  }
}

class _LangButton extends StatelessWidget {
  final String title;

  const _LangButton(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          //TODO:update app language then go to download page [main screen]
          final localeKey = title == 'English' ? 'en' : 'ar';
        },
        child: BuildText(data: title));
  }
}
