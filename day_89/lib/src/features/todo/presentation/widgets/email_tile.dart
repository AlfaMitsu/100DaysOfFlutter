import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';

class EmailTile extends StatelessWidget {
  final String sender;
  final String time;
  final String senderIcon;
  final String recipients;
  final String body;
  final String bodyImage;
  const EmailTile(
      {super.key,
      required this.sender,
      required this.time,
      required this.senderIcon,
      required this.recipients,
      required this.body,
      required this.bodyImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: Container(
        decoration: const BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 18,
                    child: Image.asset(
                      senderIcon,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        sender,
                        style: kFoldersTextStyle,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '$time ago',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 245, 241, 248),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: const Icon(
                      Icons.star_outline,
                      color: kGrey300Color,
                    ),
                  ),
                ],
              ),
              if (recipients != '')
                Column(
                  children: <Widget>[
                    const SizedBox(height: 15),
                    Text(
                      'To $recipients',
                      style: kRecipientsTextStyle,
                    ),
                  ],
                )
              else
                Container(),
              const SizedBox(height: 15),
              Text(
                body,
                style: kBodyTextStyle,
              ),
              const SizedBox(height: 9),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: (bodyImage != '') ? Image.asset(bodyImage) : Container(),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    width: 126,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 245, 241, 248),
                        ),
                        side: MaterialStateProperty.all(
                          const BorderSide(
                            width: 0.0,
                            color: kTransparent,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Reply',
                        style: kReply2TextStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 126,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 245, 241, 248),
                        ),
                        side: MaterialStateProperty.all(
                          const BorderSide(
                            width: 0.0,
                            color: kTransparent,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Reply all',
                        style: kReply2TextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
