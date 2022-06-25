import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:technicaltest_danafix/app/utils/enum.dart';
import 'package:technicaltest_danafix/app/utils/network/connectivity_service.dart';

class NetworkSensitive extends StatefulWidget {
  final Widget child;

  const NetworkSensitive({Key? key, required this.child}) : super(key: key);

  @override
  State<NetworkSensitive> createState() => _NetworkSensitiveState();
}

class _NetworkSensitiveState extends State<NetworkSensitive> {
  bool _ignored = false;

  @override
  Widget build(BuildContext context) {
    final connectivityStatus = Provider.of<ConnectivityStatus>(context);
    if (connectivityStatus != ConnectivityStatus.offline || _ignored) return widget.child;

    return Scaffold(
      body: Stack(
        children: [
          widget.child,
          const Opacity(
            opacity: 0.6,
            child: ModalBarrier(
              dismissible: false,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsetsDirectional.only(
                                top: 24,
                                bottom: 22.82,
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/no_connection.jpg',
                                  height: 120,
                                  width: 160,
                                ),
                              ),
                            ),
                            Text(
                              'Yah, koneksinya terputus',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            const SizedBox(height: 8),
                            Text(
                                'Cek koneksi Wifi atau kuota internet kamu, lalu coba lagi.',
                                style: Theme.of(context).textTheme.bodyText1),
                            const SizedBox(height: 20),
                            // CustomTextButton(
                            //   label: 'Oke',
                            //   onPressed: () {
                            //     setState(() {
                            //       _ignored = true;
                            //     });
                            //   },
                            // ),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _ignored = true;
                                  });
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _ignored = true;
                          });
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
