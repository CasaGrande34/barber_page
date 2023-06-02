import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/utils.dart';
import 'package:landing_page/theme/theme_changer.dart';

import '../../components/row_turn_add.dart';
import '../../components/list_turns.dart';
import '../../components/table_calendar_widget.dart';

//TODO:TABS
List<Widget> tabs = [
  const Text('Turnos Activos'),
  const Text('Turnos Cancelados'),
];

class TurnosScreen extends StatefulWidget {
  const TurnosScreen({super.key});

  @override
  State<TurnosScreen> createState() => _TurnosScreenState();
}

class _TurnosScreenState extends State<TurnosScreen> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    final themeChangerButton = Provider.of<ThemeCharger>(context);
    const titleAppBar = 'Turnos';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: themeChangerButton.toggleTheme,
          icon: (themeChangerButton.isDark == true)
              ? Icon(FontAwesomeIcons.moon, color: appTheme.colorScheme.primary)
              : const Icon(FontAwesomeIcons.sun),
        ),
        title: Text(
          titleAppBar,
          style: FontsApp.oldStandardTt.copyWith(fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizesApp.padding15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizesApp.addVerticalSpace(SizesApp.padding20),
              const RowTurnAdd(),
              const TableCalendarWidget(),
              SizesApp.addVerticalSpace(SizesApp.padding20),
              const Divider(),
              const ListTurns(),
            ],
          ),
        ),
      ),
    );
  }
}
