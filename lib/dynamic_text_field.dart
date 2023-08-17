import 'package:flutter/material.dart';

class DynamicListExample extends StatefulWidget {
  @override
  State<DynamicListExample> createState() => _DynamicListExampleState();
}

class _DynamicListExampleState extends State<DynamicListExample> {
  TextEditingController countryController = TextEditingController();
  List<CityField> cityFields = [CityField(id: UniqueKey())];
  List<PlaceField> placeFields = [PlaceField(id: UniqueKey())];
  @override
  void dispose() {
    for (var field in cityFields) {
      field.controller.dispose();
    }
    for (var field in placeFields) {
      field.controller.dispose();
    }
    super.dispose();
  }

  void removeCityField(CityField field) {
    setState(() {
      cityFields.remove(field);
    });
    field.dispose();
  }

  void removePlaceField(PlaceField field) {
    setState(() {
      placeFields.remove(field);
    });
    field.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(leading: const Icon(Icons.place), title: const Text('Plan'), elevation: 1),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Center(child: FlutterLogo(size: 79)),
                  const Text('Country', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextField(controller: countryController, decoration: const InputDecoration(labelText: 'Country')),
                  const SizedBox(height: 10),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('City', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ...cityFields.map((field) => field.widget(removeCityField, cityFields.first == field)).toList(),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            cityFields.add(CityField(id: UniqueKey()));
                          });
                        },
                        child: const Text('Add City'))
                  ]),
                  const SizedBox(height: 10),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('Place', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ...placeFields.map((field) => field.widget(removePlaceField, placeFields.first == field)).toList(),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            placeFields.add(PlaceField(id: UniqueKey()));
                          });
                        },
                        child: const Text('Add Place'))
                  ])
                ]))));
  }
}

class CityField {
  final Key id;
  final TextEditingController controller = TextEditingController();

  CityField({required this.id});

  Widget widget(void Function(CityField) onRemove, bool isInitialField) {
    return Row(children: [
      Expanded(child: TextField(controller: controller, decoration: const InputDecoration(labelText: 'City'))),
      if (!isInitialField)
        IconButton(
            onPressed: () {
              onRemove(this);
            },
            icon: const Icon(Icons.delete))
    ]);
  }

  void dispose() {
    controller.dispose();
  }
}

class PlaceField {
  final Key id;
  final TextEditingController controller = TextEditingController();

  PlaceField({required this.id});

  Widget widget(void Function(PlaceField) onRemove, bool isInitialField) {
    return Row(children: [
      Expanded(child: TextField(controller: controller, decoration: const InputDecoration(labelText: 'Place'))),
      if (!isInitialField)
        IconButton(
            onPressed: () {
              onRemove(this);
            },
            icon: const Icon(Icons.delete))
    ]);
  }

  void dispose() {
    controller.dispose();
  }
}
