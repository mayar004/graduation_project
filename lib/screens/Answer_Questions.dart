import 'package:flutter/material.dart';

class AnswerQuestions extends StatefulWidget {
  @override
  _AnswerQuestionsState createState() => _AnswerQuestionsState();
}

class _AnswerQuestionsState extends State<AnswerQuestions> {
  // State variables for the checkboxes and radio buttons
  bool diabetes = false;
  bool hypertension = false;
  bool heartDisease = false;

  bool hadSurgery = false;
  bool takingMedications = false;
  bool allergies = false;

  String medicationInput = '';
  String familyHistory = '';
  String medicalConditions = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Answer Questions')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your answers will help us tailor the app to your needs and provide better support.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 20),

            Text('Do you have any known chronic illnesses?'),
            Row(
              children: [
                Checkbox(
                  value: diabetes,
                  onChanged: (bool? value) {
                    setState(() {
                      diabetes = value!;
                    });
                  },
                ),
                Text('Diabetes'),
                Checkbox(
                  value: hypertension,
                  onChanged: (bool? value) {
                    setState(() {
                      hypertension = value!;
                    });
                  },
                ),
                Text('Hypertension'),
                Checkbox(
                  value: heartDisease,
                  onChanged: (bool? value) {
                    setState(() {
                      heartDisease = value!;
                    });
                  },
                ),
                Text('Heart Disease'),
              ],
            ),
            SizedBox(height: 20),

            Text('Have you had any past surgeries or hospitalizations?'),
            Row(
              children: [
                Radio(
                  value: true,
                  groupValue: hadSurgery,
                  onChanged: (value) {
                    setState(() {
                      hadSurgery = true;
                    });
                  },
                ),
                Text('Yes'),
                Radio(
                  value: false,
                  groupValue: hadSurgery,
                  onChanged: (value) {
                    setState(() {
                      hadSurgery = false;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            SizedBox(height: 20),

            Text('Are you currently taking any medications? If yes, list them.'),
            Row(
              children: [
                Radio(
                  value: true,
                  groupValue: takingMedications,
                  onChanged: (value) {
                    setState(() {
                      takingMedications = true;
                    });
                  },
                ),
                Text('Yes'),
                Radio(
                  value: false,
                  groupValue: takingMedications,
                  onChanged: (value) {
                    setState(() {
                      takingMedications = false;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            if (takingMedications)
              TextField(
                decoration: InputDecoration(
                  labelText: 'Please Enter the medications',
                ),
                onChanged: (value) {
                  medicationInput = value;
                },
              ),
            SizedBox(height: 20),

            Text('Do you have any allergies?'),
            Row(
              children: [
                Radio(
                  value: true,
                  groupValue: allergies,
                  onChanged: (value) {
                    setState(() {
                      allergies = true;
                    });
                  },
                ),
                Text('Yes'),
                Radio(
                  value: false,
                  groupValue: allergies,
                  onChanged: (value) {
                    setState(() {
                      allergies = false;
                    });
                  },
                ),
                Text('No'),
              ],
            ),
            SizedBox(height: 20),

            Text('Do you have a family history of any medical conditions?'),
            Row(
              children: [
                Checkbox(
                  value: familyHistory == 'Cancer',
                  onChanged: (value) {
                    setState(() {
                      familyHistory = 'Cancer';
                    });
                  },
                ),
                Text('Cancer'),
                Checkbox(
                  value: familyHistory == 'Heart Disease',
                  onChanged: (value) {
                    setState(() {
                      familyHistory = 'Heart Disease';
                    });
                  },
                ),
                Text('Heart Disease'),
                Checkbox(
                  value: familyHistory == 'else',
                  onChanged: (value) {
                    setState(() {
                      familyHistory = 'else';
                    });
                  },
                ),
                Text('Else'),
              ],
            ),
            TextField(
              onChanged: (value) {
                medicalConditions = value;
              },
              decoration: InputDecoration(
                labelText: 'Please explain the medical conditions',
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // Handle form submission
                print('Chronic Illnesses: Diabetes: $diabetes, Hypertension: $hypertension, Heart Disease: $heartDisease');
                print('Had Surgery: $hadSurgery');
                print('Taking Medications: $takingMedications, Medications: $medicationInput');
                print('Allergies: $allergies');
                print('Family History: $familyHistory, Medical Conditions: $medicalConditions');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}