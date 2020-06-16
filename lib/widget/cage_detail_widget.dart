import 'package:farmapp/controller/main_controller.dart';
import 'package:farmapp/controller/cage_detail_controller.dart';
import 'package:farmapp/podo/barn_constant.dart';
import 'package:farmapp/podo/cage.dart';
import 'package:farmapp/podo/group_category.dart';
import 'package:farmapp/podo/livestock_type.dart';
import 'package:farmapp/widget/group_category_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'livestock_type_dropdown_widget.dart';

class CageDetail extends StatefulWidget {
  final Cage cage;
  const CageDetail(this.cage);
  @override
  _CageDetailState createState() => _CageDetailState();
}

class _CageDetailState extends State<CageDetail> {
  CageDetailController _cageDetailController = CageDetailController();

  final tcCageId = TextEditingController();
  final tcTag = TextEditingController();
  final tcSize = TextEditingController();
  final tcDrinkingCup = TextEditingController();
  final tcFeedingTray = TextEditingController();
  final tcFan = TextEditingController();
  final tcNotes = TextEditingController();
  final tcRegion = TextEditingController();
  final tcFarm = TextEditingController();
  final tcUnit = TextEditingController();
  final tcLivestock = TextEditingController();

  void _save() {
    bool confirmSave = false;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Save'),
        content: Text('Save data?'),
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
        Cage cage = Cage();
        print(tcCageId.text);
        cage.cageId = tcCageId.text==''? null: int.parse(tcCageId.text);
        cage.tag = tcTag.text;
        GroupCategory region = GroupCategory();
        region.groupCategoryId = int.parse(tcRegion.text);
        cage.region = region;
        GroupCategory farm = GroupCategory();
        farm.groupCategoryId = int.parse(tcFarm.text);
        cage.farm = farm;
        GroupCategory unit = GroupCategory();
        unit.groupCategoryId = int.parse(tcUnit.text);
        cage.unit = unit;
        cage.size = double.parse(tcSize.text);
        cage.drinkingCup = int.parse(tcDrinkingCup.text);
        cage.feedingTray = int.parse(tcFeedingTray.text);
        cage.fan = int.parse(tcFan.text);
        cage.notes = tcNotes.text;
        LivestockType livestock= LivestockType();
        livestock.livestockId = int.parse(tcLivestock.text);
        cage.livestockType = livestock;

        _cageDetailController.saveCage(context, cage);
        setState(() {
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if(widget.cage!=null){
      tcCageId.text = widget.cage.cageId.toString();
      tcTag.text = widget.cage.tag;
      tcSize.text = widget.cage.size.toString();
      tcDrinkingCup.text = widget.cage.drinkingCup.toString();
      tcFeedingTray.text = widget.cage.feedingTray.toString();
      tcFan.text = widget.cage.fan.toString();
      tcNotes.text = widget.cage.notes;
      tcRegion.text = widget.cage.region.groupCategoryId.toString();
      tcFarm.text = widget.cage.farm.groupCategoryId.toString();
      tcUnit.text = widget.cage.unit.groupCategoryId.toString();
      tcLivestock.text = widget.cage.livestockType.livestockId.toString();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_primary_dark,
        title: ListTile(
          leading: Icon(
            icon_kandang,
            color: Colors.white,
          ),
          title: Text(
            'Kandang',
            style: appbar_textstyle,
          ),
        ),
      ),
      body: Container(
        color: color_primary_light,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Container(
              height: preferred_height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Nama Kandang'),
                  initialValue: tcTag.text,
                  enabled: false,
                ),
              ),
            ),
            GroupCategoryDropdown(tcRegion: this.tcRegion, tcFarm: this.tcFarm, tcUnit: this.tcUnit),
            Container(
              height: preferred_height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Tag'),
                  controller: tcTag,
                ),
              ),
            ),
            Container(
              height: preferred_height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Size'),
                  controller: tcSize,
                ),
              ),
            ),
            Container(
              height: preferred_height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Drinking Cup'),
                  controller: tcDrinkingCup,
                ),
              ),
            ),
            Container(
              height: preferred_height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Feeding Tray'),
                  controller: tcFeedingTray,
                ),
              ),
            ),
            Container(
              height: preferred_height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Fan'),
                  controller: tcFan,
                ),
              ),
            ),
            Container(
              height: preferred_height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Notes'),
                  controller: tcNotes,
                ),
              ),
            ),
            LivestockTypeDropdown(tcLivestockType: tcLivestock,),
            SizedBox(height: 10.0,),
            ButtonTheme(
              height: raised_button_height,
              child: RaisedButton(
                onPressed: () {
                  _save();
                },
                color: color_raised_button,
                child: Text('Save', style: TextStyle(fontSize: raised_button_font_size, color: color_raised_button_text),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tcCageId.dispose();
    tcTag.dispose();
    tcSize.dispose();
    tcDrinkingCup.dispose();
    tcFeedingTray.dispose();
    tcFan.dispose();
    tcNotes.dispose();
    tcRegion.dispose();
    tcFarm.dispose();
    tcUnit.dispose();
    tcLivestock.dispose();
    super.dispose();
  }
}
