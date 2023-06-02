import 'package:flutter/material.dart';
import 'package:landing_page/utils/utils.dart';

class FirstSection extends StatefulWidget {
  const FirstSection({super.key});

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> {
  @override
  Widget build(BuildContext context) {


    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final fontSize1 = (w * 0.01).clamp(12, 25).toDouble();
    final fontSize2 = (w * 0.04).clamp(50, 1000).toDouble();
    final fontSize3 = (w * 0.014).clamp(15, 1000).toDouble();

    return Container(
      height: h,
      width: w,
      color: Colors.black,
      child: Stack(
        children: [
          _TextFirsSectionItem(
            text:
                'No pierdas esta oportunidad única de unirte a nuestra comunidad de barberos apasionados.',
            style: FontsApp.oswald.copyWith(
                fontSize: fontSize1,
                color: Colors.white),
            top: h * 0.34,
            left: w * 0.07,
          ),
          _TextFirsSectionItem(
            text: 'Domina el arte de las tijeras.',
            style: FontsApp.oldStandardTt
                .copyWith(fontSize: fontSize2, color: Colors.white),
            top: h * 0.375,
            left: w * 0.04,
          ),
          Positioned(
            top: h * 0.48,
            left: w * 0.07,
            child: SizedBox(
              width: 630,
              child: Text(
                'Nuestro curso te brindarán el conocimiento y las habilidades necesarias para construir una carrera exitosa en este fascinante mundo.',
                style:
                    FontsApp.nunito.copyWith(fontSize: fontSize3, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: h * 0.58,
            left: w * 0.15,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Ver caracteristicas'),
                ),
                SizesApp.addHorizontalSpace(SizesApp.padding20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Comprar'),
                ),
              ],
            ),
          ),
          const _CustomArcoDecoration(),
        ],
      ),
    );
  }
}

class _TextFirsSectionItem extends StatelessWidget {
  final String text;
  final TextStyle style;
  final double top;
  final double left;

  const _TextFirsSectionItem(
      {required this.text,
      required this.style,
      required this.top,
      required this.left});

  @override
  Widget build(BuildContext context) {
    
    return Positioned(
      top: top,
      left: left,
      child: Text(text, style: style),
    );
  }
}

class _MyArco extends StatelessWidget {
  const _MyArco();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Positioned(
      top: h / 4.5,
      left: w * 0.75,
      child: Container(
        width: 250,
        height: 300,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.white], stops: [0.1, 0.6]),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(200), topRight: Radius.circular(200))),
      ),
    );
  }
}

class _CustomArcoDecoration extends StatelessWidget {
  const _CustomArcoDecoration();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    //  left: w * 0.18,
    //  left: w * 0.15,

    return Stack(
      children: [
        const _MyArco(),
        Positioned(
            top: h * 0.3,
            left: w * 0.75,
            child: Image.asset(
              'assets/decoration/barber_arco.png',
              height: 280,
            )),
        Positioned(
          left: w * 0.60,
          top: h * 0.67,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: SizesApp.padding5),
            height: 45,
            width: 350,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(SizesApp.padding10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.white, spreadRadius: 2, blurRadius: 6),
                ]),
            child: Image.asset('assets/icons/tijera_negra.png'),
          ),
        )
      ],
    );
  }
}
