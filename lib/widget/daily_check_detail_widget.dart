import 'package:farmapp/controller/daily_check_controller.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/cage.dart';
import 'package:farmapp/podo/daily_check.dart';
import 'package:farmapp/widget/cage_dropdownbutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyCheckDetail extends StatefulWidget {
  final DailyCheck dailyCheck;

  DailyCheckDetail(this.dailyCheck);

  @override
  _DailyCheckDetailState createState() => _DailyCheckDetailState();
}

class _DailyCheckDetailState extends State<DailyCheckDetail> {
  DailyCheckController dcController = DailyCheckController();
  String _title = 'Data Baru';
  bool _isEdit = false;
  var df = DateFormat("dd MMM yyyy");

  final tcCheckId = TextEditingController();
  final tcCheckNumber = TextEditingController();
  final tcCheckDate = TextEditingController();
  final tcAlive = TextEditingController();
  final tcDead = TextEditingController();
  final tcHarvest = TextEditingController();
  final tcAverageWeight = TextEditingController();
  final tcTemperature = TextEditingController();
  final tcHumidity = TextEditingController();
  final tcCage = TextEditingController();
  final tcNotes = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.dailyCheck != null) {
      var nf = NumberFormat("#,###");
      var nfd = NumberFormat("#,###.##");
      tcCheckId.text = widget.dailyCheck.checkId.toString();
      tcCheckNumber.text = widget.dailyCheck.checkNumber;
      tcCheckDate.text = df.format(widget.dailyCheck.checkDate);
      tcAlive.text = nf.format(widget.dailyCheck.alive);
      tcDead.text = nf.format(widget.dailyCheck.dead);
      tcHarvest.text = nf.format(widget.dailyCheck.harvest);
      tcAverageWeight.text = nfd.format(widget.dailyCheck.averageWeight);
      tcTemperature.text = nfd.format(widget.dailyCheck.temperature);
      tcHumidity.text = nfd.format(widget.dailyCheck.humidity);
      tcNotes.text = widget.dailyCheck.notes;
      tcCage.text = widget.dailyCheck.cage.cageId.toString();
      _isEdit = true;
      _title = 'Edit';
    } else {
      tcCheckDate.text = df.format(DateTime.now());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_primary_dark,
        title: ListTile(
          leading: Icon(
            icon_inspeksi_harian,
            color: Colors.white,
          ),
          title: Text(
            _title,
            style: textstyle_appbar,
          ),
        ),
      ),
      body: Container(
        color: color_primary_light,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text('Inspeksi Harian'),
              subtitle: _isEdit
                  ? Text('#' + tcCheckNumber.text + ' :: ' + tcCheckDate.text)
                  : Text(tcCheckDate.text),
            ),
            CageDropdownButton(tcCage: tcCage),
            TextFormField(
              decoration: InputDecoration(labelText: 'Populasi'),
              controller: tcAlive,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Mortalitas'),
              controller: tcDead,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Panen'),
              controller: tcHarvest,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Berat rata-rata'),
              controller: tcAverageWeight,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Suhu ruangan'),
              controller: tcTemperature,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Kelembaban'),
              controller: tcHumidity,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Notes'),
              controller: tcNotes,
            ),
            SizedBox(
              height: 20.0,
            ),
            ButtonTheme(
              height: height_button_save,
              child: RaisedButton(
                onPressed: () {
                  _save();
                },
                color: color_button_save,
                child: Text(
                  'Save',
                  style: textstyle_button_save,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tcCheckId.dispose();
    tcCheckNumber.dispose();
    tcCheckDate.dispose();
    tcAlive.dispose();
    tcDead.dispose();
    tcHarvest.dispose();
    tcAverageWeight.dispose();
    tcTemperature.dispose();
    tcHumidity.dispose();
    tcCage.dispose();
    tcNotes.dispose();
    super.dispose();
  }

  void _save() {
    bool confirmSave = false;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Save'),
        content: Text('Apakah Anda yakin akan menyimpan data?'),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Konfirmasi')),
          FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Batal')),
        ],
      ),
    ).then((value) {
      confirmSave = value;
      if (confirmSave) {
        DailyCheck entity = DailyCheck();
        if (tcCheckId.text != '') {
          entity.checkId = int.parse(tcCheckId.text);
        }
        entity.checkNumber = tcCheckNumber.text;
        if (tcCheckDate.text != '') {
          var df = DateFormat("dd MMM yyyy");
          entity.checkDate = df.parse(tcCheckDate.text);
        }
        entity.alive = double.parse(tcAlive.text);
        entity.dead = double.parse(tcDead.text);
        entity.harvest = double.parse(tcHarvest.text);
        entity.averageWeight = double.parse(tcAverageWeight.text);
        entity.temperature = double.parse(tcTemperature.text);
        entity.humidity = double.parse(tcHumidity.text);
        entity.notes = tcNotes.text;
        Cage cage = Cage();
        cage.cageId = int.parse(tcCage.text);
        entity.cage = cage;

        Future<String> result = dcController.saveDailyCheck(context, entity);
        result.then((value) => {
              if (value == '')
                {
//            showDialog(
//              context: context,
//              builder: (context) => AlertDialog(
//                title: Text('Notifikasi'),
//                content: Text('Data berhasil disimpan!'),
//                actions: <Widget>[
//                  FlatButton(
//                      onPressed: () => Navigator.pop(context),
//                      child: Text('OK')),
//                ],
//              ),
//            )
                  Navigator.pop(context)
                }
              else
                {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Notifikasi'),
                      content: Text(value),
                      actions: <Widget>[
                        FlatButton(child: Text('OK')),
                      ],
                    ),
                  )
                }
            });
      }
    });
  }
}
