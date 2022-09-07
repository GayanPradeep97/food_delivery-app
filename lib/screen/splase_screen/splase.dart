import 'package:flutter/material.dart';
import 'package:food_app/screen/splase_screen/getting_started.dart';

class SplaseScreen extends StatefulWidget {
  const SplaseScreen({Key? key}) : super(key: key);

  @override
  State<SplaseScreen> createState() => _SplaseScreenState();
}

class _SplaseScreenState extends State<SplaseScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GettingStarted()));
    });
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/food.png'),
              SizedBox(
                height: 8,
              ),
              Text(
                'No waiting for foods',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
