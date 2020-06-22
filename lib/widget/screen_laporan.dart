import 'package:farmapp/podo/barn_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class ScreenLaporan extends StatefulWidget {
  @override
  _ScreenLaporanState createState() => _ScreenLaporanState();
}

class _ScreenLaporanState extends State<ScreenLaporan> {
  DateFormat df = DateFormat("dd MMM yyyy");
  DateTime _selectedDate;
  String _stringSelectedDate;
  bool _downloading = false;
  final fileUrl = 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf';

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
      body: Stack(
        children: <Widget>[
          Hero(
            tag: 'body_laporan',
            child: Container(
              color: color_primary_light,
            ),
          ),
          Column(
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
                      _stringSelectedDate = _selectedDate.toString().substring(0, 10);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ButtonDownload(),
              ),
              _downloading ? AspectRatio(
                aspectRatio: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(height: 20.0,),
                    Text('Downloading file'),
                  ],
                ),
              ) : Container(),
            ],
          ),
        ],
      ),
    );
  }

  Widget ButtonDownload() {
    if(_downloading) {
      return ButtonTheme(
        height: height_button_download,
        buttonColor: color_button_download_disabled,
        child: RaisedButton(
          child: Text('Download', style: textstyle_button_download,),
          onPressed: () {
            _showSnackBar();
          },
        ),
      );
    } else {
      return ButtonTheme(
        height: height_button_download,
        buttonColor: color_button_download,
        child: RaisedButton(
          child: Text('Download', style: textstyle_button_download,),
          onPressed: () {
            _download();
          },
        ),
      );
    }
  }

  void _showSnackBar() {
    _downloading = false;
    print('Please wait until the previous file has finished downloading');
    setState(() {});
  }

  void _download() {
    _downloading = true;
    print('Downloading report: '+_stringSelectedDate);
    setState(() {});
  }
}
