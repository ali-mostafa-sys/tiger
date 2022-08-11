import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class LauncherScreen extends StatefulWidget {
  const LauncherScreen({Key? key}) : super(key: key);

  @override
  _LauncherScreenState createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: (){
              AutoRouter.of(context).pushNamed('/login');
            },
            child: Text('anwdaakdnpad'),
            
          ),
        ),
      ),
    );
  }
}
