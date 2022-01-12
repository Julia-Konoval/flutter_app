import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super (key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _userTodo = ''; 
  List todoList =  [];

  @override
  void initState() {
    super.initState();

    todoList.addAll(['Buy milk', 'Wash dishes', 'Bake pie']);
  }

   void _openMenu() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: Text('Menu'),),
          body: Row(children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              }, 
              child: Text('To the main page')),
              Padding(padding: EdgeInsets.only(left: 15)),
              Text('Our Simple menu')
          ],
        )
      );
    })
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The list to do:'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey, 
        actions: [
          IconButton(
            onPressed: _openMenu, 
            icon: Icon(Icons.menu_outlined),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(todoList[index]), 
            child: Card(
              child: ListTile(title: Text(todoList[index]), 
              trailing: IconButton(
                icon: Icon(
                  Icons.delete_sweep,
                  color: Colors.deepPurple,
                  ),
                  onPressed: () {
                    setState(() {
                      todoList.removeAt(index);
                    });
                  },
                ),
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                todoList.removeAt(index);
              });
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Add item'),
              content: TextField(
                onChanged: (String value) {
                  _userTodo = value;
                },
              ),
              actions: [
                ElevatedButton(onPressed: () {
                  setState(() {
                    todoList.add(_userTodo);
                  });
                  Navigator.of(context).pop();
                }, 
                child: Text('Add new task'))
              ]
            );
          });
        },
        child: Icon(
          Icons.add_box, 
          color: Colors.white,
        ),
      ),
    );
  }
}