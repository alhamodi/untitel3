import 'package:flutter/material.dart';
import 'package:untitled3/models/azkar_model.dart';

Widget azkarRow(
        ModelAzkar azkar, void Function()? function, BuildContext context) =>
    Padding(
      padding: const EdgeInsets.only(left: 9, top: 9, right: 20, bottom: 9),
      child: InkWell(
        onTap: function,
        child: Container(
          padding:const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${azkar.azkarName}',
                      style:const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '${azkar.azkarTime}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const CircleAvatar(
                child: Icon(
                  Icons.play_circle_outline,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );

navigateAndReplacement(BuildContext context, Widget widget) {
  return Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}
