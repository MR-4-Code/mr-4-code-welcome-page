import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

final Map<String, String> data = {
  'We provide services maybe any merchant is need it.': '',
  'Why PalStore?':
      '''PalStore free system allows your business to accept payments from customers and keep track of sales. It sounds simple enough, but the setup can work in different ways, depending on whether you sell online, have a physical storefront, or both. tracing your customers transactions, join now to see more.

Once open new merchant account in PalStore system automatically we create your own online store , then any user on PalStore can find your store and see your products , offers and visit store profile to see more about your store.

No limit for publishing offers or products in your store.

Up to 3 free stores for each merchant account.
  ''',
  'All you need to be merchant in PalStore family in 5 Steps:': '''
 1-Just open new account on PalStore for mobile application GooglePlay.

2-From side menu go to open new merchant account then send request.

3-Download PalStore app for Desktop.

4-Login to your account , same account you created on mobile app.

5-Create your own company, then open first store to continue.
  ''',
  'Contact us': 'mrdev.ps@gmail.com',
};

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = data.entries.map(_buildAboutSection).toList();
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.all(30.0),
            child: ListView.separated(
                itemBuilder: (_, index) => children.elementAt(index),
                separatorBuilder: (_, index) => const Divider(thickness: 2),
                itemCount: children.length)));
  }

  Widget _buildAboutSection(MapEntry<String, String> entry) {
    final child = Section(title: entry.key, data: entry.value);
    if (entry.key.toLowerCase().contains('contact')) {
      return InkWell(
          onTap: () {
            launchUrl(Uri.parse('mailto:${entry.value}'));
          },
          child: Section(title: entry.key, data: entry.value));
    }
    return child;
  }
}

class Section extends StatelessWidget {
  final String title;
  final String data;

  const Section({Key? key, required this.title, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Title(title: title),
      const SizedBox(height: 10.0),
      Text(data, style: GoogleFonts.cairo(fontSize: 18.0, color: Colors.grey))
    ]);
  }
}

class Title extends StatelessWidget {
  final String title;
  const Title({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.cairo(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }
}
