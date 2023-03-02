import 'dart:async';
import 'package:flutter/material.dart';

const listImagesListView = [
  'assets/clients/0.jpg',
  'assets/clients/1.jpg',
  'assets/clients/2.jpg',
  'assets/clients/3.jpg',
  'assets/clients/4.jpg',
  'assets/clients/5.jpg',
  'assets/clients/6.jpg',
  'assets/clients/7.jpg',
  'assets/clients/8.jpg',
];

class ImageListView extends StatefulWidget {
  //🔥🔥Me tira un error el sumar el index con el positionindex tengo que acomodarlo
  // final int positionIndex;
  final int duration;
  final bool reverse;
  const ImageListView({
    Key? key,
    // required this.positionIndex,
    required this.duration,
    this.reverse = false,
  }) : super(key: key);

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      /* 
      Agregamos una escucha y esta escuchando la propiedad atEdge que regresa un booleano
      que indica si estamos en el borde superior o inferior del scroll
       */
      if (_scrollController.position.atEdge) {
        _autoScroll();
      }
    });
    //El autoScroll metodo se inicializa luego de que los widget se renderizen y actualicen
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _autoScroll();
    });
  }

  _autoScroll() {
    final currentPosition = _scrollController.offset;
    final endPosition = _scrollController.position.maxScrollExtent;

    scheduleMicrotask(() {
      _scrollController.animateTo(
          currentPosition == endPosition ? 0 : endPosition,
          duration: Duration(seconds: widget.duration),
          curve: Curves.linear);
    });
  }
  /* 
  
    height: 250,
      width: 900,
   */

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: widget.reverse,
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: listImagesListView.length,
      itemBuilder: ((context, index) {
        //🔥🔥Me tira un error el sumar el index con el positionindex tengo que acomodarlo
        final imageindex = listImagesListView[index];
        return _ImageTile(
          image: imageindex,
        );
      }),
    );
  }
}

class _ImageTile extends StatelessWidget {
  final String image;
  const _ImageTile({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: BoxFit.cover,
      width: 500,
    );
  }
}
