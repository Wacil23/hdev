import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showTab;
  final String title;
  const HomeAppBar({super.key, required this.showTab, required this.title});

  @override
  Size get preferredSize =>
      showTab ? const Size.fromHeight(130) : const Size.fromHeight(80);

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
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(Icons.subject_rounded),
          ),
        ),
      ),
      
      bottom: showTab
          ? TabBar(
              tabs: const [
                 Tab(
                   child: Text('Mon solde', style: TextStyle(fontSize: 16),)
                  
                  
                ),
                Tab(
                   child: Text('Mes informations', style: TextStyle(fontSize: 16),)
                  
                ),
                Tab(
                   child: Text('Mes modalités de paiement', style: TextStyle(fontSize: 16),)
                  
                ),
                Tab(
                   child: Text('Mes documents', style: TextStyle(fontSize: 16),)
                  
                ),
                Tab(
                  child: Text('Mes avis d\'échéance', style: TextStyle(fontSize: 16),)
                ),
                Tab(
                   child: Text('Mes demandes d\'intervention', style: TextStyle(fontSize: 16),)
                  
                ),
              ],
              isScrollable: true,
              unselectedLabelColor: Colors.white.withOpacity(0.4),
              indicator: const BoxDecoration(
               border: Border(
                  bottom: BorderSide(width: 2.0, color: Colors.white),
                ),
              ),
            )
          : null,
    );
  }
}
