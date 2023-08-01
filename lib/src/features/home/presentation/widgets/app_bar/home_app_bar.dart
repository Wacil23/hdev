import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(20, 76, 151, 1),
      centerTitle: true,
      title: const Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Text(
          'Espace locataire',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            letterSpacing: 0,
          ),
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 30.0, top: 20),
        child: Center(
          child: InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(Icons.subject_rounded),
          ),
        ),
      ),
    );
  }
}
