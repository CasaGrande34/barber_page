import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/utils.dart';
import 'package:landing_page/models/turno.dart';
import '../../../../utils/buttons/button_blue.dart';
import 'package:landing_page/theme/theme_changer.dart';

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
              const _FirstSection(),
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

class _FirstSection extends StatelessWidget {
  const _FirstSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMd().format(DateTime.now()),
              // DateFormat.yMMMMd().format(DateTime.now()),
              style: FontsApp.nunito.copyWith(fontSize: 19),
            ),
            const Text('Hoy'),
          ],
        ),
        const Spacer(),
        SizedBox(
          height: 40,
          width: 100,
          child: ButtonBlue(
            text: 'Turno +',
            onPressed: () {},
          ),
        )
      ],
    );
  }
}

class ListTurns extends StatefulWidget {
  const ListTurns({
    super.key,
  });

  @override
  State<ListTurns> createState() => _ListTurnsState();
}

class _ListTurnsState extends State<ListTurns>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 10, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    List<Turno> turnos = [
      Turno(
        profesionalElegido: 'Rodrigo Galloso',
        turn: 1,
        iconService: 'assets/icons/tijera_blanca.png',
        abonado: false,
        user: 'Matias Echavarria',
        day: DateTime.now(),
        service: 'Corte de pelo',
        price: 2400,
      ),
      Turno(
        profesionalElegido: 'Joako Marcello',
        turn: 2,
        iconService: 'assets/icons/barba_blanca.png',
        abonado: false,
        user: 'Matias Echavarria Jaramillo',
        day: DateTime.now(),
        service: 'Corte de pelo + barba',
        price: 2400,
      ),
      Turno(
        profesionalElegido: 'Rodrigo Galloso',
        turn: 1,
        iconService: 'assets/icons/brocha_blanca.png',
        abonado: false,
        user: 'Matias Echavarria',
        day: DateTime.now(),
        service: 'Corte de pelo',
        price: 2400,
      ),
      Turno(
        profesionalElegido: 'Rodrigo Galloso',
        turn: 1,
        iconService: 'assets/icons/navaja_blanca.png',
        abonado: false,
        user: 'Matias Echavarria',
        day: DateTime.now(),
        service: 'Corte de pelo',
        price: 2400,
      ),
      Turno(
        profesionalElegido: 'Rodrigo Galloso',
        turn: 1,
        iconService: 'assets/icons/barba_blanca.png',
        abonado: false,
        user: 'Matias Echavarria',
        day: DateTime.now(),
        service: 'Corte de pelo',
        price: 2400,
      ),
      Turno(
        profesionalElegido: 'Rodrigo Galloso',
        turn: 1,
        iconService: 'assets/icons/barba_blanca.png',
        abonado: false,
        user: 'Matias Echavarria',
        day: DateTime.now(),
        service: 'Corte de pelo',
        price: 2400,
      ),
    ];

    return SizedBox(
      height: h,
      width: w,
      child: Column(
        children: [
          SizesApp.addVerticalSpace(SizesApp.padding5),
          SizedBox(
            height: w * 0.12,
            child: TabBar(
              isScrollable: true,
              tabs: List.generate(10, (index) => const TurnosItemTabBar()),
              controller: tabController,
            ),
          ),
          SizesApp.addVerticalSpace(SizesApp.padding5),
          SizedBox(
            height: h - 100,
            width: w,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(8.0),
              itemCount: turnos.length,
              itemBuilder: (context, index) {
                final turno = turnos[index];
                return FlipCard(
                  front: ItemTurnos(
                    turno: turno,
                  ),
                  back: ItemTurnos(turno: turno),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TurnosItemTabBar extends StatelessWidget {
  const TurnosItemTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child:
          Text('Turnos Activos', style: FontsApp.roboto.copyWith(fontSize: 18)),
    );
  }
}

class ItemTurnos extends StatelessWidget {
  final Turno turno;
  const ItemTurnos({
    super.key,
    required this.turno,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: SizesApp.padding10),
      padding: EdgeInsets.only(
        left: 10,
      ),
      width: w,
      height: h * 0.22,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(SizesApp.padding10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 10),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.pink],
                ),
              ),
              child: Column(
                children: [
                  SizesApp.addVerticalSpace(SizesApp.padding10),
                  Text(
                    'Turno',
                    style: FontsApp.roboto.copyWith(
                        fontSize: w * 0.04, fontWeight: FontWeight.bold),
                  ),
                  SizesApp.addVerticalSpace(SizesApp.padding10),
                  ClipOval(
                    child: Container(
                      alignment: Alignment.center,
                      height: w * 0.09,
                      width: w * 0.09,
                      color: Colors.black,
                      child: Text(
                        turno.turn.toString(),
                        textAlign: TextAlign.center,
                        style: FontsApp.roboto.copyWith(
                            fontSize: w * 0.04, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizesApp.addVerticalSpace(8),
                  Image.asset(
                    'assets/logos/logo_barberia_color.png',
                    fit: BoxFit.contain,
                    height: w * 0.15,
                  ),
                  SizesApp.addVerticalSpace(SizesApp.padding10),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const VerticalDivider(
                  width: 0,
                  color: Colors.black,
                ),
                SizesApp.addHorizontalSpace(SizesApp.padding5),
                Padding(
                  padding: const EdgeInsets.all(SizesApp.padding5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        turno.service,
                        style: FontsApp.oswald.copyWith(fontSize: 20),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'El servicio es con:',
                        style: FontsApp.nunito.copyWith(fontSize: 15),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        turno.profesionalElegido,
                        style: FontsApp.nunito.copyWith(fontSize: 15),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizesApp.addVerticalSpace(SizesApp.padding5),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black38,
                            radius: w * 0.05,
                            child: Image.asset(
                              turno.iconService,
                              height: w * 0.078,
                            ),
                          ),
                          SizesApp.addHorizontalSpace(SizesApp.padding5),
                          Text(
                            '\$\t${turno.price}',
                            style: FontsApp.rajdhani.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: w * 0.05),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: w * 0.06,
                        width: w * 0.45,
                        child: Marquee(
                          text:
                              '  Si abonas antes de llegado el turno tenes -10% de descuento',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(SizesApp.padding10),
                  bottomRight: Radius.circular(SizesApp.padding10),
                ),
              ),
              child: Column(
                children: const [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
