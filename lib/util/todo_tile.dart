import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  
  final String taskName;
  final bool taskCompleted ;
  void Function(bool?)? onChanged;

  Function(BuildContext)? deleteFunction;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25),
      child: Slidable(

        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              
              borderRadius: BorderRadius.circular(12),
              )
          ]
        ),

        child: Container(
        
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            // rgb(26,27,26)
              color: const Color.fromARGB(255, 26, 27, 26),
              borderRadius: BorderRadius.circular(12),
            ),
        
          
          child:  Row(
            children: [
              
              Transform.scale(
                scale: 1.2,
        
                child: Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  shape: const CircleBorder(),
        
                    side: WidgetStateBorderSide.resolveWith(
                      (states) => const BorderSide(width: 2.0, color: Colors.yellow), // Outline color
                    ),
                
                  activeColor: Colors.transparent, // Make the inside color transparent when checked
                  checkColor: Colors.white, // Color of the check mark (if you want to display it)
                  tristate: false, // Disable the indeterminate state for simplicity
                  
                ),
              ),
        
        
              Text(
                taskName,
                
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  decoration: taskCompleted ? TextDecoration.lineThrough: TextDecoration.none,
                  decorationColor: Colors.white,
                  decorationThickness: 2
                  ),
                ),
            ],
          ),
        
        
        ),
      ),
    );
  }
}