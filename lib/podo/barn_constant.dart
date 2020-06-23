library constants;

import 'package:farmapp/icon/besoft_icons.dart';
import 'package:flutter/material.dart';

const url_path = 'http://165.22.61.234:9999/barn/';
//const url_path = 'http://192.168.1.4:9999/barn/';

const app_title = 'Farm House';

//Color:
const color_primary_dark = const Color(0xFF455A64);
const color_primary_medium = const Color(0xFF607D8B);
const color_primary_light = const Color(0xFFCFD8DC);
const color_primary_white = Colors.white;
const color_text_primary = const Color(0xFF212121);
const color_text_secondary = const Color(0xFF757575);
const color_text_white = const Color(0xFFFFFFFF);
const color_divider = const Color(0xFFBDBDBD);
const color_divider_children = const Color(0xFFFFFFFF);
const color_accent = const Color(0xFF9E9E9E);
const color_delete = const Color(0xFFFF5252);
const color_edit = const Color(0xFF00796B);
const color_dropdown_text = const Color(0xFF00796B);
const color_appbar_icon = Colors.white;
const color_button_save = Colors.teal;
const color_button_save_text = Colors.white;
const color_button_download = const Color(0xFF455A64);
const color_button_download_disabled = const Color(0xFFCFD8DC);
const color_button_download_text = Colors.white;
const color_button_open_text = Colors.white;
const color_button_open = const Color(0xFF455A64);
const color_screen_button_white = Colors.white;

//Icon:
const IconData icon_dashboard = BeSoftIcons.gauge;
const IconData icon_kandang = BeSoftIcons.barn;
const IconData icon_laporan = Icons.library_books;
const IconData icon_livestock = Icons.hdr_strong;
const IconData icon_master = Icons.storage;
const IconData icon_materi = Icons.view_agenda;
const IconData icon_materi_type = Icons.donut_large;
const IconData icon_transaksi = Icons.multiline_chart;
const IconData icon_user = Icons.person;
const IconData icon_dropdown = Icons.expand_more;
const IconData icon_group_category = Icons.group_work;
const IconData icon_inspeksi_harian = Icons.calendar_today;
const IconData icon_pemberian_pakan = Icons.format_color_fill;
const IconData icon_mutasi = Icons.change_history;
const IconData icon_delete = Icons.delete;
const IconData icon_edit = Icons.edit;

//Size:
const double preferred_font_size = 16.0;
const double height_textformfield = 60.0;
const double size_dropdown_icon = 40.0;
const double height_button_save = 48.0;
const double height_button_download = 48.0;
const double height_button_open = 48.0;
const double size_button_save_text = 20.0;
const double size_button_download_text = 20.0;
const double size_button_open_text = 20.0;
const int elevation_dropdown = 16;

//Master Button Style:
const textstyle_screenhome_button = TextStyle(
    color: color_text_primary,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    fontFamily: 'Source Sans Pro');
const size_screenhome_button_icon = 56.0;
const textstyle_screenmaster_button = TextStyle(
    color: color_text_secondary,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    fontFamily: 'Source Sans Pro');
const size_screenmaster_button_icon = 48.0;
const textstyle_appbar = TextStyle(
    color: color_text_white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    fontFamily: 'Source Sans Pro');
const textstyle_listview_header = TextStyle(
    color: color_text_primary,
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    fontFamily: 'Source Sans Pro');
const textstyle_listview_items = TextStyle(
    color: color_text_primary,
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    fontFamily: 'Source Sans Pro');
const textstyle_button_save = TextStyle(
    color: color_button_save_text,
    fontSize: size_button_save_text,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    fontFamily: 'Source Sans Pro');
const textstyle_button_download = TextStyle(
    color: color_button_download_text,
    fontSize: size_button_download_text,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    fontFamily: 'Source Sans Pro');
const textstyle_button_open = TextStyle(
    color: color_button_open_text,
    fontSize: size_button_open_text,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    fontFamily: 'Source Sans Pro');