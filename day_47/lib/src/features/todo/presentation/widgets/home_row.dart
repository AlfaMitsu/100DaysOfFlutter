import 'package:day_47/src/constants/assets.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';

class HomeRow extends StatelessWidget {
  final Map uObj;
  final VoidCallback onPressed;

  const HomeRow({
    super.key,
    required this.uObj,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var imagesArr = uObj['images'] as List? ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      uObj['image'] as String? ?? '',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (uObj['is_online'] as bool? ?? false)
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: kBase,
                        border: Border.all(
                          color: kWhiteColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      uObj['name'] as String? ?? '',
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      style: kChatViewActiveTextStyle,
                    ),
                    Text(
                      '${uObj['status'] as String? ?? ''} | ${uObj['time'] as String? ?? ''}',
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      style: kHomeRowTextStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              InkWell(
                onTap: onPressed,
                child: Image.asset(
                  kImgMoreButton,
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemCount: imagesArr.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    imagesArr[index] as String? ?? '',
                    height: 120,
                    width: 140,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
