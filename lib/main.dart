import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodzy/persentation/category_vendors_lists/bloc/category_cubit.dart';
import 'package:foodzy/persentation/category_vendors_lists/bloc/vendors_cubit.dart';
import 'package:foodzy/persentation/category_vendors_lists/page/category_vend_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'ProductSans',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white),

      ///
      ////
      ///
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CategoryCubit(),
          ),
          BlocProvider(
            create: (_) => VendorsCubit(),
          ),
        ],

        ///
        ///
        ///                         /// This is the main entry point of the app where we set up the
        child: const CategoryVendPage(),
      ),
    );
  }
}
