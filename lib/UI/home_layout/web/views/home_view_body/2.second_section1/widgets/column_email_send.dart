import 'package:flutter/material.dart';

import '../../../../../../../utils/utils.dart';

class ColumnEmailSend extends StatelessWidget {
  const ColumnEmailSend({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.0,
      width: 400.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('La barberia no es un trabajo, es un arte.',
              style: FontsApp.rye),
          Text(
              'Ahora podés reservar un cita con tu barbero favorito online. Es muy fácil, rápido y cómodo.',
              style: FontsApp.nunito.copyWith(
                fontSize: 24.0,
              )),
          SizesApp.addVerticalSpace(20.0),
          SizedBox(
            width: 300.0,
            child: Text(
              'Afeitados clásicos a navaja con toallas calientes y frias, cortes de estilo europeo, arreglos de barbas y siempre a la vanguardia.',
              style: FontsApp.nunito.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizesApp.addVerticalSpace(30.0),
          Row(
            children: [
              SizedBox(
                height: 45.0,
                width: 230.0,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your mail address',
                    hintStyle: FontsApp.nunito,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ),
              SizesApp.addHorizontalSpace(20.0),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {},
                child: SizedBox(
                  height: 45.0,
                  width: 100.0,
                  child: Center(
                    child: Text('Get Invite', style: FontsApp.nunito),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
