import 'package:demotinder/model/user.dart';
import 'package:demotinder/repo/repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

import 'bloc/user/user_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CardController controller;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.getUser(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    //Use this to trigger swap.
    return Scaffold(
      body: StreamBuilder<List<User>>(
        stream: bloc.subject.stream,
        builder: (context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null && snapshot.data.length > 0) {
              return _buildUserWidget(snapshot.data);
            } else
              return _buildErrorWidget();
          } else if (snapshot.hasError) {
            return _buildErrorWidget();
          } else {
            return _buildLoadingWidget();
          }
        },
      ),
    );
  }

  Widget _buildUserWidget(List<User> data) {

    return Center(
        child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: new TinderSwapCard(
                orientation: AmassOrientation.BOTTOM,
                totalNum: data.length,
                stackNum: 3,
                swipeEdge: 4.0,
                maxWidth: MediaQuery.of(context).size.width * 0.9,
                maxHeight: MediaQuery.of(context).size.width * 0.9,
                minWidth: MediaQuery.of(context).size.width * 0.8,
                minHeight: MediaQuery.of(context).size.width * 0.8,
                cardBuilder: (context, index) => Card(
                        child: Text(
                      '${data[index].results[0].name.first} + ${data[index].results[0].userId}',
                      style: TextStyle(color: Colors.blue),
                    )),
                cardController: controller = CardController(),
                swipeUpdateCallback:
                    (DragUpdateDetails details, Alignment align) {
                  /// Get swiping card's alignment
                  if (align.x < 0) {
                    //Card is LEFT swiping
                  } else if (align.x > 0) {
                    //Card is RIGHT swiping
                  }
                },
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {
                  /// Get orientation & index of swiped card!
                })));
  }

  Widget _buildLoadingWidget() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorWidget() {
    return Center(child: Text('Error'));
  }
}
