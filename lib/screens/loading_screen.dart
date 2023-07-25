
//import for flutter
import "package:flutter/material.dart";

//import my files
import "../services/network.dart";
import "package:quotes/screens/home_screen.dart";

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    getDataFromAPI();
    // TODO: implement initState
    super.initState();
  }

  getDataFromAPI() async{
    final textsData = await Network.getAuthor();
    String image = "https://images.unsplash.com/photo-1687259564825-1050611d715c?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=150&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTY5MDI2OTYzOQ&ixlib=rb-4.0.3&q=80&w=500";
    print(textsData[2][0]);
     if(textsData[2].length > 0) {
      image = await Network.getImage(textsData[2][0]);
    }else{
       image = await Network.getImage("sport");
     }
    if(mounted){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen(
          image:image, texts:textsData),),);
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
