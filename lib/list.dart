import 'package:flutter/material.dart';

import 'add.dart';
import 'dbhelper.dart';
import 'model.dart';

class ListScreen extends StatefulWidget {
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late DatabaseHandler handler;
  late Future<List<todo>> _todo;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      setState(() {
        _todo = getList();
      });
    });
  }

  Future<List<todo>> getList() async {
    return await handler.todos();
  }

  Future<void> _onRefresh() async {
    setState(() {
      _todo = getList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sqlite todos'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddScreen()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
      body: FutureBuilder<List<todo>>(
        future: _todo,
        builder: (BuildContext context, AsyncSnapshot<List<todo>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final items = snapshot.data ?? <todo>[];
            return Scrollbar(
              child: RefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      direction: DismissDirection.startToEnd,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: const Icon(Icons.delete_forever),
                      ),
                      key: ValueKey<int>(items[index].id),
                      onDismissed: (DismissDirection direction) async {
                        await handler.deletetodo(items[index].id);
                        setState(() {
                          items.remove(items[index]);
                        });
                      },
                      child: Card(
                          child: ListTile(
                        contentPadding: const EdgeInsets.all(8.0),
                        title: Text(items[index].title),
                        subtitle: Text(items[index].description.toString()),
                      )),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
