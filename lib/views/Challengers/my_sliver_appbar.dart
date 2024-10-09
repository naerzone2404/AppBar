import 'package:flutter/material.dart';

const urlImage = 'https://www.shutterstock.com/image-vector/sky-anime-sunset-background-cartoon-260nw-2473492387.jpg';

class MySliverAppbar extends StatelessWidget {
  const MySliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            
            expandedHeight: 200, // cuanto quiero que se expanda
            backgroundColor: Colors.transparent,
            pinned: true, // para que el appbar o barra se quede cuadno hay scroll hacia arriba
            stretch: true,

            //agregando cosas
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
                StretchMode.fadeTitle
              ],
              title: const Text('Title'),
              centerTitle: true,
              background: Image.network(urlImage, fit: BoxFit.cover,),
            ),
          ),
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