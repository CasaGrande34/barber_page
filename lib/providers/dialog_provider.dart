import 'package:flutter/material.dart';
import 'package:landing_page/main.dart';

import '../utils/utils.dart';

class DialogProvider extends ChangeNotifier {
  late BuildContext _context;
  //TODO: Aplicar el setContext en initState.
  void setContext(BuildContext context) {
    _context = context;
  }

  show() {
    showDialog(
      context: _context,
      builder: (context) {
        return AlertDialog(
          title: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: Responsive.isMobile(context) ? -50 : -80,
                left: Responsive.isMobile(context) ? context.w * 0.27 : 300,
                child: Image.asset(
                  'assets/logos/logo_barberia_color.png',
                  width: Responsive.isMobile(context)
                      ? context.w * 0.2
                      : context.w * 0.1,
                  height: Responsive.isMobile(context)
                      ? context.w * 0.25
                      : context.w * 0.2,
                ),
              ),
              Responsive.isDesktop(context)
                  ? Text(
                      'Reserve su turno',
                      style: FontsApp.rajdhani.copyWith(fontSize: 13),
                    )
                  : const SizedBox()
            ],
          ),
          content: Container(
            // padding: const EdgeInsets.all(SizesApp.padding15),
            height: context.h * 0.65,
            width:
                Responsive.isMobile(context) ? context.w * 1 : context.w * 0.65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizesApp.padding10),
              color: Colors.black,
            ),
            child: Form(
              child: Column(
                children: [
                  SizesApp.addVerticalSpace(SizesApp.padding15),
                  Column(
                    children: [
                      SizedBox(
                        width: Responsive.isMobile(context)
                            ? context.w * 0.2
                            : context.w * 0.2,
                        child: TextFormField(
                          decoration: StylesApp.inputDecorationName,
                          initialValue: 'manolo',
                        ),
                      ),
                      SizesApp.addVerticalSpace(SizesApp.padding15),
                      SizedBox(
                        width: Responsive.isMobile(context)
                            ? context.w * 0.2
                            : context.w * 0.2,
                        child: TextFormField(
                          decoration: StylesApp.inputDecorationEmail,
                          initialValue: 'example@hotmaill.com',
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Su turno sera: '),
                      SizesApp.addVerticalSpace(SizesApp.padding10),
                      Text(DateTime.now().toString().split(" ")[0]),
                      SizesApp.addVerticalSpace(SizesApp.padding10),
                      const Icon(Icons.edit),
                    ],
                  ),
                  SizesApp.addVerticalSpace(SizesApp.padding15),
                  const Divider(
                    color: Colors.white,
                  ),
                  SizesApp.addHorizontalSpace(SizesApp.padding15),
                  Text(
                    'Elija su servicio',
                    style: FontsApp.oldStandardTt.copyWith(
                      fontSize: Responsive.isMobile(context)
                          ? context.w * 0.03
                          : context.w * 0.03,
                    ),
                  ),
                  SizedBox(
                    height: context.w * 0.09,
                    width: context.w * 0.08,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: context.w * 0.05,
                          // height: 200,
                          child: RadioListTile(
                            title: const Text('Corte de pelo'),
                            value: 1,
                            groupValue: 1,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizesApp.addVerticalSpace(SizesApp.padding15),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Column(
//                 children: [
//                   SizesApp.addVerticalSpace(SizesApp.padding15),
//                   Row(
//                     children: [
//                       Column(
//                         children: [
//                           SizedBox(
//                             width: context.w * 0.01,
//                             child: TextFormField(
//                               decoration: StylesApp.inputDecorationName,
//                               initialValue: 'manolo',
//                             ),
//                           ),
//                           SizesApp.addVerticalSpace(SizesApp.padding15),
//                           SizedBox(
//                             width: context.w * 0.01,
//                             child: TextFormField(
//                               decoration: StylesApp.inputDecorationEmail,
//                               initialValue: 'example@hotmaill.com',
//                             ),
//                           ),
//                         ],
//                       ),

List<String> categoriasServicio = ['Corte de barba', 'Corte de pelo', 'Otros'];
