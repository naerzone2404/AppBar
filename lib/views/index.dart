import 'package:flutter/material.dart';
import 'package:mi_aplicativo_movil/views/mycomponents.dart';

class MiIndex extends StatefulWidget {
  const MiIndex({super.key});

  @override
  State<MiIndex> createState() => _MiIndexState();
}

class _MiIndexState extends State<MiIndex> {
  final List<double> _DataAlert = [];
  final TextEditingController _insertAlert = TextEditingController();
  final TextEditingController _insertControllerIndex = TextEditingController();
  String respuesta = '';

  void _insertarData(){
    setState(() {
      double obtenerInfo = double.parse(_insertAlert.text);
      _DataAlert.add(obtenerInfo);
      _insertAlert.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue[600],
          title: Text(
            'Bienvenido',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          )),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          MiComponente(
            inputController: _insertControllerIndex,
            lblText: 'Numero',
            inputAlertController: _insertAlert,
            ejecutarCodigo: (() => _insertarData()),
            mostrarTexto: Text('Confirmar'),
            texto: respuesta.toString(),
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: DataTable(
                      columns: [
                DataColumn(
                    label: Text(
                  'Fecha',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  'Nros Pasos',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ))
              ],
                      rows: _DataAlert.map((pasos) {
                        return DataRow(cells: [
                          DataCell(Text('${DateTime.now()}')),
                          DataCell(Text(pasos.toStringAsFixed(1))),
                        ]);
                      }).toList())))
        ],
      ),
    );
  }
}
