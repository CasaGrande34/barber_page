import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:landing_page/UI/home_layout/components/item_service.dart';
import 'package:landing_page/main.dart';

import 'package:marquee/marquee.dart';
import 'package:flip_card/flip_card.dart';

import '../../../models/service.dart';
import '../../../utils/utils.dart';
import '../../../models/turno.dart';

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
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return SizedBox(
      height: h,
      width: w,
      child: Column(
        children: [
          SizesApp.addVerticalSpace(SizesApp.padding5),
          const TabBarWidget(),
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
                  back: const ItemTurnosBack(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ItemTurnosBack extends StatelessWidget {
  const ItemTurnosBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: SizesApp.padding10),
      padding: const EdgeInsets.only(
        left: 10,
      ),
      width: context.w,
      height: context.h * 0.22,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(SizesApp.padding10),
      ),
      child: const Text('Hola'),
    );
  }
}

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({
    super.key,
  });

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.w * 0.15,
      child: TabBar(
        tabs: List.generate(
          3,
          (index) => const TurnosItemTabBar(),
        ),
        isScrollable: true,
        controller: tabController,
      ),
    );
  }
}

class TurnosItemTabBar extends StatelessWidget {
  const TurnosItemTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      alignment: Alignment.center,
      height: context.h * 0.25,
      width: context.w * 0.25,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(SizesApp.padding15),
      ),
      child: Text(
        'Turnos Activos',
        style: FontsApp.roboto
            .copyWith(fontSize: context.w * 0.035, color: Colors.white),
        textAlign: TextAlign.center,
      ),
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
      padding: const EdgeInsets.only(
        left: 10,
      ),
      width: w,
      height: h * 0.21,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(SizesApp.padding10),
      ),
      child: Stack(
        children: [
          Container(
            height: context.w * 0.085,
            width: context.w,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(SizesApp.padding10),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            child: SizedBox(
              height: context.w * 0.06,
              width: context.w,
              child: Marquee(
                text:
                    ' Si abonas el turno al momento de reservar tenes 10% de descuento',
                velocity: 10,
                style: FontsApp.rajdhani
                    .copyWith(fontSize: 13, color: Colors.white54),
              ),
            ),
          ),
          Row(
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
                            fontSize: w * 0.03, fontWeight: FontWeight.bold),
                      ),
                      SizesApp.addVerticalSpace(SizesApp.padding10),
                      ClipOval(
                        child: Container(
                          alignment: Alignment.center,
                          height: w * 0.075,
                          width: w * 0.075,
                          color: Colors.black,
                          child: Text(
                            turno.turn.toString(),
                            textAlign: TextAlign.center,
                            style: FontsApp.roboto.copyWith(
                                fontSize: w * 0.035,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/logos/logo_barberia_color.png',
                        fit: BoxFit.contain,
                        height: w * 0.156,
                      ),
                      SizesApp.addVerticalSpace(SizesApp.padding10),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
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
                            turno.service.name,
                            style: FontsApp.lobster
                                .copyWith(fontSize: context.w * 0.05),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizesApp.addVerticalSpace(SizesApp.padding5),
                          Text(
                            'El servicio es con',
                            style: FontsApp.nunito
                                .copyWith(fontSize: context.w * 0.034),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Text(
                                turno.profesionalElegido,
                                style: FontsApp.nunito.copyWith(
                                    fontSize: context.w * 0.034,
                                    fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizesApp.addHorizontalSpace(SizesApp.padding5),
                              Icon(Icons.star, size: context.w * 0.03),
                            ],
                          ),
                          SizesApp.addVerticalSpace(SizesApp.padding10),
                          Row(
                            children: [
                              ItemService(
                                service: turno.service,
                                factor: 0.04,
                              ),
                              SizesApp.addHorizontalSpace(SizesApp.padding5),
                              Text(
                                turno.service.price.toString(),
                                style: FontsApp.rajdhani.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: w * 0.05),
                              ),
                            ],
                          ),
                          SizesApp.addVerticalSpace(SizesApp.padding10),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: w * 0.05,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              size: context.w * 0.047,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: w * 0.05,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.pencil,
                              size: context.w * 0.047,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: w * 0.05,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.dollarSign,
                              size: context.w * 0.047,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizesApp.addHorizontalSpace(SizesApp.padding10)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

List<Turno> turnos = [
  Turno(
    profesionalElegido: 'Rodrigo Bernardo',
    turn: 1,
    abonado: false,
    user: 'Matias Echavarria',
    day: DateTime.now(),
    service: ServiceBarber(
        name: 'Corte de pelo',
        price: 2300,
        asset: 'assets/icons/tijera_blanca.png'),
  ),
  Turno(
      profesionalElegido: 'Joako Marcello',
      turn: 2,
      abonado: false,
      user: 'Matias Echavarria Jaramillo',
      day: DateTime.now(),
      service: ServiceBarber(
        name: 'Barba',
        price: 1200,
        asset: 'assets/icons/barba_blanca.png',
      )),
  Turno(
      profesionalElegido: 'Rodrigo Bernardo',
      turn: 1,
      abonado: false,
      user: 'Matias Echavarria',
      day: DateTime.now(),
      service: ServiceBarber(
        name: 'Perfilado de cejas',
        price: 650,
        asset: 'assets/icons/navaja_blanca.png',
      )),
];
