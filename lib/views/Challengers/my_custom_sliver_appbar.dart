import 'package:flutter/material.dart';

const urlImage = 'https://www.shutterstock.com/image-vector/sky-anime-sunset-background-cartoon-260nw-2473492387.jpg';

class MyCustomSliverAppbar extends StatelessWidget {
  const MyCustomSliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _MyPersistenHeader() ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index){
            return ListTile(
              title: Text('Item: $index'),
            );
          },
          childCount: 20
          ))
        ],
      ),
    );
  }
}

const _maxExtent = 300.0;
class _MyPersistenHeader extends SliverPersistentHeaderDelegate{
  //final int count;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
   //print('shrinkOffset: $shrinkOffset');
   final percent = 1 - (shrinkOffset / _maxExtent);
   print('percent: $percent , shrinkOffset: $shrinkOffset');
   return SizedBox(
    height: maxExtent,
     child: Stack(
      children: [
        //ayuda con el posicionamiento
        Positioned.fill(child: Image.network(urlImage, fit: BoxFit.cover,)),
         Center(child:  Text('My custom sliver appbar', style: TextStyle(color: Colors.white, fontSize: 30 * percent, fontWeight: FontWeight.bold),))
      ],
     ),
   );
  }

  @override
  // Maximo que se extienda
  double get maxExtent => _maxExtent;

  @override
  // Minimo que se extienda
  double get minExtent => kToolbarHeight;

  @override
  //debemos validar si hay una variable
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

}