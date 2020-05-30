import 'package:farmapp/controller/cage_master_list_controller.dart';
import 'package:farmapp/podo/cage.dart';
import 'package:farmapp/widget/cage_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CageMasterList extends StatefulWidget {
  @override
  _CageMasterListState createState() => _CageMasterListState();
}

class _CageMasterListState extends State<CageMasterList> {
  CageMasterListController cmlController = CageMasterListController();

  void _deleteRow(BuildContext context, int indexX) {
    bool confirmDelete = false;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete'),
        content: Text('Kandang $indexX will be deleted'),
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
      confirmDelete = value;
      if (confirmDelete) {
        cmlController.deleteCage(context, indexX);
        setState(() {
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cmlController.getListSize(),
      itemBuilder: (context, index) {
        int cageId = cmlController.getCageId(index);
        return Slidable(
          actionPane: SlidableDrawerActionPane(),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFCFD8DC),
              border: Border(
                bottom: BorderSide(
                    color: const Color(0xFFBDBDBD),
                    width: 1.0,
                    style: BorderStyle.solid),
              ),
            ),
            child: ListTile(
              title: Text('Kandang: $cageId'),
              subtitle: Text(cmlController.getCageNotes(index)),
              onTap: () {
                _callCageDetail(cmlController.getCage(index));
              },
            ),
          ),
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Delete',
              color: const Color(0xFFFF5252),
              icon: Icons.delete,
              onTap: () {
                _deleteRow(context, index);
              },
            ),
          ],
        );
      },
    );
  }

  void _callCageDetail(Cage cageX) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CageDetail(cageX)));
  }
}
