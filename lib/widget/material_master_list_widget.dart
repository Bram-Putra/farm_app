import 'package:farmapp/controller/material_master_list_controller.dart';
import 'package:farmapp/podo/materi.dart';
import 'package:farmapp/widget/material_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MaterialMasterList extends StatefulWidget {
  @override
  _MaterialMasterListState createState() => _MaterialMasterListState();
}

class _MaterialMasterListState extends State<MaterialMasterList> {
  MaterialMasterListController mmlController = MaterialMasterListController();

  void _deleteRow(BuildContext context, int indexX) {
    bool confirmDelete = false;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete'),
        content: Text('Material $indexX will be deleted'),
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
        mmlController.deleteMaterial(context, indexX);
        setState(() {
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mmlController.getListSize(),
      itemBuilder: (context, index) {
        int materialId = mmlController.getMaterialId(index);
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
              title: Text('Material: $materialId'),
              subtitle: Text(mmlController.getMaterialNotes(index)),
              onTap: (){_callMaterialDetail(mmlController.getMaterial(index));},
            ),
          ),
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
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

  void _callMaterialDetail(Materi materialX) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MaterialDetail(materialX)));
  }
}