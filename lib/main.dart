import 'package:flutter/material.dart';
import 'package:flutter_app/screen2.dart';
import 'package:flutter_app/screen3.dart';
import 'package:toast/toast.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Todo(),
    routes: <String, WidgetBuilder>{
      "/screen2": (BuildContext context) => Screen2(),
      "/screen3": (BuildContext context) => Screen3()
    },
  ));
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Colors.amberAccent,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Flutter begginer",
              textDirection: TextDirection.ltr,
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.beenhere),
                onPressed: () {
                  print("been here");
                },
              ),
              IconButton(
                icon: Icon(Icons.map),
                onPressed: () {
                  print("Map");
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.pushNamed(context, '/screen2');
                },
              )
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image(
                      image: AssetImage(
                        "images/test.jpg",
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 40, left: 25),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.amberAccent,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 120, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Mirza Arslan",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "mirzaarslan450@gmail.com",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.account_box),
                      title: Text("About Us"),
                    ),
                    ListTile(
                      leading: Icon(Icons.contact_mail),
                      title: Text("Contact Us"),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text("Settings"),
                    )
                  ],
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              print("fab");
            },
          ),
          body: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "username",
                ),
                onChanged: (input) {
                  print(input);
                },
              )
            ],
          ),
        ));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Main Screen"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.pushNamed(context, '/screen2');
              },
            )
          ],
        ),
      ),
    );
  }
}

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var list = List();
  String inputValue = "";

  @override
  void initState() {
    super.initState();
    list.add("task one");
    list.add("task two");
    list.add("task three");
    list.add("task four");
    list.add("task five");
    list.add("task six");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.amber, accentColor: Colors.black87),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Todo's "),
          ),
          floatingActionButton: FloatingActionButton(
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ), onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        "Add Todo", textDirection: TextDirection.ltr,),
                      content: TextField(
                        decoration: InputDecoration(
                            hintText: "Add Todo"
                        ),
                        onChanged: (String input) {
                          // ignore: missing_return
                          inputValue = input;
                        },
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Add", textDirection: TextDirection.rtl,),
                          onPressed: () {
                            setState(() {
                              if (inputValue.isEmpty) {
                                Toast.show("Please Enter Task", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                              } else {
                                list.add(inputValue);
                                inputValue = "";
                                Navigator.of(context).pop();
                              }
                            });

                          },
                        )
                      ],
                    );
                  }
              );
            },),
          ),
          body: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key(list[index]),
                  child: ListTile(
                    title: Text(list[index]),
                  ),
                  onDismissed: (direction){
                    setState(() {
                      list.removeAt(index);
                    });
                  },
                );
              })
      ),
    );
  }
}
