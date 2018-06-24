import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Todo {
  String title;
  String description;

  setTitle(String newTitle) {
    this.title = newTitle;
  }

  setDescription(String newDescription) {
    this.description = newDescription;
  }

  Todo(this.title, this.description);
}

class TodoPage extends StatefulWidget {
  final List<Todo> todos;

  TodoPage({Key key, @required this.todos}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _TodoScreenState(todos: todos);
}

class _TodoScreenState extends State<TodoPage> {
  List<Todo> todos;

  _TodoScreenState({Key key, @required this.todos}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: new Text('TodoList'),
      ),
      body: new ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            subtitle: Text(
              todos[index].description,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              _navigateAndChangeTodo(context, index);
            },
            trailing: new IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    todos.removeAt(index);
                  });
                }),
          );
        },
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          todos.add(new Todo(
            'New Todo Task',
            'Record the task which should be solved next period of time',
          ));
          setState(() {});
        },
        child: new Icon(Icons.add),
      ),
    );
  }

  _navigateAndChangeTodo(BuildContext context, int index) async {
    final Todo result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TodoItemPage(
              todo: todos[index],
            ),
      ),
    );
    todos[index].setTitle(result.title);
    todos[index].setDescription(result.description);
    Scaffold.of(context).showSnackBar(
          SnackBar(
            content: ListTile(
              title: Text(
                todos[index].title,
              ),
              subtitle: Text(
                todos[index].description,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
  }
}

class TodoItemPage extends StatefulWidget {
  final Todo todo;

  TodoItemPage({Key key, @required this.todo}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _TodoItemPageState(
      todo: this.todo,
    );
  }
}

class _TodoItemPageState extends State<TodoItemPage> {
  Todo todo;
  Todo tempTodo;
  bool editTitle = false;
  bool editDescription = false;

  _TodoItemPageState({Key key, @required this.todo}) : super();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    tempTodo = new Todo('', '');
    tempTodo.setTitle(todo.title);
    tempTodo.setDescription(todo.description);
    titleController.text = todo.title;
    descriptionController.text = todo.description;
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, todo);
            }),
        title: Text(todo.title),
      ),
      body: new Container(
        child: Column(
          children: <Widget>[
            new ListTile(
              leading: new IconButton(
                  icon: editTitle
                      ? Icon(
                    Icons.lock_open,
                    color: Colors.blue,
                  )
                      : Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      editTitle = !editTitle;
                    });
                  }),
//              new Switch(
//                  value: editTitle,
//                  onChanged: (bool newEditTitle) {
//                    setState(() {
//                      editTitle = newEditTitle;
//                    });
//                  }),
              title: new TextField(
                enabled: editTitle,
                controller: titleController,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
                onChanged: (String newString) {
                  setState(() {
                    tempTodo.setTitle(newString);
                  });
                },
              ),
            ),
            new Divider(),
            new TextField(
              enabled: editDescription,
              autofocus: false,
              maxLines: 6,
              controller: descriptionController,
              onChanged: (String newString) {
                setState(() {
                  tempTodo.setDescription(newString);
                });
              },
            ),
            new ButtonBar(
              children: <Widget>[
                new IconButton(
                    icon: editDescription
                        ? Icon(
                            Icons.lock_open,
                            color: Colors.blue,
                          )
                        : Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                    onPressed: () {
                      setState(() {
                        editDescription = !editDescription;
                      });
                    }),
                new FlatButton(
                    onPressed: () {
                      print('_____________tempTodo say' + tempTodo.description);
                      Navigator.pop(context, tempTodo);
                    },
                    child: new Text('Save')),
                new FlatButton(
                    onPressed: () {
                      print('_____________todo say' + todo.description);
                      Navigator.pop(context, todo);
                    },
                    child: new Text('Cancel')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
