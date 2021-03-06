import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalWillScope extends StatelessWidget {
  final ScrollController scrollController;

  const ModalWillScope({Key key, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: WillPopScope(
      onWillPop: () async {
        bool shouldClose = true;
        await showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
                  title: Text('Should Close?'),
                  actions: <Widget>[
                    CupertinoButton(
                      child: Text('Yes'),
                      onPressed: () {
                        shouldClose = true;
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoButton(
                      child: Text('No'),
                      onPressed: () {
                        shouldClose = false;
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ));
        print('hello');
        return shouldClose;
      },
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            transitionBetweenRoutes: false,
            leading: Container(), middle: Text('Modal Page')),
        child: Center(),
      ),
    ));
  }
}
