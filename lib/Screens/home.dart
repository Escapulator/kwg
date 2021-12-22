import 'package:flutter/material.dart';
import 'package:kwgg/Constants/app_assets.dart';
import 'package:kwgg/Constants/app_colors.dart';
import 'package:kwgg/Screens/view.dart';

class Home extends StatelessWidget {
  static const routeName = '/Home';
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .1),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .4,
              child: Hero(tag: 'logo', child: Image.asset(AppAssets.logo)),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .3),
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
            width: MediaQuery.of(context).size.width * .8,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: AppColors.white,
              onPressed: () {
                Navigator.of(context).pushNamed(View.routeName);
              },
              child: const Text(
                'View Post',
                style: TextStyle(
                    fontSize: 18,
                    color: AppColors.blue,
                    fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
      ),
    );
  }
}
