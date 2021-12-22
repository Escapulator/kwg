import 'package:flutter/material.dart';
import 'package:kwgg/Constants/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KwgWebsite extends StatefulWidget {
  static const routeName = '/KwgWebsite';
  const KwgWebsite({Key? key}) : super(key: key);

  @override
  State<KwgWebsite> createState() => _KwgWebsiteState();
}

class _KwgWebsiteState extends State<KwgWebsite> {
  late WebViewController? controller;
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controller!.canGoBack()) {
          await controller!.goBack();
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blue,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).colorScheme.onSecondary,
              )),
          title: const Text(
            'KWG Softworks',
            style:
                TextStyle(color: AppColors.white, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () async {
                if (await controller!.canGoBack()) {
                  await controller!.goBack();
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.refresh_sharp),
              onPressed: () {
                controller!.reload();
              },
            )
          ],
          elevation: 0,
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              color: Colors.red,
              value: progress,
            ),
            Expanded(
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: 'https://www.kwgsoftworks.com/',
                onWebViewCreated: (controller) {
                  this.controller = controller;
                },
                onProgress: (progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
