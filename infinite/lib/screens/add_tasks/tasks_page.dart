import 'package:flutter/material.dart';  

void main() {  
  runApp(MyApp());  
}  

class MyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      home: TaskScreen(),  
    );  
  }  
}  

class TaskScreen extends StatefulWidget {  
  @override  
  _TaskScreenState createState() => _TaskScreenState();  
}  

class _TaskScreenState extends State<TaskScreen> {  
  final TextEditingController _taskController = TextEditingController();  
  String _dueDate = 'Data não definida';  

  void _selectDate(BuildContext context) async {  
    final DateTime? picked = await showDatePicker(  
      context: context,  
      initialDate: DateTime.now(),  
      firstDate: DateTime(2000),  
      lastDate: DateTime(2101),  
    );  
    if (picked != null && picked != DateTime.now())  
      setState(() {  
        _dueDate = "${picked.toLocal()}".split(' ')[0];  
      });  
  }  

  void _saveTask() {  
    // Lógica para salvar a tarefa  
    print('Tarefa: ${_taskController.text}, Prazo: $_dueDate');  
  }  

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: Text('Nova tarefa'),  
        backgroundColor: Colors.blue,  
      ),  
      body: Container(  
        color: Colors.blue,  
        padding: EdgeInsets.all(16.0),  
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,  
          children: [  
            Text(  
              'O que deve ser feito?',  
              style: TextStyle(color: Colors.white, fontSize: 18),  
            ),  
            TextField(  
              controller: _taskController,  
              decoration: InputDecoration(  
                hintText: 'Insira sua nova tarefa aqui',  
                filled: true,  
                fillColor: Colors.white,  
                border: OutlineInputBorder(),  
              ),  
            ),  
            SizedBox(height: 20),  
            Text(  
              'Prazo',  
              style: TextStyle(color: Colors.white, fontSize: 18),  
            ),  
            GestureDetector(  
              onTap: () => _selectDate(context),  
              child: Container(  
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),  
                decoration: BoxDecoration(  
                  color: Colors.white,  
                  borderRadius: BorderRadius.circular(5),  
                ),  
                child: Text(  
                  _dueDate,  
                  style: TextStyle(color: Colors.black),  
                ),  
              ),  
            ),  
            Spacer(),  
            Align(  
              alignment: Alignment.bottomRight,  
              child: FloatingActionButton(  
                onPressed: _saveTask,  
                child: Icon(Icons.check),  
                backgroundColor: Colors.green,  
              ),  
            ),  
          ],  
        ),  
      ),  
    );  
  }  
}