import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class PremiumMisbahaPage extends StatefulWidget {
  @override
  _PremiumMisbahaPageState createState() => _PremiumMisbahaPageState();
}

class _PremiumMisbahaPageState extends State<PremiumMisbahaPage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late AnimationController _controller;
  late Animation<double> _animation;
  final Color _primaryColor = Color(0xFF6A1B9A);
  final Color _accentColor = Color(0xFFE1BEE7);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _controller.forward().then((_) => _controller.reverse());
      if (_counter % 33 == 0) _showCelebration();
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _showCelebration() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: _primaryColor, size: 48),
              SizedBox(height: 16),
              Text('33 Tasbih Complet!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: _primaryColor,
                  )),
              SizedBox(height: 8),
              Text('سبحان الله، الحمد لله، الله أكبر',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Lateef',
                  )),
              SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: Text('Continuer'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: [
          // AppBar élégante
          Container(
            height: 160,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  _primaryColor,
                  Color(0xFF8E24AA),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Misbaha',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.5,
                      )),
                  SizedBox(height: 8),
                  Text('سبحة',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 36,
                        fontFamily: 'Lateef',
                      )),
                ],
              ),
            ),
          ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              // Compteur avec effet de profondeur
              AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                    BoxShadow(
                    color: _primaryColor.withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: 2,
                    offset: Offset(0, 10),
                    )],
                  border: Border.all(
                  color: _accentColor,
                    width: 4,
                  ),
                ),
                child: Center(
                child: Text(
                '$_counter',
                style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w300,
                color: _primaryColor,
                fontFamily: 'RobotoMono',
                ),
                ),
                ),
                ),
                );
              },
            ),
            SizedBox(height: 40),

            // Bouton principal animé
            ScaleTransition(
              scale: _animation,
              child: GestureDetector(
                onTap: _incrementCounter,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          _primaryColor,
                          Color(0xFF8E24AA),
                        ],
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                  BoxShadow(
                  color: _primaryColor.withOpacity(0.4),
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: Offset(0, 5),
                  )],
                ),
                child: Center(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),

          // Instructions
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Appuyez pour compter vos tasbihs\nسبحان الله، الحمد لله، الله أكبر',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
                height: 1.6,
              ),
            ),
          ),
          SizedBox(height: 40),

          // Bouton secondaire
          OutlinedButton(
            onPressed: _resetCounter,
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              side: BorderSide(color: _primaryColor, width: 1.5),
              foregroundColor: _primaryColor,
            ),
            child: Text(
              'Réinitialiser',
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 1.1,
              ),
            ),
          ),
        ],
      ),
    ),
    ],
    ),
    );
  }
}