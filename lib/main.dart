// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String infoText = "informe seus Dados";  

  TextEditingController precoController = TextEditingController();
  TextEditingController distanciaController = TextEditingController();
  TextEditingController consumoController = TextEditingController();


  Widget buildTextField(String label, TextEditingController c){
    return TextField(
              decoration: InputDecoration(
                labelText: label, 
                labelStyle: TextStyle(color: Colors.green, fontSize: 20.0),
                border: OutlineInputBorder()
              ),
              style: TextStyle(color: Colors.green, fontSize: 25.0),
              keyboardType: TextInputType.number,
              controller: c,
            );
  }


  //function butto reload
  void _resetFields(){
    setState(() {
    precoController.text = "";
    distanciaController.text = "";
    consumoController.text = "";
    infoText = "informe seus Dados";
      
    });
  }


  //function de calculo
  void _calculate() {
    double preco = double.parse(precoController.text);
    double distancia = double.parse(distanciaController.text);
    double consumo = double.parse(consumoController.text);
    double ck = preco/consumo ;
    double  result = distancia* ck;

     
    setState(() {
      
      infoText = "o preço a gastar é ${result}";
      
    
  
      

    });
  } 

Future<void> _showMyDialog(String text) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(

        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text(text),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("calculador de Custo"),
        centerTitle: true,
        actions:[
          IconButton(icon: Icon(Icons.refresh),onPressed: (){
            _resetFields();
          },)
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch, 
          children:<Widget> [
           
            Icon(Icons.airport_shuttle, size: 170.0, color: Colors.green,),
            buildTextField("Preço Combustivel", precoController),
            Divider(),
            buildTextField("Distância a ser Percorrida", distanciaController),
            Divider(),
            buildTextField("Consumo por litro", consumoController),

            //botão
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  child: Text("calcular", style: TextStyle(color: Colors.white, fontSize: 25.0),),
                  onPressed: (){
                    _calculate();
                    _showMyDialog(infoText);
                  },
                  color: Colors.green,
                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(infoText, style: TextStyle(color: Colors.green, fontSize: 25.0),
              textAlign: TextAlign.center,
              ),
            )
            
          ],
          ),
      ),
      
    );
  }
}