import 'dart:io';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:farmapp/widget/pdf_screen_widget.dart';

class ScreenLaporan extends StatefulWidget {
  @override
  _ScreenLaporanState createState() => _ScreenLaporanState();
}

class _ScreenLaporanState extends State<ScreenLaporan> {
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
            Builder(
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
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ButtonDownload(),
                      ),
                      _downloadComplete
                          ? Padding(
                              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                              child: ButtonTheme(
                                height: height_button_open,
                                buttonColor: color_button_open,
                                child: RaisedButton(
                                  child: Text('Open',
                                      style: textstyle_button_open),
                                  onPressed: (){
                                    createFileOfPdfUrl().then((f) {
                                      _pathPDF = f.path;
                                      setState(() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => PDFScreen(_pathPDF)));
                                      });
                                    });
                                  },
                                ),
                              ),
                            )
                          : Container(),
                      _downloading
                          ? AspectRatio(
                              aspectRatio: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CircularProgressIndicator(),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text('Downloading file: ' +
                                      _progressPercentage),
                                ],
                              ),
                            )
                          : Container(),
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

  Widget ButtonDownload() {
    if (_downloading) {
      return ButtonTheme(
        height: height_button_download,
        buttonColor: color_button_download_disabled,
        child: RaisedButton(
          child: Text(
            'Download',
            style: textstyle_button_download,
          ),
          onPressed: () {},
        ),
      );
    } else {
      return ButtonTheme(
        height: height_button_download,
        buttonColor: color_button_download,
        child: RaisedButton(
          child: Text(
            'Download',
            style: textstyle_button_download,
          ),
          onPressed: () {
            _downloadFile();
          },
        ),
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

  Future<File> createFileOfPdfUrl() async {
    final url = _urlPDF;
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }
}
