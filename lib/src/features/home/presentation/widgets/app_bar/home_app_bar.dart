import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool needsPop;
  final String title;
  const HomeAppBar({super.key, required this.needsPop, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(20, 76, 151, 1),
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            letterSpacing: 0,
          ),
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(1)),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 30.0, top: 20),
        child: Center(
          child: InkWell(
            onTap: () {
              if(needsPop){
                Navigator.popAndPushNamed(context, '/');
              }else {
              Scaffold.of(context).openDrawer();
              }
            },
            child: needsPop ? const Icon(Icons.arrow_back) :  const Icon(Icons.subject_rounded),
          ),
        ),
      ),

    );
  }
}
