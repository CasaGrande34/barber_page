import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme_changer.dart';
import '../../../../utils/utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> profileListWidgets = [
      SizesApp.addVerticalSpace(60),
      const ProfileImageAndButtonTheme(),
      SizesApp.addVerticalSpace(SizesApp.padding30),
      const TitleText(),
      SizesApp.addVerticalSpace(SizesApp.padding5),
      const SubtitleText(),
      SizesApp.addVerticalSpace(SizesApp.padding15),
      const _FiladeItems(),
      SizesApp.addVerticalSpace(85),
      const ContainerMenuOptions()
    ];

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.from(profileListWidgets),
        ),
      ),
    );
  }
}

class ContainerMenuOptions extends StatelessWidget {
  const ContainerMenuOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.7,
      width: w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizesApp.padding20),
        color: Colors.black38,
      ),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ItemListView(index: index),
      ),
    );
  }
}

class ItemListView extends StatelessWidget {
  final int index;
  const ItemListView({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(SizesApp.padding10),
      height: 100,
      width: w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizesApp.padding25),
        color: Colors.blueGrey,
      ),
      child: const ListTile(
        title: Text('Item'),
        leading: Icon(Icons.workspaces_filled),
        trailing: Icon(FontAwesomeIcons.adversal),
        subtitle: Text('Cillum ad in Lorem non occaecat enim ut veniam amet.'),
      ),
    );
  }
}

class ProfileImageAndButtonTheme extends StatelessWidget {
  const ProfileImageAndButtonTheme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final themeChangerButton = Provider.of<ThemeCharger>(context);
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    return Row(
      children: [
        const Spacer(),
        SizesApp.addHorizontalSpace(w * 0.15),
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: w * 0.2,
        ),
        const Spacer(),
        IconButton(
          iconSize: w * 0.09,
          highlightColor: Colors.black26,
          splashColor: Colors.pink,
          style: const ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.black)),
          onPressed: themeChangerButton.toggleTheme,
          icon: (themeChangerButton.isDark == true)
              ? Icon(FontAwesomeIcons.moon,
                  color: appTheme.colorScheme.secondary)
              : const Icon(
                  FontAwesomeIcons.sun,
                  color: Colors.amber,
                ),
        ),
        SizesApp.addHorizontalSpace(SizesApp.padding10),
      ],
    );
  }
}

class SubtitleText extends StatelessWidget {
  const SubtitleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Text(
      'subtitledel nombre del  perfil',
      style: FontsApp.nunito.copyWith(fontSize: w * 0.034),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Text(
      'Nombre de perfil',
      style: FontsApp.oldStandardTt.copyWith(fontSize: w * 0.06),
    );
  }
}

class _FiladeItems extends StatefulWidget {
  const _FiladeItems();

  @override
  State<_FiladeItems> createState() => _FiladeItemsState();
}

class _FiladeItemsState extends State<_FiladeItems> {
  @override
  Widget build(BuildContext context) {
    // final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 100,
          width: w,
          color: Colors.black,
        ),
        Positioned(
          bottom: -50,
          child: Row(
            children: [
              SizesApp.addHorizontalSpace(w * 0.055),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: -150, end: 1),
                duration: const Duration(milliseconds: 800),
                curve: Curves.ease,
                builder: (context, value, child) => Transform.translate(
                  offset: Offset(0.0, value),
                  child: const _ItemBox(),
                ),
              ),
              SizesApp.addHorizontalSpace(w * 0.071),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: -150, end: 1),
                duration: const Duration(milliseconds: 1200),
                curve: Curves.ease,
                builder: (context, value, child) => Transform.translate(
                  offset: Offset(0.0, value),
                  child: const _ItemBox(),
                ),
              ),
              SizesApp.addHorizontalSpace(w * 0.07),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: -150, end: 1),
                duration: const Duration(milliseconds: 1700),
                curve: Curves.ease,
                builder: (context, value, child) => Transform.translate(
                  offset: Offset(0.0, value),
                  child: const _ItemBox(),
                ),
              ),
              SizesApp.addHorizontalSpace(w * 0.07),
            ],
          ),
        ),
      ],
    );
  }
}

class _ItemBox extends StatelessWidget {
  const _ItemBox();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 1200),
            curve: Curves.decelerate,
            builder: (context, value, child) => AnimatedOpacity(
              duration: const Duration(milliseconds: 1200),
              opacity: value,
              child: Text(
                'Consequat.',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: FontsApp.nunito.copyWith(fontSize: w * 0.039),
              ),
            ),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 1200),
            curve: Curves.decelerate,
            builder: (context, value, child) => AnimatedOpacity(
              duration: const Duration(milliseconds: 1200),
              opacity: value,
              child: Text(
                '124k',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: FontsApp.nunito.copyWith(fontSize: w * 0.045),
              ),
            ),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 1200),
            curve: Curves.decelerate,
            builder: (context, value, child) => AnimatedOpacity(
              duration: const Duration(milliseconds: 1200),
              opacity: value,
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(SizesApp.padding15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
