import 'package:flutter/material.dart';
import '../../../common/shared_widgets/svg_icon.dart';
import '../../dashboard/screens/dashboard_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const DashboardScreen(),

            Container(
              height: 54,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(color: Color(0xFFF9FAFB),))
              ),
            ),
            const Positioned(
              bottom: 10,
              child: CircleAvatar(
                maxRadius: 30,
                backgroundColor: Color(0xFF7C3AED),
                child: ZSvgIcon(
                  'grid.svg',
                  color: Colors.white,
                  size: 32.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
