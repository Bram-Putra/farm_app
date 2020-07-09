import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/widget/feeding_list_widget.dart';
import 'package:farmapp/widget/group_category_master_list_widget.dart';
import 'package:farmapp/widget/login_screen.dart';
import 'package:farmapp/widget/mutasi_list_widget.dart';
import 'package:farmapp/widget/screen_splash.dart';
import 'package:farmapp/widget/screen_home.dart';
import 'package:farmapp/widget/screen_master.dart';
import 'package:farmapp/widget/screen_transaksi.dart';
import 'package:farmapp/widget/screen_dashboard.dart';
import 'package:farmapp/widget/laporan_screen.dart';
import 'package:flutter/material.dart';
import 'package:farmapp/widget/cage_master_list_widget.dart';
import 'package:farmapp/widget/materi_master_list_widget.dart';
import 'package:farmapp/widget/materi_type_master_list_widget.dart';
import 'package:farmapp/widget/livestock_type_master_list_widget.dart';
import 'package:flutter/services.dart';
import 'package:farmapp/widget/daily_check_list_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) => runApp(FarmApp()));
}

class FarmApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: color_primary_dark,
      title: 'Farm App',
      initialRoute: '/splash',
      routes: {
        '/' : (context) => ScreenHome(),
        '/splash' : (context) => ScreenSplash(),
        '/login' : (context) => LoginScreen(),
        '/master' : (context) => ScreenMaster(),
        '/transaksi' : (context) => ScreenTransaksi(),
        '/laporan' : (context) => LaporanScreen(),
        '/dashboard' : (context) => ScreenDashboard(),
        '/kandang' : (context) => CageMasterList(),
        '/materi' : (context) => MateriMasterList(),
        '/materi-type' : (context) => MateriTypeMasterList(),
        '/livestock' : (context) => LivestockTypeMasterList(),
        '/group-category' : (context) => GroupCategoryMasterList(),
        '/inspeksi-harian' : (context) => DailyCheckList(),
        '/pemberian-pakan' : (context) => FeedingList(),
        '/mutasi' : (context) => MutasiList(),
      },
    );
  }
}