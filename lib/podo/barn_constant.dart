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
const color_accent = const Color(0xFF9E9E9E);
const color_delete = const Color(0xFFFF5252);
const color_dropdown_text = const Color(0xFF00796B);
const color_raised_button = Colors.teal;
const color_raised_button_text = Colors.white;
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

//Size:
const double preferred_font_size = 16.0;
const double preferred_height = 60.0;
const double dropdown_icon_size = 40.0;
const double raised_button_height = 48.0;
const double raised_button_font_size = 20.0;
const int dropdown_elevation = 16;

//Master Button Style:
const screenhome_button_textstyle = TextStyle(
    color: color_text_primary,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    fontFamily: 'Source Sans Pro');
const screenhome_button_icon_size = 56.0;
const screenmaster_button_textstyle = TextStyle(
    color: color_text_secondary,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    fontFamily: 'Source Sans Pro');
const screenmaster_button_icon_size = 48.0;
const appbar_textstyle = TextStyle(
    color: color_text_white,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    fontFamily: 'Source Sans Pro');
const hero_textstyle_push = TextStyle(
    color: color_text_white,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    fontFamily: 'Source Sans Pro');
const hero_textstyle_pop = TextStyle(
    color: color_text_primary,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    fontFamily: 'Source Sans Pro');
