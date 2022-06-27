import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hand_sign/utils.dart';

class SignatureResultScreen extends StatelessWidget {
  const SignatureResultScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<ByteData>(
        valueListenable: rawImage,
        builder: (context, data, child) {
          if (data == null) {
            return Container(
              color: Colors.red,
              child: const Center(
                child: Text('no signature!'),
              ),
            );
          } else {
            return Center(child: Image.memory(data.buffer.asUint8List()));
          }
        },
      ),
    );
  }
}
