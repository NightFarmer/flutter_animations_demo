import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/animated_fab.dart';
import 'package:flutter_demo/ui/clipped_image.dart';
import 'package:flutter_demo/ui/list_model.dart';
import 'package:flutter_demo/ui/task.dart';
import 'package:flutter_demo/ui/task_row.dart';

class MenuTestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  double _imageHeight = 300.0;
  bool showOnlyCompleted = false;
  ListModel listModel;
  Drawer drawer = new Drawer();
  final GlobalKey<ScaffoldState> _scaffoldKey = new 
        GlobalKey<ScaffoldState>();
  final GlobalKey<AnimatedListState> _listKey = new GlobalKey<AnimatedListState>();
  List<Task> tasks = [
    new Task(
        name: "Catch up with Brian",
        category: "Mobile Project",
        time: "5pm",
        color: Colors.orange,
        completed: false),
    new Task(
        name: "Make new icons",
        category: "Web App",
        time: "3pm",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Design explorations",
        category: "Company Website",
        time: "2pm",
        color: Colors.pink,
        completed: false),
    new Task(
        name: "Lunch with Mary",
        category: "Grill House",
        time: "12pm",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Teem Meeting",
        category: "Hangouts",
        time: "10am",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Eat Dinner",
        category: "HotDog",
        time: "11am",
        color: Colors.brown,
        completed: true),
  ];
  
  @override
    void initState() {
      super.initState();
       listModel = new ListModel(_listKey, tasks);
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: new Stack(
        children: <Widget>[
          _buildTimeLine(),
          _buildIamge(),
          _buildHeader(),
          _buildProfileRow(),
          _buildBottomPart(),
          _buildFab(),
        ],
      ),
      drawer: new Drawer(),
    );
  }
  Widget _buildFab(){
    return new Positioned(
      top: _imageHeight-100.0,
      right: -40.0,
      child: new AnimatedFab(
        onClick: _changeFilterState,
      ),
    );
  }
  _changeFilterState(){
      showOnlyCompleted = !showOnlyCompleted;
      tasks.where((task)=>!task.completed).forEach((task){
         if (showOnlyCompleted) {
        listModel.removeAt(listModel.indexOf(task));
      } else {
        listModel.insert(tasks.indexOf(task), task);
      }
      });
  }
  Widget _buildIamge() {
    return new ClipPath(
      clipper: new ChippedImage(),
      child: new Image.network(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543855313861&di=53015e6c0910c4975e4a3d9fcaefd7e7&imgtype=0&src=http%3A%2F%2Fd.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F91ef76c6a7efce1b5ef04082a251f3deb58f659b.jpg',
        fit: BoxFit.fitHeight,
        height: _imageHeight,
        colorBlendMode: BlendMode.srcOver,
        color: new Color.fromARGB(120, 20, 10, 40),
      ),
    );
  }
  Widget _buildTasksList(){
    return new Expanded(
      child: new AnimatedList(
        initialItemCount: tasks.length,
        key: _listKey,
        itemBuilder: (context,index,animation){
          return new TextRow(
            task: listModel[index],
            animation: animation,
          );
        },
      ),
    );
  }
  Widget _buildHeader() {
    return new Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 40.0),
      child: new Row(
        children: <Widget>[
          new GestureDetector(
            child: new Icon(Icons.menu, size: 32.0, color: Colors.white),
            onTap: (){
             _scaffoldKey.currentState.openDrawer();
            },
          ),
          new Expanded(
            child: new Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text('时光轴',
                  style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300)),
            ),
          ),
          new Icon(Icons.linear_scale, color: Colors.white)
        ],
      ),
    );
  }

  Widget _buildProfileRow() {
    return new Padding(
      padding: EdgeInsets.only(left: 16.0, top: _imageHeight / 2.5),
      child: new Row(
        children: <Widget>[
          new CircleAvatar(
            minRadius: 28.0,
            maxRadius: 28.0,
            backgroundImage: new NetworkImage(
                'https://pic.qqtn.com/up/2018-10/15404330676542433.jpg!360_360'),
          ),
          new Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '做一个世界的水手',
                  style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '游遍所有的港口',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return new Padding(
      padding: EdgeInsets.only(top: _imageHeight),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_buildMyTaskHeader(), _buildTasksList()],
      ),
    );
  }

  Widget _buildMyTaskHeader() {
    return new Padding(
      padding: EdgeInsets.only(left: 64.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '我的任务',
            style: TextStyle(fontSize: 34.0),
          ),
          new Padding(
            padding: EdgeInsets.only(left: 3.0),
            child: Text(
              '2018-12-3 星期一',
              style: TextStyle(color: Colors.grey, fontSize: 15.0),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTimeLine() {
    return new Positioned(
      top: 0.0,
      left: 32.0,
      bottom: 0.0,
      child: new Container(
        width: 1,
        color: Colors.grey[300],
      ),
    );
  }

  // Widget _buildTaskList() {
  //   return new Expanded(
  //     child: new ListView(
  //       children: tasks.map((task) => TextRow(task: task)).toList(),
  //     ),
  //   );
  // }
}
