import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'options_screen.dart';

class DatePickerForm extends StatefulWidget {
  @override
  _DatePickerFormState createState() => _DatePickerFormState();
}

class _DatePickerFormState extends State<DatePickerForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int? _selectedMonth; // Initialize to null
  int? _selectedYear; // Initialize to null

  @override
  void initState() {
    super.initState();
    // Set initial values to current month and year
    _selectedMonth = DateTime.now().month;
    _selectedYear = DateTime.now().year;
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_selectedMonth == DateTime.october && _selectedYear == 2020) {
        _showSnackbar('Correct combination: October 2020');
        Get.to(() => OptionsPage());
      } else {
        _showSnackbar('Incorrect combination: Please select October 2020.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Select Month:'),
              SizedBox(height: 10),
              DropdownButtonFormField<int>(
                value: _selectedMonth,
                onChanged: (int? value) {
                  setState(() {
                    _selectedMonth = value;
                  });
                },
                items: List.generate(12, (index) {
                  return DropdownMenuItem<int>(
                    value: index + 1,
                    child: Text(_getMonthName(index + 1)),
                  );
                }),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a month.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text('Select Year:'),
              SizedBox(height: 10),
              DropdownButtonFormField<int>(
                value: _selectedYear,
                onChanged: (int? value) {
                  setState(() {
                    _selectedYear = value;
                  });
                },
                items: List.generate(30, (index) {
                  return DropdownMenuItem<int>(
                    value: DateTime.now().year - index,
                    child: Text('${DateTime.now().year - index}'),
                  );
                }),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a year.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      _showSnackbar('Hint: Select October 2020.');
                    },
                    child: Text('Hint'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
