import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green.shade400,
        title: Text(
          'اضافة مقالة',
          style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                ],
              ),
            ),

            ///
            ///
            ///
            ///
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
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
    );
  }
}
