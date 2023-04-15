import 'package:flutter/material.dart';

class CommentForm extends StatefulWidget {
  final Function(String) onSubmit;

  const CommentForm({required this.onSubmit});

  @override
  _CommentFormState createState() => _CommentFormState();
}

class _CommentFormState extends State<CommentForm> {
  final _formKey = GlobalKey<FormState>();
  final _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(_commentController.text);
      _commentController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _commentController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a comment';
                }
                return null;
              },
              decoration: InputDecoration(

                hintText: 'Enter your comment...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.all(4),  // Added this
              ),
            ),
          ),
          const SizedBox(width: 5),
          ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey,
                onPrimary: Colors.white,
                minimumSize: const Size(50, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Icon(Icons.send)
          ),
        ],
      ),
    );
  }
}