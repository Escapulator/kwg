import 'package:flutter/material.dart';
import 'package:kwgg/Constants/app_colors.dart';
import 'package:kwgg/Core/api_response.dart';
import 'package:kwgg/Models/post_view_model.dart';
import 'package:kwgg/Screens/kwg_website.dart';
import 'package:kwgg/Services/post_services.dart';
import 'package:kwgg/Widgets/post_widgets.dart';
import 'package:kwgg/Widgets/shimmer.dart';

class View extends StatefulWidget {
  static const routeName = '/View';
  const View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  PostServices postServices = PostServices();
  APIResponse<List<PostViewModel>>? _apiResponse;
  Future<void> getPosts() async {
    _apiResponse = await postServices.getPost();
  }

  @override
  Widget build(BuildContext context) {
    double abs = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;
    double height = MediaQuery.of(context).size.height - abs;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blue,
          centerTitle: true,
          title: const Text(
            'Posts',
            style: TextStyle(
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: IconButton(
                icon: const Icon(Icons.ios_share_rounded),
                onPressed: () {
                  Navigator.of(context).pushNamed(KwgWebsite.routeName);
                },
              ),
            )
          ],
        ),
        backgroundColor: AppColors.gray,
        body: FutureBuilder(
            future: getPosts(),
            builder: (context, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        itemCount: 10,
                        itemBuilder: (context, index) => ShimmerLoader(
                              height: height,
                            ))
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        itemCount: 50,
                        itemBuilder: (context, index) => PostWidget(
                            body: _apiResponse!.data![index].body!,
                            email: _apiResponse!.data![index].email!,
                            id: _apiResponse!.data![index].id!,
                            name: _apiResponse!.data![index].name!,
                            height: height,
                            postId: _apiResponse!.data![index].postId!))));
  }
}
