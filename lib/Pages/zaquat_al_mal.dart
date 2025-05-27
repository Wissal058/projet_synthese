import 'package:flutter/material.dart';

class ElegantZakatCalculatorPage extends StatefulWidget {
  @override
  _ElegantZakatCalculatorPageState createState() => _ElegantZakatCalculatorPageState();
}

class _ElegantZakatCalculatorPageState extends State<ElegantZakatCalculatorPage> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _nisabController = TextEditingController(text: '4700');
  final Color _primaryColor = Colors.purple.withOpacity(0.9); // Vert islamique
  final Color _accentColor = Colors.purple.withOpacity(0.2);  // Vert clair

  double? _zakatAmount;
  String? _message;

  void _calculateZakat() {
    final double? amount = double.tryParse(_amountController.text);
    final double? nisab = double.tryParse(_nisabController.text);

    if (amount == null || nisab == null) {
      setState(() {
        _zakatAmount = null;
        _message = 'Veuillez entrer des montants valides';
      });
      return;
    }

    if (amount < nisab) {
      setState(() {
        _zakatAmount = null;
        _message = 'Votre épargne est inférieure au Nisâb (${nisab.toStringAsFixed(2)} MAD)';
      });
    } else {
      setState(() {
        _zakatAmount = amount * 0.025;
        _message = 'Montant de la Zakât à verser (2.5%)';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('Calculateur de Zakât',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Lateef',
            fontSize: 28,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            // Carte d'information
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: _primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: _primaryColor.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: _primaryColor),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Le Nisâb correspond à 85g d\'or ou son équivalent en monnaie',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
            ),

            // Formulaire
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Votre épargne totale (MAD)",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: _primaryColor),
                      ),
                      prefixIcon: Icon(Icons.account_balance_wallet, color: _primaryColor),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _nisabController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Valeur du Nisâb (MAD)",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: _primaryColor),
                      ),
                      prefixIcon: Icon(Icons.money, color: _primaryColor),
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _calculateZakat,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _primaryColor,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calculate),
                        SizedBox(width: 10),
                        Text('CALCULER LA ZAKÂT', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Résultats
            if (_message != null)
              Container(
                margin: EdgeInsets.only(top: 24),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      _message!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: _primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (_zakatAmount != null) ...[
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _accentColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: _accentColor),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "${_zakatAmount!.toStringAsFixed(2)} MAD",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: _primaryColor,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "à distribuer aux bénéficiaires",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    SizedBox(height: 16),
                    Text(
                      "La zakât doit être versée aux 8 catégories de bénéficiaires mentionnées dans le Coran (Sourate At-Tawba, 9:60)",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}