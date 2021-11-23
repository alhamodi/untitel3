import 'package:flutter/material.dart';
import 'package:untitled3/models/azkar_model.dart';

Widget azkarRow(ModelAzkar azkar, void Function()? function) => Padding(
      padding: const EdgeInsets.only(left: 9, top: 9, right: 20, bottom: 9),
      child: InkWell(
        onTap: function,
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.brown.shade100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${azkar.azkarName}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    '${azkar.azkarTime}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              const CircleAvatar(
                backgroundColor: Colors.brown,
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
