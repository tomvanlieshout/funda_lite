import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BrokerSection extends StatelessWidget {
  final String phoneNo;

  const BrokerSection(this.phoneNo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Row(
          children: [
            const Text('Neem contact op: '),
            Row(
              children: [
                Text(phoneNo),
                IconButton(
                    onPressed: () => launchUrl(Uri(scheme: 'tel', path: phoneNo)),
                    icon: Icon(
                      Icons.phone,
                      size: 18,
                      color: Colors.green[700],
                    )),
              ],
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
