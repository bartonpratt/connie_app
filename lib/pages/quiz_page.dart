import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_provider.dart'; // Import the AppProvider
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
    _selectedMonth = DateTime
        .now()
        .month;
    _selectedYear = DateTime
        .now()
        .year;
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (_selectedMonth == 10 && _selectedYear == 2020) {
        _showSnackbar('Correct! October 2020. Good job');
        Provider.of<AppProvider>(context, listen: false).update(
          selectedMonth: _selectedMonth,
          selectedYear: _selectedYear,
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OptionsPage()),
        );
      } else {
        _showSnackbar('Nope! Incorrect, try again');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, _) {
      if (provider.selectedMonth != null && provider.selectedYear != null) {
        // Details are already stored, navigate to options page
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const OptionsPage()),
          );
        });
        // Return an empty container while waiting for navigation
        return Container();
      } else {
        return Scaffold(
          body: Stack(
            children: [
              // Transparent background
              Positioned.fill(
                child: Image.asset(
                  'assets/images/baby.jpg', // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),

              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Great!You're here",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    const Text(
                      "When did we meet for the first time?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Center(
                      child: Card(
                        color: Colors.black.withOpacity(0.5),
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.all(20),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SingleChildScrollView(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    'Select Month:',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(height: 10),
                                  DropdownButtonFormField<int>(
                                    value: _selectedMonth,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 8.0,
                                        horizontal: 8.0,
                                      ),
                                    ),
                                    dropdownColor: Colors.black,
                                    style: const TextStyle(color: Colors.white),
                                    onChanged: (int? month) {
                                      setState(() {
                                        _selectedMonth = month;
                                      });
                                    },
                                    items: List.generate(12, (index) {
                                      return DropdownMenuItem<int>(
                                        value: index + 1,
                                        child: Text(
                                          _getMonthName(index + 1),
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      );
                                    }),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please select a month.';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Select Year:',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(height: 10),
                                  DropdownButtonFormField<int>(
                                    value: _selectedYear,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 8.0,
                                        horizontal: 8.0,
                                      ),
                                    ),
                                    dropdownColor: Colors.black,
                                    style: const TextStyle(color: Colors.white),
                                    onChanged: (int? year) {
                                      setState(() {
                                        _selectedYear = year;
                                      });
                                    },
                                    items: List.generate(30, (index) {
                                      return DropdownMenuItem<int>(
                                        value: DateTime
                                            .now()
                                            .year - index,
                                        child: Text(
                                          '${DateTime
                                              .now()
                                              .year - index}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      );
                                    }),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please select a year.';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () => _submitForm(context),
                                        child: const Text('Submit'),
                                      ),
                                      const SizedBox(width: 20),
                                      TextButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                child: Container(
                                                  width: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width *
                                                      0.5,
                                                  height: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .height *
                                                      0.5,
                                                  decoration:
                                                  const BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(
                                                            20)),
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        'assets/images/hint.jpg',
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: const Text('Hint?'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
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
    });
  }
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
