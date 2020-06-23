import 'package:farmapp/controller/mutasi_controller.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/cage.dart';
import 'package:farmapp/podo/mutasi.dart';
import 'package:farmapp/widget/cage_dropdownbutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MutasiDetail extends StatefulWidget {
  final Mutasi mutasi;

  MutasiDetail(this.mutasi);

  @override
  _MutasiDetailState createState() => _MutasiDetailState();
}

class _MutasiDetailState extends State<MutasiDetail> {
  MutasiController mController = MutasiController();
  var df = DateFormat("dd MMM yyyy");

  final tcMovementId = TextEditingController();
  final tcMovementNumber = TextEditingController();
  final tcMovementDate = TextEditingController();
  final tcSource = TextEditingController();
  final tcDestination = TextEditingController();
  final tcQuantity = TextEditingController();

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
        Mutasi m = Mutasi();
        if (tcMovementId.text != '') {
          m.movementId = int.parse(tcMovementId.text);
        }
        m.movementNumber = tcMovementNumber.text;
        if (tcMovementDate.text != '') {
          var df = DateFormat("dd MMM yyyy");
          m.movementDate = df.parse(tcMovementDate.text);
        }
        Cage source = Cage();
        source.cageId = int.parse(tcSource.text);
        m.source = source;
        Cage destination = Cage();
        destination.cageId = int.parse(tcDestination.text);
        m.destination = destination;
        m.quantity = double.parse(tcQuantity.text);

        Future<String> result = mController.saveMutasi(context, m);
        result.then((value) => {
              if (value == '')
                {Navigator.pop(context)}
              else
                {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Notifikasi'),
                      content: Text(value),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('OK'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                }
            });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.mutasi != null) {
      var nf = NumberFormat("#,###");
      tcMovementId.text = widget.mutasi.movementId.toString();
      tcMovementNumber.text = widget.mutasi.movementNumber;
      tcMovementDate.text = df.format(widget.mutasi.movementDate);
      tcQuantity.text = nf.format(widget.mutasi.quantity);
      tcSource.text = widget.mutasi.source.cageId.toString();
      tcDestination.text = widget.mutasi.destination.cageId.toString();
    } else {
      tcMovementDate.text = df.format(DateTime.now());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_primary_dark,
        title: ListTile(
          leading: Icon(
            icon_mutasi,
            color: color_appbar_icon,
          ),
          title: Text(
            'Mutasi',
            style: textstyle_appbar,
          ),
        ),
      ),
      body: Container(
        color: color_primary_light,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            ListTile(
              title: Text('Inspeksi Harian'),
              subtitle:
                  Text('#' + tcMovementNumber.text + ' :: ' + tcMovementDate.text),
            ),
            Text('Dari kandang:'),
            CageDropdownButton(tcCage: tcSource),
            Text('Ke kandang:'),
            CageDropdownButton(tcCage: tcDestination),
            TextFormField(
              decoration: InputDecoration(labelText: 'Quantity'),
              controller: tcQuantity,
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
    tcMovementId.dispose();
    tcMovementNumber.dispose();
    tcMovementDate.dispose();
    tcSource.dispose();
    tcDestination.dispose();
    tcQuantity.dispose();
    super.dispose();
  }
}
