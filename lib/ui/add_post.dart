import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  Future<void> _getImage(ImageSource source) async {
    final pickedImage = await ImagePicker().getImage(source: source);

    // Do something with the picked image file
  }

  // @override
  // Widget build(BuildContext context) {
  //   List<String> _dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
  //   // List<String> _dropdownItems = ['السكري', 'القلب', 'الصحة البدنية','السرطان','الصحة النفسية','الطب البديل'];
  //   String? _selectedItem;
  //
  //   // Iterable<DropdownMenuItem<String>> _categories = [
  //   //   'السكري','القلب','الصحة البدنية','السرطان','الصحة النفسية','الطب البديل'
  //   //
  //   // ];
  //   // final List<String> _categories = [
  //   //
  //   //   'السكري','القلب','الصحة البدنية','السرطان','الصحة النفسية','الطب البديل'
  //   //   // {'title': 'السكري'},
  //   //   // {'title': 'القلب'},
  //   //   // {'title': 'الصحة البدنية'},
  //   //   // {'title': 'السرطان'},
  //   //   // {'title': 'الصحة النفسية'},
  //   //   // {'title': 'الطب البديل'},
  //   //
  //   // ];
  //
  //   //print(_categories);
  //
  //
  //   final _formKey = GlobalKey<FormState>();
  //   return Scaffold(
  //     appBar: AppBar(
  //       centerTitle: true,
  //       backgroundColor: Colors.green.shade400,
  //       title: Text(
  //         'اضافة مقالة',
  //         style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
  //       ),
  //     ),
  //     body: Padding(
  //       padding:
  //       const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           Text(
  //             'أدخل بيانات المقالة',
  //             style: GoogleFonts.aBeeZee(
  //                 fontWeight: FontWeight.bold, fontSize: 20),
  //           ),
  //           const SizedBox(height: 20),
  //           Form(
  //             key: _formKey,
  //             child: Column(
  //               children: [
  //                 TextFormField(
  //                   textDirection: TextDirection.rtl,
  //                   textAlign: TextAlign.right,
  //                   decoration: const InputDecoration(
  //                     labelText: 'العنوان',
  //                     border: OutlineInputBorder(
  //                       borderSide: BorderSide(
  //                         color: Colors.black,
  //                       ),
  //                       borderRadius: BorderRadius.all(Radius.circular(15)),
  //                     ),
  //                   ),
  //                   // validator: (value) {
  //                   //   if (value!.isEmpty) {
  //                   //     return 'Please enter your name';
  //                   //   }
  //                   //   return null;
  //                   // },
  //                 ),
  //                 const SizedBox(height: 20),
  //                 TextFormField(
  //                   textDirection: TextDirection.rtl,
  //                   textAlign: TextAlign.right,
  //                   maxLines: 5,
  //                   decoration: const InputDecoration(
  //                     labelText: 'الموضوع',
  //                     border: OutlineInputBorder(
  //                       borderSide: BorderSide(color: Colors.black, width: 2),
  //                       borderRadius: BorderRadius.all(Radius.circular(15)),
  //                     ),
  //                   ),
  //                   // validator: (value) {
  //                   // if (value!.isEmpty) {
  //                   // return 'Please enter your email';
  //                   // }
  //                   // return null;
  //                   // },
  //                 ),
  //                 const SizedBox(height: 20),
  //
  //
  //               ],
  //             ),
  //           ),
  //
  //           ///
  //           ///
  //           ///
  //           ///
  //           const SizedBox(height: 20),
  //           ElevatedButton(
  //             onPressed: () {
  //               print(_selectedItem);
  //             },
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: Colors.green.shade400,
  //               minimumSize: Size(350, 50),
  //             ),
  //             child: Text(
  //               'نشر',
  //               style: GoogleFonts.aBeeZee(
  //                   color: Colors.white,
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 25),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  final List<String> _dropdownItems = [
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
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                'أدخل بيانات المقالة',
                style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                        labelText: 'العنوان',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'Please enter your name';
                      //   }
                      //   return null;
                      // },
                    ),

                    /////////////
                    const SizedBox(height: 20),
                    TextFormField(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        labelText: 'الموضوع',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      // validator: (value) {
                      // if (value!.isEmpty) {
                      // return 'Please enter your email';
                      // }
                      // return null;
                      // },
                    ),
                    const SizedBox(height: 20),

                    ///
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DropdownButton<String>(
                          value: _selectedItem,
                          onChanged: (String? selectedItem) {
                            setState(() {
                              _selectedItem = selectedItem!;
                            });
                          },
                          items: _dropdownItems
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: GoogleFonts.aBeeZee(fontSize: 18),
                                    ),
                                  ))
                              .toList(),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          ' : الفئة  ',
                          style: GoogleFonts.aBeeZee(fontSize: 20),
                        ),
                        const SizedBox(width: 20),
                        const SizedBox(height: 16.0),
                        // Text(
                        //   _selectedItem != null ? 'الفئة :  $_selectedItem' : '',
                        //   style: TextStyle(fontSize: 18.0),
                        // ),
                      ],
                    ),

                    ///
                    ///
                    ///
                    const SizedBox(height: 16.0),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              //_getImage(ImageSource.camera);
                              final pickedFile = await ImagePicker()
                                  .getImage(source: ImageSource.camera);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade400),
                            child: Text(
                              'التقاط من الكاميرا',
                              style: GoogleFonts.aBeeZee(fontSize: 17),
                            ),
                          ),
                          const SizedBox(width: 18),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade400),
                            onPressed: () {
                              _getImage(ImageSource.gallery);
                            },
                            child: Text(
                              'اختيار من المعرض',
                              style: GoogleFonts.aBeeZee(fontSize: 17),
                            ),
                          ),
                          Text(' : الصورة ',
                              style: GoogleFonts.aBeeZee(fontSize: 20)),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    ///

                    Container(
                      color: Colors.grey,
                      height: 200,
                      width: 300,
                      child: Center(
                          child: Text(
                        'الصورة تظهر هنا',
                        style: GoogleFonts.aBeeZee(color: Colors.white),
                      )),
                      /// TO DO => Image Widget
                      //child: Image.file(pickedFile),
                    ),

                    const SizedBox(height: 20),

                    ///
                    ElevatedButton(
                      onPressed: () {
                        print(_selectedItem);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade400,
                        minimumSize: Size(350, 50),
                      ),
                      child: Text(
                        'نشر',
                        style: GoogleFonts.aBeeZee(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          )),
        ));
  }
}
