import 'package:flutter/material.dart';

class MiComponente extends StatelessWidget {
  const MiComponente(
      {super.key,
      required this.inputController,
      required this.lblText,
      required this.inputAlertController,
      required this.ejecutarCodigo,
      required this.mostrarTexto,
      required this.texto});

  final TextEditingController inputController;
  final TextEditingController inputAlertController;
  final String lblText;
  final VoidCallback ejecutarCodigo;
  final Text mostrarTexto;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: Row(
        children: [
          SizedBox(height: 300,),
          Expanded(
            child: TextField(
              autofocus: true,
              controller: inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.abc),
                  hintText: 'Hola estoy aqui',
                  labelText: 'Ingrese los pasos'),
            ),
          ),
          SizedBox(width: 10,),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Icon(Icons.cancel)),
                          Column(
                            children: [
                              TextField(
                                autofocus: true,
                                controller: inputAlertController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    prefixIcon: Icon(Icons.access_alarm),
                                    labelText: lblText,
                                    //hintText: 'Numero'
                                    ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    ejecutarCodigo();
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.amber[900],
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    textStyle: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  child: mostrarTexto)
                            ],
                          ),
                        ],
                        title: Text('Pasos Diarios'),
                        content: Container(
                          height: 10,
                          width: 50,
                        ),
                      );
                    });
              },
              child: Icon(Icons.send)),
              Text(
                texto,
                style: TextStyle(
                    color: Colors.cyan[200],
                    fontFamily: 'Arial',
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
              )
        ],
      ),
    );
  }
}
