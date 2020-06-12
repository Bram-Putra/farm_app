import 'package:farmapp/controller/feeding_controller.dart';
import 'package:farmapp/controller/material_master_list_controller.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/cage.dart';
import 'package:farmapp/podo/feeding.dart';
import 'package:farmapp/podo/feeding_material.dart';
import 'package:farmapp/podo/materi.dart';
import 'package:farmapp/widget/cage_dropdownbutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class FeedingDetail extends StatefulWidget {
  final Feeding feeding;

  FeedingDetail(this.feeding);

  @override
  _FeedingDetailState createState() => _FeedingDetailState();
}

class _FeedingDetailState extends State<FeedingDetail> {
  FeedingController fController = FeedingController();
  MaterialMasterListController mController = MaterialMasterListController();

  final tcFeedingId = TextEditingController();
  final tcFeedingNumber = TextEditingController();
  final tcFeedingDate = TextEditingController();
  final tcNotes = TextEditingController();
  final tcCage = TextEditingController();
  List<Materi> materials = [];
  List<TextEditingController> tcQty = [];

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
              child: Text('Confirm')),
          FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel')),
        ],
      ),
    ).then((value) {
      confirmSave = value;
      if (confirmSave) {
        Feeding entity = Feeding();
        if(tcFeedingId.text!=''){
          entity.feedingId = int.parse(tcFeedingId.text);
        }
        entity.feedingNumber = tcFeedingNumber.text;
        if(tcFeedingDate.text!='') {
          var df = DateFormat("dd MMM yyyy");
          entity.feedingDate = df.parse(tcFeedingDate.text);
        }
        entity.notes = tcNotes.text;
        Cage cage = Cage();
        cage.cageId = int.parse(tcCage.text);
        entity.cage = cage;

        for(int i=0; i<materials.length; i++){
          FeedingMaterial m = FeedingMaterial();
          m.orderNumber = (i+1);
          m.material = materials[i];
          m.quantity = double.parse(tcQty[i].text);
          entity.materials.add(m);
        }

        Future<String> result = fController.saveFeeding(context, entity);
        result.then((value) => {
          if(value==''){
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
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Notifikasi'),
                content: Text(value),
                actions: <Widget>[
                  FlatButton(
                      child: Text('OK')),
                ],
              ),
            )
          }

        });

//        setState(() {
//        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Future<List> list = mController.selectMaterials();
    list.then((value) => {
      if(value.length>0){
        for(int i=0; i<value.length; i++){
          materials.add(value[i]),
          tcQty.add(new TextEditingController()),
          tcQty[i].text = '0'
        }
      },
      setState(() {})
    });
  }

  @override
  Widget build(BuildContext context) {
    var df = DateFormat("dd MMM yyyy");
    if(widget.feeding!=null){
      var nf = NumberFormat("#,###");
      var nfd = NumberFormat("#,###.##");
      tcFeedingId.text = widget.feeding.feedingId.toString();
      tcFeedingNumber.text = widget.feeding.feedingNumber;
      
      tcFeedingDate.text = df.format(widget.feeding.feedingDate);
      tcNotes.text = widget.feeding.notes;
      tcCage.text = widget.feeding.cage.cageId.toString();

      for(int i=0; i<widget.feeding.materials.length; i++){
        if(tcQty.length>0) {
          tcQty[i].text = widget.feeding.materials[i].quantity.toString();
        }
      }
    } else {
      tcFeedingDate.text = df.format(DateTime.now());
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF455A64),
        title: Text(app_title),
      ),
      body: Container(
        color: const Color(0xFFCFD8DC),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListTile(
              title: Text('Pemberian Material'),
              subtitle: Text('#'+tcFeedingNumber.text+' :: '+tcFeedingDate.text),
            ),
//            Text(
//              tcCheckDate.text
//            ),
            CageDropdownButton(tcCage: tcCage),
            TextFormField(
              decoration: InputDecoration(labelText: 'Notes'),
              controller: tcNotes,
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: materials.length,
                  itemBuilder: (context, index){
                    return TextFormField(
                      decoration: InputDecoration(labelText: materials[index].materialName),
                        style: TextStyle(
                          height: 1.8
                        ),
                        controller: tcQty[index]
                      );
                  },
                )
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () {
                _save();
              },
              color: Colors.teal,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tcFeedingId.dispose();
    tcFeedingNumber.dispose();
    tcFeedingDate.dispose();
    tcCage.dispose();
    tcNotes.dispose();
    super.dispose();
  }
}
