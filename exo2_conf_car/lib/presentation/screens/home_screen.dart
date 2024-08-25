import 'package:exo2_conf_car/data/models/car.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _name = "";
  double _value = 500;
  int _nbPlaces = 2;
  String _message = 'Faites votre configuration';
  late Car? _carSelected;
  late bool _isElectric;
  final List<Car> _cars = [
    Car(name: "MG cyberster", url: "MG", places: 2, isElectric: true),
    Car(name: "R5 électrique", url: "R5", places: 4, isElectric: true),
    Car(name: "Tesla", url: "tesla", places: 5, isElectric: true),
    Car(name: "Van VW", url: "Van", places: 2, isElectric: true),
    Car(name: "Alpine", url: "Alpine", places: 2, isElectric: false),
    Car(name: "Fiat 500", url: "Fiat 500", places: 4, isElectric: false),
    Car(name: "Peugeot 3008", url: "P3008", places: 5, isElectric: false),
    Car(name: "Dacia Jogger", url: "Jogger", places: 7, isElectric: true),
  ];
  final List<Map<String, bool>> _options = [
    {
      'GPS': false,
    },
    {
      'Caméra de recul': false,
    },
    {
      'Clim par zone': false,
    },
    {
      'régulateur de vitesse': false,
    },
    {
      'Toit ouvrant': false,
    },
    {
      'Siège chauffant': false,
    },
    {
      'Roue de secours': false,
    },
    {
      'Jantes alu': false,
    },
  ];
  @override
  void initState() {
    _carSelected = null;
    _isElectric = false;
    super.initState();
  }

  void _submit() {
    setState(() {
      if (_value > 15000 && _isElectric) {
        _carSelected = null;
        _message =
            "Vous devriez pensez à un moteur thermique compte tenu du nombre de kilomètres";
      } else if (_value < 5000 && !_isElectric) {
        _carSelected = null;
        _message =
            "Vous faites peu de kilomètres, pensez à regarder les voitures électriques";
      } else {
        _message = 'Voici la voiture faite pour vous';
        _carSelected = _cars.firstWhere(
            (car) => _isElectric == car.isElectric && _nbPlaces == car.places);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: [
        ElevatedButton(onPressed: _submit, child: const Text('Je valide')),
      ]),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Bienvenue: $_name',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(14),
                  width: MediaQuery.of(context).size.width,
                  height: 270,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _message,
                        textAlign: TextAlign.center,
                      ),
                      if (_carSelected != null)
                        Image.asset(
                          _carSelected!.urlString,
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                      if (_carSelected != null) Text(_carSelected!.name)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
                decoration: const InputDecoration(
                    labelText: 'Entrez votre nom',
                    labelStyle: TextStyle(fontSize: 18)),
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Nombre de kilomètre annuel: ',
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black87),
                      children: [
                    TextSpan(
                      text: _value.toInt().toString(),
                      style: const TextStyle(color: Colors.blue),
                    )
                  ])),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('0'),
                  Expanded(
                    child: Slider(
                      value: _value,
                      min: 0,
                      max: 30000,
                      label: _value.toString(),
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ),
                  const Text('30000'),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Moteur électrique',
                    style: TextStyle(fontSize: 18),
                  ),
                  Switch(
                    value: _isElectric,
                    onChanged: (value) {
                      setState(() {
                        _isElectric = value;
                      });
                    },
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 24,
              ),
              RichText(
                text: TextSpan(
                    text: 'Nombre de places: ',
                    style: const TextStyle(fontSize: 18, color: Colors.black87),
                    children: [
                      TextSpan(
                        text: _nbPlaces.toString(),
                        style: const TextStyle(color: Colors.blue),
                      )
                    ]),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Row(
                      children: [
                        const Text('2 places'),
                        Radio(
                          value: 2,
                          groupValue: _nbPlaces,
                          onChanged: (value) {
                            setState(() {
                              _nbPlaces = value!;
                            });
                          },
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text('4 places'),
                        Radio(
                          value: 4,
                          groupValue: _nbPlaces,
                          onChanged: (value) {
                            setState(() {
                              _nbPlaces = value!;
                            });
                          },
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text('5 places'),
                        Radio(
                          value: 5,
                          groupValue: _nbPlaces,
                          onChanged: (value) {
                            setState(() {
                              _nbPlaces = value!;
                            });
                          },
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text('7 places'),
                        Radio(
                          value: 7,
                          groupValue: _nbPlaces,
                          onChanged: (value) {
                            setState(() {
                              _nbPlaces = value!;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Options du véhicule',
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: _options
                      .map<CheckboxListTile>(
                        (option) => CheckboxListTile(
                          title: Text(option.keys.first),
                          value: option.values.first,
                          onChanged: (value) {
                            setState(() {
                              option[option.keys.first] = value!;
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
