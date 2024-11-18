import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca de Países',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CountrySelector(),
    );
  }
}

class CountrySelector extends StatefulWidget {
  @override
  _CountrySelectorState createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  final List<Map<String, String>> countries = [
    {
      "name": "Brasil",
      "currency": "Real (BRL)",
      "flag": "https://flagcdn.com/w320/br.png",
    },
    {
      "name": "Estados Unidos",
      "currency": "Dólar (USD)",
      "flag": "https://flagcdn.com/w320/us.png",
    },
    {
      "name": "Japão",
      "currency": "Iene (JPY)",
      "flag": "https://flagcdn.com/w320/jp.png",
    },
    {
      "name": "França",
      "currency": "Euro (EUR)",
      "flag": "https://flagcdn.com/w320/fr.png",
    },
    {
      "name": "Argentina",
      "currency": "Peso Argentino (ARS)",
      "flag": "https://flagcdn.com/w320/ar.png",
    },
    {
      "name": "Canadá",
      "currency": "Dólar Canadense (CAD)",
      "flag": "https://flagcdn.com/w320/ca.png",
    },
    {
      "name": "Alemanha",
      "currency": "Euro (EUR)",
      "flag": "https://flagcdn.com/w320/de.png",
    },
    {
      "name": "Índia",
      "currency": "Rupia Indiana (INR)",
      "flag": "https://flagcdn.com/w320/in.png",
    },
    {
      "name": "Austrália",
      "currency": "Dólar Australiano (AUD)",
      "flag": "https://flagcdn.com/w320/au.png",
    },
    {
      "name": "China",
      "currency": "Yuan (CNY)",
      "flag": "https://flagcdn.com/w320/cn.png",
    },
  ];

  Map<String, String>? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleção de Países'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<Map<String, String>>(
              isExpanded: true,
              hint: Text('Selecione um país'),
              value: selectedCountry,
              items: countries.map((country) {
                return DropdownMenuItem(
                  value: country,
                  child: Text(country['name']!),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCountry = value;
                });
              },
            ),
            SizedBox(height: 20),
            if (selectedCountry != null) ...[
              Text(
                'País: ${selectedCountry!['name']}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Moeda: ${selectedCountry!['currency']}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Image.network(
                selectedCountry!['flag']!,
                height: 150,
                width: 250,
                fit: BoxFit.cover,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
