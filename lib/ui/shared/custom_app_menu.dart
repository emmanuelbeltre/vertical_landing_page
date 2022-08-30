import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vertical_landing_page/ui/shared/custom_menu_item.dart';

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

    controller = AnimationController(
        vsync: this, duration: const Duration(microseconds: 200));
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
          height: isOpen ? 308 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: controller),
              if (isOpen) ...[
                CustomMenuItem(delay: 0, text: 'Home', onPressed: () {}),
                CustomMenuItem(delay: 35, text: 'About', onPressed: () {}),
                CustomMenuItem(delay: 70, text: 'Pricing', onPressed: () {}),
                CustomMenuItem(delay: 105, text: 'Contact', onPressed: () {}),
                CustomMenuItem(delay: 140, text: 'Location', onPressed: () {}),
                const SizedBox(height: 8)
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 45 : 0,
          ),
          Text('Menu',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          const Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
