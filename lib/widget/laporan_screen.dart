import 'dart:io';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/food_conversion_rate.dart';
import 'package:farmapp/widget/laporan_penggunaan_pakan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:farmapp/widget/laporan_pertambahan_bobot_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LaporanScreen extends StatefulWidget {
  @override
  _LaporanScreenState createState() => _LaporanScreenState();
}

class _LaporanScreenState extends State<LaporanScreen> {
  DateFormat _df = DateFormat("dd-MM-yyyy");
  DateTime _selectedDate;
  bool _downloading;
  bool _downloadComplete;
  final _urlReport = 'v1/reports/rptPertambahanBobot?startDate=';
  String _progressPercentage = '';
  BuildContext _buildContext;
  String _dir = '';
  String _pathPDF = '';
  String _urlPDF = '';

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _downloading = false;
    _downloadComplete = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_primary_dark,
        title: ListTile(
          leading: Hero(
            tag: 'icon_laporan',
            child: Icon(
              icon_laporan,
              color: Colors.white,
            ),
          ),
          title: Hero(
            tag: 'text_laporan',
            child: Text(
              'Laporan',
              style: textstyle_appbar,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Kembali ke halaman utama',
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName('/'));
            },
          ),
        ],
      ),
      backgroundColor: color_primary_light,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Hero(
              tag: 'body_laporan',
              child: Container(
                color: color_primary_light,
              ),
            ),
            _downloading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(child: CircularProgressIndicator()),
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(child: Text('Fetching data...')),
                    ],
                  )
                : Builder(
                    builder: (context2) {
                      _buildContext = context2;
                      return Scaffold(
                        body: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Text('Pilih Tanggal Laporan'),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: color_primary_light,
                                border: Border(
                                  bottom: BorderSide(
                                      color: color_divider,
                                      width: 1.0,
                                      style: BorderStyle.solid),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: SizedBox(
                                height: 200,
                                child: CupertinoDatePicker(
                                  initialDateTime: _selectedDate,
                                  mode: CupertinoDatePickerMode.date,
                                  onDateTimeChanged: (dateTime) {
                                    _selectedDate = dateTime;
                                  },
                                ),
                              ),
                            ),
                            buttonOpenLaporan(),
//                      _downloadComplete
//                          ? Padding(
//                              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
//                              child: ButtonTheme(
//                                height: height_button_open,
//                                buttonColor: color_button_open,
//                                child: RaisedButton(
//                                  child: Text('Open',
//                                      style: textstyle_button_open),
//                                  onPressed: (){
//                                    _openLaporanPertambahanBobot().then((f) {
//                                      _pathPDF = f.path;
//                                      setState(() {
//                                        Navigator.push(
//                                            context,
//                                            MaterialPageRoute(
//                                                builder: (context) => PDFScreen(_pathPDF)));
//                                      });
//                                    });
//                                  },
//                                ),
//                              ),
//                            )
//                          : Container(),
//                      _downloading
//                          ? AspectRatio(
//                              aspectRatio: 3,
//                              child: Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: <Widget>[
//                                  CircularProgressIndicator(),
//                                  SizedBox(
//                                    height: 20.0,
//                                  ),
//                                  Text('Downloading file: ' +
//                                      _progressPercentage),
//                                ],
//                              ),
//                            )
//                          : Container(),
                          ],
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }

  Widget buttonOpenLaporan() {
    if (_downloading) {
      return ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ButtonTheme(
              height: height_button_download,
              buttonColor: color_button_download,
              child: RaisedButton(
                child: Text(
                  'Laporan Pertambahan Bobot',
                  style: textstyle_button_download,
                ),
                onPressed: null,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ButtonTheme(
              height: height_button_download,
              buttonColor: color_button_download,
              child: RaisedButton(
                child: Text(
                  'Laporan Penggunaan Pakan',
                  style: textstyle_button_download,
                ),
                onPressed: null,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ButtonTheme(
              height: height_button_download,
              buttonColor: color_button_download,
              child: RaisedButton(
                child: Text(
                  'Laporan 3',
                  style: textstyle_button_download,
                ),
                onPressed: null,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ButtonTheme(
              height: height_button_download,
              buttonColor: color_button_download,
              child: RaisedButton(
                child: Text(
                  'Laporan 4',
                  style: textstyle_button_download,
                ),
                onPressed: null,
              ),
            ),
          ),
        ],
      );
    } else {
      return ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ButtonTheme(
              height: height_button_download,
              buttonColor: color_button_download,
              child: RaisedButton(
                child: Text(
                  'Laporan Pertambahan Bobot',
                  style: textstyle_button_download,
                ),
                onPressed: () {
                  _openLaporanPertambahanBobot().then((f) {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LaporanPertambahanBobot(f.path)));
                    });
                  });
                },
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ButtonTheme(
              height: height_button_download,
              buttonColor: color_button_download,
              child: RaisedButton(
                child: Text(
                  'Laporan Penggunaan Pakan',
                  style: textstyle_button_download,
                ),
                onPressed: () {
                  _openLaporanPenggunaanPakan().then(
                    (value) {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LaporanPenggunaanPakan(value)));
                      });
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ButtonTheme(
              height: height_button_download,
              buttonColor: color_button_download,
              child: RaisedButton(
                child: Text(
                  'Laporan 3',
                  style: textstyle_button_download,
                ),
                onPressed: () {
                  _openLaporanPertambahanBobot().then((f) {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LaporanPertambahanBobot(f.path)));
                    });
                  });
                },
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ButtonTheme(
              height: height_button_download,
              buttonColor: color_button_download,
              child: RaisedButton(
                child: Text(
                  'Laporan 4',
                  style: textstyle_button_download,
                ),
                onPressed: () {
                  _openLaporanPertambahanBobot().then((f) {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LaporanPertambahanBobot(f.path)));
                    });
                  });
                },
              ),
            ),
          ),
        ],
      );
    }
  }

  void _showSnackBarFinished() {
    Scaffold.of(_buildContext).showSnackBar(
      SnackBar(
        content: Text('Proses download telah selesai'),
      ),
    );
    setState(() {});
  }

  Future<void> _downloadFile() async {
    Dio dio = Dio();
    try {
      var savePath = await getExternalStorageDirectory();
      _dir = savePath.path + '/laporan.pdf';
      String downloadPath = url_path + _urlReport + _df.format(_selectedDate);
      _urlPDF = downloadPath;
      await dio.download(
        downloadPath,
        _dir,
        onReceiveProgress: (rec, total) {
          _downloading = true;
          setState(
            () {
              _progressPercentage =
                  ((rec / total) * 100).toStringAsFixed(0) + '%';
            },
          );
        },
      );
    } catch (e) {
      print(e);
    }
    _downloading = false;
    _downloadComplete = true;
    setState(() {
      _showSnackBarFinished();
    });
  }

  Future<File> _openLaporanPertambahanBobot() async {
    setState(() {
      _downloading = true;
    });
//    String downloadPath =
//        'https://thestonesoup.com/blog/images/free_stonesoup_ecookbook.pdf';
    String downloadPath = url_path +
        'v1/reports/rptPertambahanBobot?startDate=' +
        _df.format(_selectedDate);
    final url = downloadPath;
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    setState(() {
      _downloading = false;
    });
    return file;
  }

  Future<List> _openLaporanPenggunaanPakan() async {
    setState(() {
      _downloading = true;
    });
    String downloadPath = url_path +
        'v1/reports/rptFoodConversionRate?startDate=' +
        _df.format(_selectedDate);
    List<FoodConversionRate> list = [];
    var res = await http.get(downloadPath);
    int code = res.statusCode;
    if (code == 200) {
      List decodedJson = jsonDecode(res.body);
      for (int i = 0; i < decodedJson.length; i++) {
        FoodConversionRate f = FoodConversionRate.fromJson(decodedJson[i]);
        list.add(f);
      }
    }
    _downloading = false;
    return list;
  }
}
