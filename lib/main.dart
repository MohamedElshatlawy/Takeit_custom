import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:v_room_app/Blocs/forget_password_bloc.dart';
import 'package:v_room_app/Blocs/login_bloc.dart';
import 'package:v_room_app/Blocs/register_bloc.dart';
import 'package:v_room_app/screens/home.dart';
import 'package:v_room_app/screens/splash.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:v_room_app/utils/FontsUtils.dart';
import 'package:v_room_app/utils/PreferenceManger.dart';
import 'package:v_room_app/utils/TokenUtil.dart';
import 'package:v_room_app/viewModel/locale/localizationProvider.dart';
import 'generated/l10n.dart';

var logined;

main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  logined = TokenUtil.loadTokenToMemory();
  print('${logined}');
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(ProviderScope(child: MyMaterial()));
}

class MyMaterial extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    var locProvider = watch(localProvider);
    return ScreenUtilInit(
      designSize: Size(428, 926),
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider<RegisterBloc>(create: (_) => RegisterBloc()),
          BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
          BlocProvider<ForgetPasswordBloc>(create: (_) => ForgetPasswordBloc()),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          locale: locProvider.appLocal,
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
          home: logined != '' ? Home() : Splash(),
        ),
      ),
    );
  }
}
