import 'package:flutter/material.dart';
import 'package:untitled3/layout/cubit/cubit.dart';
import 'package:untitled3/layout/cubit/states.dart';
import 'package:untitled3/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AzkarCubit, AzkarStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AzkarCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(
                  'الخلاصة صوت - بدون إنترنت',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      cubit.changeMode();
                    },
                    icon: Icon(cubit.icon))
              ],
            ),
            body: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    azkarRow(cubit.azkars[index], () async {
                      await cubit.playAzkar(
                          cubit.azkars[index].azkarLocation, index);
                    },context),
                itemCount: cubit.azkars.length),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 140.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    ),
                child: Column(
                  children: [
                    Slider(
                      value: cubit.isPlaying
                          ? cubit.player.position.inSeconds.toDouble()
                          : 0,
                      onChanged: (value) {
                        cubit.seekToSecond(value.toInt());
                        value = value;
                      },
                      max: cubit.isPlaying
                          ? cubit.player.duration!.inSeconds.toDouble()
                          : 10,
                      min: 0,
                    ),
                    Text(
                        '${cubit.azkars[cubit.currentIndex].azkarName} ... ${cubit.azkars[cubit.currentIndex].azkarTime}',style: TextStyle(

                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                            onPressed: () async {
                              await cubit.stopAzkar();
                            },
                            icon: Icon(Icons.stop)),
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () async {
                              cubit.isPlaying
                                  ? await cubit.pauseAzkar()
                                  : await cubit.playAgainAzkar();
                            },
                            icon: cubit.isPlaying
                                ? cubit.pause_icon
                                : cubit.play_icon),
                      ],
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
