import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      ageController.text = '${picked.year}/${picked.month}/${picked.day}';
    }
  }

  List<String>? _data ;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firstNameController.dispose();
    secondNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    ageController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade400,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'A little about yourself',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: firstNameController,
                  onFieldSubmitted: (String value) {},
                  onChanged: (String value) {},
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    prefixIcon: const Icon(
                      Icons.supervised_user_circle,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'please enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: secondNameController,
                  onFieldSubmitted: (String value) {},
                  onChanged: (String value) {},
                  decoration: InputDecoration(
                    labelText: 'Sacend Name',
                    prefixIcon: const Icon(
                      Icons.supervised_user_circle,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'please enter your second name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: lastNameController,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (String value) {},
                  onChanged: (String value) {},
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    prefixIcon: const Icon(
                      Icons.supervised_user_circle,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'please enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  onFieldSubmitted: (String value) {},
                  onChanged: (String value) {},
                  decoration: InputDecoration(
                    labelText: 'phone number',
                    prefixIcon: const Icon(
                      Icons.phone,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'please enter your phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: addressController,
                  keyboardType: TextInputType.streetAddress,
                  onFieldSubmitted: (String value) {},
                  onChanged: (String value) {},
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.location_on
                    ),
                    labelText: 'your address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'please enter your address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                    labelText: 'your age',
                    prefixIcon: const Icon(
                      Icons.date_range,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'please enter your age';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff66CA98),
                    minimumSize: const Size(200, 50),
                  ),
                  onPressed: (){
                    if(formKey.currentState!.validate() ){
                      _data = [
                        firstNameController.text,
                        secondNameController.text,
                        lastNameController.text,
                        phoneNumberController.text,
                        addressController.text,
                        ageController.text,
                      ];
                    }
                    Navigator.pushNamed(context, '/signup2',arguments: _data );
                  },
                  child:const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),),
                  const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
