import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/core/constants/constants.dart';
import 'package:hdev/src/features/contract/presentation/widgets/mon_solde/history_contract/history_contract.dart';
import 'package:hdev/src/features/contract/presentation/widgets/mon_solde/mon_solde.dart';
import 'package:hdev/src/features/home/data/repositories/get_actuality_repository_impl.dart';
import 'package:hdev/src/features/home/domain/usecases/get_actuality_usecase.dart';
import 'package:hdev/src/features/home/presentation/bloc/actuality/actuality_bloc.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts/contracts_bloc.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts/contracts_event.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts/contracts_state.dart';
import 'package:hdev/src/features/home/presentation/widgets/actuality/actuality_card_section.dart';
import 'package:hdev/src/features/home/presentation/widgets/contract/contract_card_section.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hdev/src/features/home/presentation/widgets/tab_bar/tab_bar.dart';

class HomeBody extends StatefulWidget {
  
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with SingleTickerProviderStateMixin {

  late TabController _tabController;
    @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // 3 est le nombre d'onglets
  }
    @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
        final homeContractBloc = BlocProvider.of<HomeContractBloc>(context);
    homeContractBloc.add(const GetContracts());
    return Column(
      children: [
        Container(
          height: 420,
          color: const Color.fromRGBO(0, 78, 159, 1),
          child:  SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppBar(tabController: _tabController),
            ),
          ),
        ),
        Expanded(
          child: Stack(children: [
            CustomPaint(
              painter: InvertedRoundedRectanglePainter(
                  color: Colors.white, radius: 45.0, pi: 3.1415926535897932),
              child: Container(
                color: Colors.white,
              ),
            ),
            TabBarView(
    
                physics: const BouncingScrollPhysics(),
                controller: _tabController,
                children: [
                  const CardContractSection(),
                    MonSolde(contract: homeContractBloc.state.contract ,),
                
                  BlocProvider<ActualityBloc>(
                    create: (context) => ActualityBloc(GetActualityUseCase(
                        GetActualityRepositoryImpl(
                            currentBailleurId: currentBailleurId))),
                    child: const ActualityCardSection(title: 'Actualités'),
                  )
                ]),
          ]),
        )
      ],
    );
  }
}

class AppBar extends StatelessWidget {
  final TabController tabController;
  const AppBar({
    super.key,
    required this.tabController
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeContractBloc, HomeContractState>(
      builder: (_, state) {
          return Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/contrat-simple');
                    },
                    child: Hero(
                      tag: 'Profile',
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: const Padding(
                          padding: EdgeInsets.all(3),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('images/moi.jpg'),
                            radius: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bienvenue,',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        state is HomeContractDone ? '${state.contract!.nomLocataire} ${state.contract!.prenomLocataire}' : '',
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      print('pressed');
                    },
                    child: Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state is HomeContractDone ? state.contract!.numContrat : '',
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            (state is HomeContractDone && state.contract!.isActif)
                                ? Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.greenAccent,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )
                                : Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )
                              
                          ],
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              TabbedPage(tabController: tabController),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Text('Votre solde à payer',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                  Text(
                      state is HomeContractDone
                          ? '${state.contract!.soldeContrat.toString()} €'
                          : '...',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.white))
                ],
              )
            ],
          );
    
      },
    );
  }
}

class InvertedRoundedRectanglePainter extends CustomPainter {
  InvertedRoundedRectanglePainter(
      {required this.radius, required this.color, required this.pi});

  final double radius;
  final Color color;
  final double pi;
  @override
  void paint(Canvas canvas, Size size) {
    final cornerSize = Size.square(radius * 2);
    canvas.drawPath(
      Path()
        ..addArc(
          Offset(0, -radius) & cornerSize,
          -pi,
          pi / 2,
        )
        ..arcTo(
          Offset(size.width - cornerSize.width, -radius) & cornerSize,
          -pi / 2,
          pi / 2,
          false,
        )
        ..lineTo(size.width, 10)
        ..lineTo(0, 0),
      Paint()..color = color,
    );
  }

  @override
  bool shouldRepaint(InvertedRoundedRectanglePainter oldDelegate) =>
      oldDelegate.radius != radius || oldDelegate.color != color;
}
