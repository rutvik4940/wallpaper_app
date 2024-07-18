

import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../utils/api_helper.dart';
import '../model/home_model.dart';

class HomeProvider with ChangeNotifier {
  int index = 0;
  AnimalModel? animalModel;

  Future<void> animalGetData(String wallpaper) async {
    AnimalModel? l4 = await APIHelper.helper.animalData(wallpaper);
    if (l4 != null) {
      animalModel = l4;
      notifyListeners();
    }
  }

  Future<void> setwallpapaer( wallpepar) async {
    try {
      var result = await AsyncWallpaper.setWallpaper(
        url: wallpepar,
        wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
        goToHome: true,
        toastDetails: ToastDetails.success(),
        errorToastDetails: ToastDetails.error(),
      );

    }
    on PlatformException{
     var result = 'Failed to get wallpaper.';
    }

  }
  Future<void> setwallpapaer1( wallpepar1) async {
    try {
      var result = await AsyncWallpaper.setWallpaper(
        url: wallpepar1,
        wallpaperLocation: AsyncWallpaper.LOCK_SCREEN,
        goToHome: true,
        toastDetails: ToastDetails.success(),
        errorToastDetails: ToastDetails.error(),
      );

    }
    on PlatformException{
      var result = 'Failed to get wallpaper.';
    }

  }
}