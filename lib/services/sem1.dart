import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:path/path.dart';

class Sem1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resources'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0), // Add padding around buttons
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Physics(),
                    ),
                  );
                },
                child: Text('Physics'),
              ),
              SizedBox(height: 16.0), // Add spacing between buttons
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ITP(),
                    ),
                  );
                },
                child: Text('ITP'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => POC(),
                    ),
                  );
                },
                child: Text('Professional Communication'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LAL(),
                    ),
                  );
                },
                child: Text('Linear Algebra'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FEE(),
                    ),
                  );
                },
                child: Text('Fundamental of Electronics and Communication'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => POM(),
                    ),
                  );
                },
                child: Text('Principal of Management'),
              ),
              SizedBox(height: 16.0),
              //Add spacing between buttons
              // Add more buttons as needed
            ],
          ),
        ),
      ),
    );
  }
}

class Physics extends StatefulWidget {
  const Physics({Key? key}) : super(key: key);

  @override
  State<Physics> createState() => _PhysicsState();
}

class _PhysicsState extends State<Physics> {
  String storagepath = "resources/sem1/physics";
  List<Reference> filelist = [];

  bool loaded = false;

  Future<UploadTask> uploadFile(File file) async {
    UploadTask uploadTask;
    String filename = basename(file.path);

    // Create a Reference to the file
    final storage=FirebaseStorage.instance
        .ref()
        .child(storagepath)
        .child(filename);

    final metadata = SettableMetadata(
        contentType: 'file/pdf',
        customMetadata: {'picked-file-path': file.path});
    print("Uploading..!");

    uploadTask = storage.putData(await file.readAsBytes(), metadata);

    print("done..!");
    return Future.value(uploadTask);
  }

  Future<void> getFiles() async {
    final reference = await FirebaseStorage.instance.ref()
        .child(storagepath)
        .listAll();

    reference.items.forEach((Reference reference) {
      filelist.add(reference);
    });
    setState(() {
      loaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getFiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Physics'),
      ),
      body: loaded
        ? SingleChildScrollView(
          padding: EdgeInsets.all(16.0), // Add padding around buttons
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: filelist.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {

                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent[200],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Icon(Icons.file_copy),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      filelist[index].name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            },
          )
      )
      : Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async{
          final path = await FlutterDocumentPicker.openDocument();
          print(path);
          File file = File(path!);
          UploadTask task = await uploadFile(file);
          Navigator.pop(context);
        },
      ),
    );
  }
}

class ITP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Introduction to Programming'),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0), // Add padding around buttons
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Text("OOPS! Nothing is Found :("),
              ]))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}

class POC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Professional Communication'),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0), // Add padding around buttons
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Text("OOPS! Nothing is Found :("),
              ]))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}

class LAL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Linear Algebra'),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0), // Add padding around buttons
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Text("OOPS! Nothing is Found :("),
              ]))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}

class FEE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fundamental of Electrical and Electronics '),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0), // Add padding around buttons
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Text("OOPS! Nothing is Found :("),
              ]))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}

class POM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Principal of Management'),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0), // Add padding around buttons
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Text("OOPS! Nothing is Found :("),
              ]))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}
