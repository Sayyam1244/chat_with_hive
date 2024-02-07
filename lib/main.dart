import 'dart:developer';
import 'package:chat_with_hive/Src/Application/Services/Dbservices/db_services.dart';
import 'package:chat_with_hive/Src/Data/DataSource/Resources/app_colors.dart';
import 'package:chat_with_hive/Src/Domain/Models/chat.dart';
import 'package:chat_with_hive/Src/Domain/Models/chatHead.dart';
import 'package:chat_with_hive/Src/Presentation/Widgets/ChatHead/chat_head_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ChatHeadAdapter());
  Hive.registerAdapter(ChatAdapter());
  await DBServices().hiveBoxesInit();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          theme: ThemeData(
            primaryColor: AppColors.greenColor,
            colorScheme: Theme.of(context)
                .colorScheme
                .copyWith(primary: AppColors.greenColor),
          ),
          home: const ChatHeadScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
