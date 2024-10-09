

import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Icon(Icons.refresh),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.refresh),),
         
        ],
       leading: IconButton(onPressed: (){}, icon: const Icon(Icons.refresh),),
      ),
     
    );
  }
}