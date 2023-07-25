import 'package:flutter/material.dart';
import 'package:quotes/screens/loading_screen.dart';
import 'package:quotes/utilities/constant.dart';

class HomeScreen extends StatelessWidget {
  final image;
  final texts;

  refresh(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const LoadingScreen(),
      ),
    );
  }

  const HomeScreen({Key? key, required this.image, required this.texts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    refresh(context);
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex:4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    texts[1],
                    style: constDescTextStyle,
                  ),
                  const SizedBox(height: 16,),
                  Text(
                    texts[0],
                    style: constTitleTextStyle,
                  ),

                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: (){

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: const Text(
                  "ScreenShot",
                  style: constDescTextStyle,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
