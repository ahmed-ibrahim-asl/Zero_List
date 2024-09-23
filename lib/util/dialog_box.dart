import 'package:flutter/material.dart';
import 'package:to_do_list_app/util/my_button.dart';


class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
    });



  @override
  Widget build(BuildContext context) {
    return   AlertDialog(
      backgroundColor: Colors.white,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      ),

      content: SizedBox(
        height: 120,
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
          // Get user input 
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add a new task",
            ),
          ),

          
          const SizedBox(height: 20),
          //!

          // Two buttons (save && cancel)
          Row(
            children: [
              // save buttons 
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MyButton(text: "Save", onPressed: onSave),
                  
                  const SizedBox(width: 8),
                  // cancel buttons 
                  MyButton(text: "Cancel", onPressed: onCancel),
                ],
              ),

            ],
          )

        ],)


      )
    );
  }
}