import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState

    controller =
        AnimationController(vsync: this, duration: Duration(microseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            controller.reverse();
          } else {
            controller.forward();
          }
          setState(() {
            isOpen = !isOpen;
          });
          print(isOpen);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          width: 150,
          height: 50,
          color: Colors.red[200],
          child: Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                width: isOpen ? 50 : 0,
              ),
              Text('Menu',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Spacer(),
              AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: controller,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
