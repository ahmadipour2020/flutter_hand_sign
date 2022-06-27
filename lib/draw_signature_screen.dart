import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hand_sign/signature_result_screen.dart';
import 'package:flutter_hand_sign/utils.dart';
import 'package:hand_signature/signature.dart';

class DrawSignatureScreen extends StatelessWidget {
  const DrawSignatureScreen({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  constraints: const BoxConstraints.expand(),
                                  color: Colors.white,
                                  child: HandSignature(
                                    control: control,
                                    type: SignatureDrawType.shape,
                                  ),
                                ),
                                CustomPaint(
                                  painter: DebugSignaturePainterCP(
                                    control: control,
                                    cp: false,
                                    cpStart: false,
                                    cpEnd: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            CupertinoButton(
                              onPressed: () {
                                control.clear();
                                rawImage.value = null;
                              },
                              child: const Text('clear'),
                            ),
                            CupertinoButton(
                              onPressed: () async {
                                rawImage.value = await control
                                    .toImage(
                                  fit: true,
                                  color: Colors.blueAccent,
                                  background: Colors.greenAccent,
                                )
                                    .whenComplete(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignatureResultScreen()));
                                });
                              },
                              child: const Text('confirm'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
