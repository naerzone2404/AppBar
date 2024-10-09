import 'dart:ui';

import 'package:flutter/material.dart';

class MyAppbarChallenge extends StatefulWidget {
  const MyAppbarChallenge({super.key});

  @override
  State<MyAppbarChallenge> createState() => _MyAppbarChallengeState();
}

class _MyAppbarChallengeState extends State<MyAppbarChallenge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
       _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF17151F),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(pinned: true, delegate: _MyCustomHeader(_controller)),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return ListTile(
              title: Text(
                'Item: $index',
                style: const TextStyle(color: Colors.white),
              ),
            );
          }, childCount: 15))
        ],
      ),
    );
  }
}

const _maxHeaderHeight = 250.0;
const _avatarImage =
    'https://oh-lux.com/wp-content/uploads/2023/05/47CKGY5WIRGSZIEF3RDBA6GJQM.jpg';

class _MyCustomHeader extends SliverPersistentHeaderDelegate {
  final Animation<double> animation;

  _MyCustomHeader(this.animation);

   
   
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const maxImageSize = _maxHeaderHeight * 0.7;
    const minImageSize = kToolbarHeight - 20;

    final percent = 1 - (shrinkOffset / _maxHeaderHeight);
    final imageSize = lerpDouble(minImageSize, maxImageSize, percent)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: DecoratedBox(
        decoration: const BoxDecoration(
            color: Color(0xFFD0BCC9),
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(
                  _maxHeaderHeight / 2)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white54,
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: Offset(0, 1)
                )
              ]
            ),
        child: Center(
                child: _MyAnimatedAvatar(imageSize: imageSize / 2, listenable: animation)     
                  ),
      
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => _maxHeaderHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class _MyAnimatedAvatar extends AnimatedWidget {
  const _MyAnimatedAvatar({required this.imageSize , required super.listenable});
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: listenable as Animation<double>,
      child: CircleAvatar(
        radius:  imageSize ,
        backgroundImage: const NetworkImage(_avatarImage),
      ),
    );
  }
}
