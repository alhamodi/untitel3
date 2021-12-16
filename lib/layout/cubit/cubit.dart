import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/layout/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/models/azkar_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:untitled3/shared/cash_helper.dart';

class AzkarCubit extends Cubit<AzkarStates> {
  AzkarCubit() : super(InitAzkarState());

  static AzkarCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<ModelAzkar> azkars = [
    ModelAzkar(
        azkarLocation: 'assets/audio/lal.mp3',
        azkarName: 'أذكار اخر الليل',
        azkarTime: 'اوراد واذكار ومناجاه'),
    ModelAzkar(
        azkarLocation: 'assets/audio/fjr.mp3',
        azkarName: 'أذكار بعد الفجر',
        azkarTime: 'مجموعه اوراد واذكار '),
    ModelAzkar(
        azkarLocation: 'assets/audio/dhr.mp3',
        azkarName: 'أذكار بعد الظهر',
        azkarTime: 'حزب النصر للامام الحداد'),
    ModelAzkar(
        azkarLocation: 'assets/audio/asr.mp3',
        azkarName: 'أذكار بعد العصر',
        azkarTime: 'سورة الواقعة وحزب البحر '),
    ModelAzkar(
        azkarLocation: 'assets/audio/kablmghrib.mp3',
        azkarName: 'أذكار قبل المغرب',
        azkarTime: 'الورد اللطيف للإمام الحداد'),
    ModelAzkar(
        azkarLocation: 'assets/audio/eshaa.mp3',
        azkarName: 'أذكار بين العشائين ',
        azkarTime: 'سورة يس والدعاء الذي يقرأ بعدها'),
    ModelAzkar(
        azkarLocation: 'assets/audio/haddad.mp3',
        azkarName: 'راتب الامام الحداد',
        azkarTime: 'راتب الامام عبدالله بن علوي الحداد'),
    ModelAzkar(
        azkarLocation: 'assets/audio/attas.mp3',
        azkarName: 'راتب الامام العطاس',
        azkarTime: 'راتب الامام عمر بن عبدالرحمن العطاس'),
    ModelAzkar(
        azkarLocation: 'assets/audio/eshaa.mp3',
        azkarName: 'اذكار بعد العشاء ',
        azkarTime: 'ورد الإمام السكران و الإمام النووي '),
    ModelAzkar(
        azkarLocation: 'assets/audio/jmaa.mp3',
        azkarName: 'اذكار ليلة الجمعة ويومها  ',
        azkarTime: 'سور من القران و صلوات مختارة '),
    ModelAzkar(
        azkarLocation: 'assets/audio/asrjmaa.mp3',
        azkarName: 'أذكار عصر يوم الجمعة ',
        azkarTime: 'صيغ صلوات'),
  ];

  final player = AudioPlayer();
  bool isPlaying = false;
  bool isStop = false;
  Icon play_icon = Icon(Icons.play_arrow);
  Icon pause_icon = Icon(Icons.pause);

  playAzkar(String? azkarLocation, int index) async {
    currentIndex = index;
    isPlaying = true;
    await player.setAsset(azkarLocation!);
    player.play();
    emit(PlayAzkarState());
  }

  stopAzkar() {
    player.stop();
    isPlaying = false;
    isStop=true;
    emit(StopAzkarState());
  }

  pauseAzkar() {
    player.pause();
    isPlaying = false;

    emit(PauseAzkarState());
  }

  playAgainAzkar() {
    player.play();
    isPlaying = true;
    isStop=false;
    emit(PlayAgainAzkarState());
  }

  bool isDark = false;
  IconData? icon = Icons.brightness_4_outlined;
  ThemeMode appMode = ThemeMode.light;

  void changeMode({fromCache}) {
    if (fromCache == null)
      isDark = !isDark;
    else
      isDark = fromCache;
    CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
      if (isDark) {
        icon = Icons.brightness_7;
        appMode = ThemeMode.dark;
      } else {
        icon = Icons.brightness_4_outlined;
        appMode = ThemeMode.light;
      }
      emit(ChangeModeState());
    });
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    player.seek(newDuration);
    emit(ChangePosition());
  }
}
