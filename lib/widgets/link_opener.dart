import 'package:flutter/material.dart';
import 'package:gutenburg/utils/styles.dart';
import 'package:gutenburg/widgets/no_view.dart';

import '../utils/helper.dart';

class LinkOpener extends StatelessWidget {
  const LinkOpener({super.key, required this.formats});
  final Map formats;

  @override
  Widget build(BuildContext context) {
    // formats.map((key, value) {
    //   // print('key: $key');
    //   print('value: $value');
    //   return value;
    // });

    Map links = {};
    List<Widget> linkViews = [];
    formats.forEach((key, value) {
      // print(key);
      if (value.toString().contains('htm')) {
        links['HTML'] = value.toString();
      }
      if (value.toString().contains('pdf')) {
        links['PDF'] = value.toString();
      }
      if (value.toString().contains('txt')) {
        links['TXT'] = value.toString();
      }
    });

    List<MapEntry<dynamic, dynamic>> listMappedEntries = links.entries.toList();
    listMappedEntries.sort((a, b) => b.value.compareTo(a.value));
    links = Map.fromEntries(listMappedEntries);

    for (var element in links.entries) {
      linkViews.add(InkWell(
        onTap: () {
          launchInBrowser(Uri.parse(element.value));
          // opeLink(element.value);
        },
        child: Container(
          margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          color: Styles.secondaryColor,
          child: Center(
            child: Text(
              element.key,
              style: Styles.body,
            ),
          ),
        ),
      ));
    }

    return Material(
        child: linkViews.isNotEmpty
            ? Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Choose a type.',
                      style: Styles.genreCard,
                    ),
                    Flexible(
                      child: ListView.builder(
                          itemCount: linkViews.length,
                          itemBuilder: (context, index) {
                            return linkViews[index];
                          }),
                    ),
                  ],
                ),
              )
            : const NoView());
  }
}
