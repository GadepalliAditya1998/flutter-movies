import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  final String tag;
  final String url;
  const ImagePreview({Key key, this.url, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(fit: StackFit.expand, children: [
          Hero(
            tag: tag,
            child: Image.network(
              this.url,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, event) {
                if (event == null) {
                  return child;
                }
                return Center(
                    child: Container(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ));
              },
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.of(context).pop(),
            ),
          )
        ]),
      ),
    );
  }
}
