import 'dart:async';

import 'package:flutter/material.dart';

class ImageListView extends StatefulWidget {
  final int startIndex;
  final int duration;
  const ImageListView({
    Key? key,
    required this.startIndex,
    required this.duration,
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
    final currentScrollPosition = _scrollController.offset;
    final scrollEndPosition = _scrollController.position.maxScrollExtent;

    scheduleMicrotask(() {
      _scrollController.animateTo(
          currentScrollPosition == scrollEndPosition ? 0 : scrollEndPosition,
          duration: Duration(seconds: widget.duration),
          curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: 7,
      itemBuilder: ((context, index) {
        return _ImageTile(
          image: 'assets/clients/${widget.startIndex + index}.jpg',
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
