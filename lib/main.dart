import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v_room_app/Blocs/forget_password_bloc.dart';
import 'package:v_room_app/Blocs/home_bloc.dart';
import 'package:v_room_app/Blocs/login_bloc.dart';
import 'package:v_room_app/Blocs/register_bloc.dart';
import 'package:v_room_app/Blocs/resturant_bloc.dart';
import 'package:v_room_app/screens/home.dart';
import 'package:v_room_app/screens/splash.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:v_room_app/utils/Constants.dart';
import 'package:v_room_app/utils/FontsUtils.dart';
import 'package:v_room_app/utils/PreferenceManger.dart';
import 'package:v_room_app/utils/TokenUtil.dart';
import 'package:v_room_app/viewModel/locale/appLocalization.dart';
import 'package:v_room_app/viewModel/locale/localizationProvider.dart';
import 'generated/l10n.dart';

main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  var token = await PreferenceManager.getInstance().getString('token');

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(ProviderScope(
      child: MyMaterial(
    localeApp: prefs.getString(Constants.languageCode),
    token: token,
  )));
}

class MyMaterial extends ConsumerWidget {
  var localeApp;
  var token;

  MyMaterial({this.localeApp, this.token});
  @override
  Widget build(BuildContext context, watch) {
    print('${localeApp}');
    print('${token}');
    var locProvider = watch(localProvider);
    print(locProvider.appLocal);
    return ScreenUtilInit(
      designSize: Size(428, 926),
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider<RegisterBloc>(create: (_) => RegisterBloc()),
          BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
          BlocProvider<ForgetPasswordBloc>(create: (_) => ForgetPasswordBloc()),
          BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
          BlocProvider<ResturantBloc>(create: (_) => ResturantBloc()),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: true,
          locale: Locale(localeApp.toString()),
          theme: ThemeData(
            primaryColor: ColorsUtils.primaryYellow,
            scaffoldBackgroundColor: ColorsUtils.scaffoldBackgroundColor,
            fontFamily: FontUtils.CAIRO_FONT,
          ),
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: token != '' ? Home() : Splash(),
        ),
      ),
    );
  }
}
