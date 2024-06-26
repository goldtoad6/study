import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tutorials/component/log/logs.dart';

/// An example of the elevated card type.
///
/// The default settings for [Card] will provide an elevated
/// card matching the spec:
///
/// https://m3.material.io/components/cards/specs#a012d40d-7a5c-4b07-8740-491dec79d58b
class NameCardSchool extends StatefulWidget {
  const NameCardSchool(
      {Key? key,
        this.title = "",
        this.url = "assets/images/user_null.png",
        this.onTap})
      : super(key: key);
  final String title;
  final String url;
  final GestureTapCallback? onTap;

  @override
  _NameCardBasicState createState() => _NameCardBasicState();
}

class _NameCardBasicState extends State<NameCardSchool> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: widget.onTap,
        child: Card(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(widget.title),
                ),
                ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: widget.url,
                    placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Image.file(
                      File(''),
                      width: 150,
                      height: 150,
                    ),
                    height: 86,
                    width: 86,
                  ),
                  title: Text('The Enchanted Nightingale'),
                  subtitle:
                  Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('编辑'),
                      onPressed: () {
                        Logs.info("bianji clicked...");
                      },
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      child: const Text('分享'),
                      onPressed: () {
                        /* ... */
                      },
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
