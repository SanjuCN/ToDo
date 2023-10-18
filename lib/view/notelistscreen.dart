import 'package:flutter/material.dart';
import 'package:title/controller/note_list_controller.dart';
import 'package:title/model/model.dart';
import 'package:title/view/detailsscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,required this.title,required this.description,required this.date,required this.index
  });
   final String title;
  final String description;
  final  date;
  final index;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final NoteController _noteController = NoteController();
  // late List<NoteModel> _notes = [];
  // int existingNoteIndex = -1;

  // var myDb= Hive.box('testBox');

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  int isSelectedColor = 0;
  Color? selectedColor;
  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    // final notes = await _noteController.getNotes();
    // setState(() {
    //   _notes = notes;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 8, 8, 8),
          elevation: 0,
          centerTitle: true,
          title: Text(
            "App",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 400,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            padding: EdgeInsets.only(left: 20),
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: TextField(
                              controller: titleController,
                              decoration: InputDecoration(
                                  hintText: "Title", border: InputBorder.none),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            padding: EdgeInsets.only(left: 20),
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              controller: descriptionController,
                              decoration: InputDecoration(
                                  hintText: "Description",
                                  border: InputBorder.none),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            padding: EdgeInsets.only(left: 20),
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: TextField(
                              controller: dateController,
                              decoration: InputDecoration(
                                  hintText: "date", border: InputBorder.none),
                              // Icon(Icons.calendar_month)
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 20,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const NeverScrollableScrollPhysics(),
                                // shrinkWrap: true,
                                itemCount: color.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedColor = color[index];
                                        isSelectedColor = index;
                                      });
                                    },
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: color[index],
                                      child: isSelectedColor == index
                                          ? Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 13,
                                            )
                                          : null,
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                noteModel.add(NoteModel(
                                    date: dateController.text,
                                    description: descriptionController.text,
                                    title: titleController.text,
                                    color: selectedColor!));
                              });
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                'Save',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          backgroundColor: Color.fromARGB(255, 240, 105, 38),
          child: Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
        ),
        // body: _notes.isEmpty
        //     ? Center(
        //         child: Text('No notes yet. Add one!',
        //             style: TextStyle(
        //                 color: Colors.grey,
        //                 fontSize: 20,
        //                 fontWeight: FontWeight.w400)),
        //       )
        body: ListView.builder(
            itemCount: noteModel.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Details(index: index,
                      title: widget.title?? "",
                      description: widget.description??"",
                      date: widget.date??"",)));
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  // height: 100,
                  margin: EdgeInsets.only(top: 20, left: 25, right: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: noteModel[index].color,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ListTile(
                        title: Text(noteModel[index].title),
                        subtitle: Text(noteModel[index].description),
                        trailing: Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    noteModel.removeAt(index);
                                  });
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Text(noteModel[index].date),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
