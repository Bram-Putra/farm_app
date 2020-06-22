import 'dart:io';
import 'dart:typed_data';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:farmapp/widget/full_pdf_viewer_screen_widget.dart';

class ScreenLaporan extends StatefulWidget {
  @override
  _ScreenLaporanState createState() => _ScreenLaporanState();
}

class _ScreenLaporanState extends State<ScreenLaporan> {
  DateFormat df = DateFormat("dd-MM-yyyy");
  DateTime _selectedDate;
  String _stringSelectedDate;
  bool _downloading = false;
  final _urlPath =
      'v1/reports/rptPertambahanBobot?startDate=';
  String _progressPercentage = '';
  BuildContext _buildContext;
  String _dir = '';

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _stringSelectedDate = _selectedDate.toString().substring(0, 10);
    _downloading = false;
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
                              _stringSelectedDate = df.format(_selectedDate);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ButtonDownload(),
                      ),
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
          onPressed: () {
            _showSnackBarDownloading();
          },
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

  void _showSnackBarDownloading() {
    Scaffold.of(_buildContext).showSnackBar(
      SnackBar(
        content: Text('Harap menunggu sampai download selesai'),
      ),
    );
    setState(() {});
  }

  void _showSnackBarFinished() {
    Scaffold.of(_buildContext).showSnackBar(
      SnackBar(
        content: Text('Proses download telah selesai'),
        action: SnackBarAction(
            label: 'Open',
            onPressed: () {
//              _openDownloadedReport();
            }),
      ),
    );
    setState(() {});
  }

  void _openDownloadedReport() {
    print('Ini alamat file yang seharusnya dibuka: '+_dir);
    prepareTestPdf().then((path) {
      print(path);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FullPdfViewerScreen(path)),
      );
    });
  }

  Future<void> _downloadFile() async {
    Dio dio = Dio();
    try {
      var savePath = await getExternalStorageDirectory();
      _dir = savePath.path + '/laporan.pdf';
      String downloadPath = url_path+_urlPath+df.format(_selectedDate);
      print(downloadPath);
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
    setState(() {
      _showSnackBarFinished();
    });
  }

  Future<String> prepareTestPdf() async {
    final ByteData bytes =
    await DefaultAssetBundle.of(context).load(_dir);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}'+_dir;

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);
    return tempDocumentPath;
  }
}
