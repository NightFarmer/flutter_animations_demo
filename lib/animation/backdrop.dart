import 'package:flutter/material.dart';
import 'package:flutter_demo/animation/grid_animation.dart';

class BackDropPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BackDropPageState();
  }
}

class BackDropPageState extends State<BackDropPage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 100,
        ),
        value: 1.0);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  bool get isPanelVisible {
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed ||
        AnimationStatus.forward == status;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("BackDrop"),
        elevation: 0.0,
        leading: new IconButton(
          icon: new AnimatedIcon(
            icon: AnimatedIcons.close_menu,
            progress: controller.view,
          ),
          onPressed: () {
            controller.fling(velocity: isPanelVisible ? -1.0 : 1.0);
          },
        ),
      ),
      body: new BackDrop(controller: controller),
    );
  }
}

class BackDrop extends StatefulWidget {
  BackDrop({this.controller});
  final AnimationController controller;
  @override
  State<StatefulWidget> createState() {
    return BackDropState();
  }
}

class BackDropState extends State<BackDrop> {
  static const head_height = 32.0;

  Animation<RelativeRect> getPanelAnimation(BoxConstraints constrains) {
    final height = constrains.biggest.height;
    final backPanelHeight = height - head_height;
    final frontPahnelHeight = -head_height;

    return new RelativeRectTween(
      begin: new RelativeRect.fromLTRB(
          0.0, backPanelHeight, 0.0, frontPahnelHeight),
      end: new RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(
        new CurvedAnimation(parent: widget.controller, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: dropItem,
    );
  }

  Widget dropItem(BuildContext context, BoxConstraints constraints) {
    List<String> lists = [
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557760&di=2c0ccc64ab23eb9baa5f6582e0e4f52d&imgtype=0&src=http%3A%2F%2Fpic.feizl.com%2Fupload%2Fallimg%2F170725%2F43998m3qcnyxwxck.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557760&di=37d5107e6f7277bc4bfd323845a2ef32&imgtype=0&src=http%3A%2F%2Fn1.itc.cn%2Fimg8%2Fwb%2Fsmccloud%2Ffetch%2F2015%2F06%2F05%2F79697840747611479.JPEG",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557760&di=95860b0fd501110885cf6e191f7403f0&imgtype=0&src=http%3A%2F%2Fuploads.5068.com%2Fallimg%2F1712%2F144-1G2011I420.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212636935&di=110a278fe4fb22f07d183a049f36cba3&imgtype=jpg&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D3695896267%2C3833204074%26fm%3D214%26gp%3D0.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557759&di=3730dccf46e4b4f35bcb882148b973ee&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fpic%2F3%2F71%2F4c5b0d26ad.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557759&di=4f53fa8e1699def18e976deaee5558bf&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201707%2F07%2F20170707151851_r34Se.jpeg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212557758&di=ea77e663ac012b8ce7eb921454528cb8&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201707%2F07%2F20170707151853_Xr2UP.jpeg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686377&di=513a2deeb0b9f66ac9f7713c1f08e38c&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180926104109132.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686377&di=d895baef0710a780cbff871b68fbabba&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015170515909.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686376&di=6c670e61692a4b8a8c97fc8d751df6e9&imgtype=0&src=http%3A%2F%2Fpic.qqtn.com%2Fup%2F2018-8%2F2018082209071335857.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686375&di=5772b73b9349682e9883d57394655c5e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180926104109561.jpg",
      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1919562808,974781852&fm=11&gp=0.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686375&di=6646871a196763dad8bfb7d0b74f4fad&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180925112416520.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686375&di=07280c585f18cac3c1f251e7a496e2f3&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180920095533914.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=e0d4e585e1bafcfc0534f793091fbd03&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180918142250630.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=734df4a0341928437473ffaf4103b04e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015170515157.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=da3b239ebf59f5baae05eea6c663e8e5&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015111057142.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212686374&di=f1156ff86227ca20deeaf2251f9a4054&imgtype=0&src=http%3A%2F%2Fwmimg.sc115.com%2Fwm%2Fpic%2F1705%2F1705vzcqpmrsfxo.jpg",
      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=509143600,2831498304&fm=26&gp=0.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212767984&di=79e2286d0ecd5a944183eb319af5a07e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180920104457446.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212767983&di=779e1f58291cb90d7635fb7575c14149&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201810%2F20181015134233184.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542212833549&di=6f022bf302e786643fb43b9ba9c5a75e&imgtype=0&src=http%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201809%2F20180926110752933.jpg"
    ];
    void showPhoto(BuildContext context, f, index) {
      Navigator.push(context,
          MaterialPageRoute<void>(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: Text('图片${index + 1}')),
          body: SizedBox.expand(
            child: Hero(
              tag: index,
              child: new Photo(url: f),
            ),
          ),
        );
      }));
    }

    final themeData = Theme.of(context);
    return new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            color: themeData.primaryColor,
            child: new Center(
              child: Text("Back Panel",
                  style: new TextStyle(fontSize: 24.0, color: Colors.white)),
            ),
          ),
          new PositionedTransition(
            rect: getPanelAnimation(constraints),
            child: new Material(
              elevation: 12.0,
              borderRadius: new BorderRadius.only(
                topLeft: new Radius.circular(16.0),
                topRight: new Radius.circular(16.0),
              ),
              child: new Column(
                children: <Widget>[
                  new Container(
                    
                    child: new Expanded(
                    child: new SafeArea(
                      top: false,
                      bottom: false,
                      child: new GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 4.0,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 10.0
                        ),
                        childAspectRatio: 1.5,
                        children: lists.map((f) {
                          return new GestureDetector(
                            onTap: () {
                              var index;
                              if (lists.contains(f)) {
                                index = lists.indexOf(f);
                              }
                              showPhoto(context, f, index);
                            },
                            child: Image.network(
                              f,
                              fit: BoxFit.cover,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
