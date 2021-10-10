import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/Blocs/login_bloc.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class Home extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.appBackground,
      body: Form(
        key: _globalKey,
        child: BlocBuilder<LoginBloc, AppState>(
          builder: (_, state) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/logo.jpg',
                        scale: 4.5,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text("HomePage"),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
