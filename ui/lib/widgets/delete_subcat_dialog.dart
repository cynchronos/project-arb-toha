import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui/domain/material_alat_upah/src/delete_material.dart';
import 'package:ui/providers/delete_provider.dart';

Future deleteMaterialDialog(BuildContext context) {
  final deleteTarget =
      Provider.of<DeleteProvider>(context, listen: false).subKategoriTarget;
  print(deleteTarget);
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('ingin menghapus item ?'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Delete'),
            onPressed: () {
              deleteMaterial(deleteTarget);
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
