import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palliative_care/ui/mainScreen.dart';

import '../Firebase/auth_firebase.dart';
import '../Firebase/fb_response.dart';
import '../Model/postModel.dart';
import '../controller/add_post_controller.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  FbAuthControllerImp fbAuthController = Get.put(FbAuthControllerImp());
  final List<String> _items = [
    'السكري',
    'القلب',
    'الصحة النفسية',
    'الصحة البدنية',
    'السرطان',
    'الطب البديل'
  ];

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return

         GetBuilder<FbAuthControllerImp>(
          builder: (controller) => SingleChildScrollView(
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
                    title: const Text(
                      "مهند عبيد",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text(
                      'مستشار صحي',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 2,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: controller.title,
                            maxLines: 1,
                            decoration: const InputDecoration(
                              hintText: 'العنوان',
                              hintStyle: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: controller.subject,
                            maxLines: 10,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'بم تفكر؟',
                              hintStyle: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _selectedImage != null
                      ? Container(
                          child: Image.file(
                            File(_selectedImage!.path),
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await _getImage();
                          },
                          child: Image.asset(
                            'images/icons/picture.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                        const Text('Category: '),
                        Center(
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 16,
                            //  isExpanded: true,
                            hint: const Text('Select Category'),
                            value: controller.selectedItem,
                            onChanged: (String? newValue) {
                              setState(() {
                                controller.selectedItem = newValue!;
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
                      onPressed: () async {
                        FbResponse response = await controller.create(PostModel(
                          1.toString(),
                          controller.title.text,
                          controller.subject.text,
                          1.toString(),
                          _selectedImage.toString(),
                          controller.selectedItem!,
                        ));
                        if (response.success == true) {
                          Get.snackbar('Firebase', 'Post has been published',
                              colorText: Colors.white,
                              backgroundColor: Colors.green,
                              icon:
                                  const Icon(Icons.check, color: Colors.white));
                          controller.title.clear();
                          controller.subject.clear();
                          _selectedImage.toString();
                          Get.to(MainScreen());
                        } else {
                          Get.snackbar('Firebase', 'Failed to publish data',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              icon: const Icon(Icons.error_outline,
                                  color: Colors.white));
                        }
                      },
                      child: const Text('Post'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
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
