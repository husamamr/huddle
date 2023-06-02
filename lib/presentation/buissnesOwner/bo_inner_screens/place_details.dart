import 'package:flutter/material.dart';
import 'package:huddle/widgets/app_bar/custom_app_bar.dart';
import 'package:huddle/core/app_export.dart';

class PlaceDetails extends StatefulWidget {
  const PlaceDetails({Key? key}) : super(key: key);

  @override
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _establishmentNameController = TextEditingController();
  TextEditingController _contactNumberController = TextEditingController();
  TextEditingController _ageLimitController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _aboutController = TextEditingController();

  List<String> establishmentTypes = [
    'Food',
    'Adventure',
    'Shopping',
    'Entertainment',
    'Sport',
    'Cafe and Coffee',
    'Art and Museum',
    'Festivals',
  ];

  String? selectedEstablishmentType;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16.0),
              Text(
                'Establishment Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _establishmentNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Enter establishment name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the establishment name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Establishment Type',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Select establishment type',
                ),
                value: selectedEstablishmentType,
                items: establishmentTypes.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedEstablishmentType = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an establishment type';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Contact Number',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _contactNumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Enter contact number',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the contact number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Age Limit',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _ageLimitController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Enter age limit',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the age limit';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Location',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Enter location',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the location';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'About',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _aboutController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Enter information about the establishment',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter information about the establishment';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save the form data to the map
                    /*   formData['establishmentName'] =
                          _establishmentNameController.text;
                      formData['establishmentType'] = selectedEstablishmentType;
                      formData['contactNumber'] = _contactNumberController.text;
                      formData['ageLimit'] = _ageLimitController.text;
                      formData['location'] = _locationController.text;
                      formData['about'] = _aboutController.text;
                    */
                    // Navigate to the next screen or perform any other logic
                    // You can access the form data using the formData map
                  }
                },
                child: Text('Save'),
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    Size.fromWidth(double.infinity),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
