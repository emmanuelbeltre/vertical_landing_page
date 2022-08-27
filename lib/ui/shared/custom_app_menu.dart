import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: (() => print('Click')),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          width: 150,
          height: 50,
          color: Colors.red[200],
          child: Row(
            children: [
              Text('Menu',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Spacer(),
              Icon(
                Icons.menu,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
