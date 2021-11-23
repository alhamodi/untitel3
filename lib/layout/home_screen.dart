import 'package:flutter/material.dart';
import 'package:untitled3/layout/cubit/cubit.dart';
import 'package:untitled3/layout/cubit/states.dart';
import 'package:untitled3/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AzkarCubit(),
      child: BlocConsumer<AzkarCubit, AzkarStates>(
        listener: (context, state) {
          if(state == PlayAzkarState)
          {

          }
        },
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
              ),
              body: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      azkarRow(cubit.azkars[index], () async {
                        await cubit
                            .playAzkar(cubit.azkars[index].azkarLocation,index);
                      }),
                  itemCount: cubit.azkars.length),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 140.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: Colors.brown.shade100),
                  child: Column(
                    children: [
                      Slider(value: 23, onChanged: (value){},max: 100,min: 0,),
                      Text('${cubit.azkars[cubit.currentIndex].azkarName} ... ${cubit.azkars[cubit.currentIndex].azkarTime}'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () async {
                                await cubit.stopAzkar();
                              },
                              icon: Icon(Icons.stop)),
                          IconButton(
                              onPressed: () async {
                               cubit.isPlaying? await cubit.pauseAzkar():await cubit.playAgainAzkar();
                              },
                              icon:cubit.icon),

                        ],
                      ),
                    ],
                  ),
                ),
              )
              // buildSeekBar(()async{
              //   await cubit.stopAzkar();
              // }),
              );
        },
      ),
    );
  }
}
