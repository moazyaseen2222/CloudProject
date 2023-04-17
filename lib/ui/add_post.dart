import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {


  final List<String> _items = [
    'السكري',
    'القلب',
    'الصحة النفسية',
    'الصحة البدنية',
    'السرطان',
    'الطب البديل'
  ];

  // Define the selected item
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
            title: const Text('اضافة مقالة'),
            centerTitle: true,
            backgroundColor: Colors.green.shade400),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.network(
                      'https://img.freepik.com/premium-vector/doctor-icon-avatar-white_136162-58.jpg?w=2000'),
                  title: const Text("Mohanned Obaid",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                  subtitle: Text('مستشار صحي',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLines: 10,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'What\'s on your Mind?',
                        hintStyle: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                _selectedImage != null ?  Container(
                  child:
                       Image.file(
                    File(_selectedImage!.path),
                    fit: BoxFit.cover,
                  ),
                ) : Container(),

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                            onPressed:() async{
                             await _getImage();
                            },
                            child: Image.asset('images/icons/picture.png',width: 30,height: 30,),
                          ),
                      const Text('Category: '),
                      Center(
                        child: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 16,
                        //  isExpanded: true,
                          hint: const Text('Select Category'),
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue!;
                            });
                          },
                          items: _items.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),


                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Post'),
                  ),
                ),

              ],
            ),
          ),
        ));
  }

  File? _selectedImage;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
      }
    });
  }
}
