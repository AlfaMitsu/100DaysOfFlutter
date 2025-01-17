import 'package:flutter/material.dart';

class ExampleAppBar extends StatelessWidget {
  final String title;
  final bool showGoBack;

  const ExampleAppBar({
    super.key,
    required this.title,
    required this.showGoBack,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black12, spreadRadius: 10.0, blurRadius: 20.0)
            ]),
        child: Row(
          children: <Widget>[
            Container(
              child: showGoBack
                  ? IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: EdgeInsets.zero,
                    )
                  : Container(
                      height: 50.0,
                    ),
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 25.0, fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}
