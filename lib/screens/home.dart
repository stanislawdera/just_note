import 'package:flutter/material.dart';
import 'package:just_note/utils/memory.dart';
import 'package:just_note/utils/welcome.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // txt is being used to add note from memory into the TextField
  var txt = TextEditingController();

  // setup all the stuff
  @override
  void initState() {
    super.initState();

    void setup() async {
      // check if it's first time the app is running
      if(await Memory().isFirstTime() == false) {
        showWelcomeDialog(context);
      } else {
        txt.text = await Memory().getNote(); // get note from memory
      }
    }

    setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        title: Text('JustNote!'),
      ),
      body: Container(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Start typing...',
              contentPadding: EdgeInsets.all(20.0),
            ),
            expands: true,
            minLines: null,
            maxLines: null,
            textAlignVertical: TextAlignVertical.top,
            textAlign: TextAlign.left,
            controller: txt,
            onChanged: (val) => {Memory().saveNote(val)}, // autosave
          )),
    );
  }

}