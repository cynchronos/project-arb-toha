import 'package:flutter/material.dart';
import 'package:ui/pages/material_alat_upah/input_field.dart';

class MaterialForm extends StatelessWidget {
  MaterialForm({super.key});

  final TextEditingController kategoriController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController satuanController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController keteranganController = TextEditingController();

  // _handleFormSubmission() {
  //   final kategori = kategoriController.text;
  //   final nama = namaController.text;
  //   final satuan = satuanController.text;
  //   final harga = hargaController.text;
  //   final area = areaController.text;
  //   final keterangan = keteranganController.text;

  //   final materialModel = MaterialModel(
  //     kategori: kategori,
  //     nama: nama,
  //     satuan: satuan,
  //     harga: harga,
  //     area: area,
  //     keterangan: keterangan,
  //   );
  //   return materialModel;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 460,
        child: Column(
          children: [
            MaterialInputField(
              label: 'Kategori',
              controller: kategoriController,
            ),
            MaterialInputField(
              label: 'Nama',
              controller: namaController,
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: MaterialInputField(
                      label: 'Satuan',
                      controller: satuanController,
                    )),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                    flex: 2,
                    child: MaterialInputField(
                      label: 'harga',
                      controller: hargaController,
                    ))
              ],
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: MaterialInputField(
                      label: 'Area',
                      controller: areaController,
                    )),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                    flex: 2,
                    child: MaterialInputField(
                      label: 'Keterangan',
                      controller: keteranganController,
                    ))
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 14),
                child: SizedBox(
                  height: 36,
                  width: 128,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text('add item'),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
