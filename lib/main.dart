import 'package:flutter/material.dart';
void main(){
  runApp(const MaterialApp(
    home: Home(),
  ));
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController childrenController = TextEditingController();
  TextEditingController moneyController = TextEditingController();
  bool isChecked = false;
  String _infoText = "";
  void _calculate(){
    setState(() {
      double children = double.parse(childrenController.text);
      double money = double.parse(moneyController.text);
      double auxilio = 0;
      if(children >= 3 && money <= 2424){
        auxilio = 3636;
      }
      else if(children >= 2){
        if(money <= 1212){
          auxilio = 3030;
        }
        else if(money <= 2424){
          auxilio = 1818;
        }
      }
      if(children >= 1 && isChecked){
        auxilio += 600;
      }
      _infoText = "Auxílio: R\$ $auxilio";
    });
  }
  void _resetFields(){
    _formKey = GlobalKey<FormState>();
    childrenController.text = "";
    moneyController.text = "";
    isChecked = false;
    setState(() {
      _infoText = "";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auxílio", style: TextStyle(fontSize: 35.0, color : Colors.white,),),
        centerTitle: true,
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetFields,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              const Text("Informe os dados da família", textAlign: TextAlign.center, style: TextStyle(fontSize: 25.0, color : Colors.black,),),
              const SizedBox(height: 15),
              TextFormField(
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black, fontSize: 22.0),
                decoration: const InputDecoration(
                  labelText: "Filhos vacinados e estudando:",
                  labelStyle: TextStyle(color: Colors.orange),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 2),
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                ),
                controller: childrenController,
                validator: (value){
                  if(value.toString().isEmpty){
                    return "Digite um valor valido";
                  }
                  if(double.parse(value.toString()) < 0){
                    return "Digite um valor valido";
                  }
                  if(double.parse(value.toString()) == null){
                    return "Digite um valor valido";
                  }
                }
              ),
              const SizedBox(height: 15),
              TextFormField(
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black, fontSize: 21.0),
                decoration: const InputDecoration(
                  prefix: Text("R\$ ", style: TextStyle(color: Colors.black, fontSize: 22.0),),
                  labelText: "Renda Mensal:",
                  labelStyle: TextStyle(color: Colors.orange),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 2),
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                ),
                controller: moneyController,
                  validator: (value){
                    if(value.toString().isEmpty){
                      return "Digite um valor valido";
                    }
                    if(double.parse(value.toString()) < 0){
                      return "Digite um valor valido";
                    }
                    if(double.parse(value.toString()) == null){
                      return "Digite um valor valido";
                    }
                  }
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('Mãe solteira', style: TextStyle(fontSize: 21.0, color : Colors.black,),),
                side: const BorderSide(color: Colors.orange, width: 2),
                activeColor: Colors.orange,
                checkColor: Colors.white,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              //const SizedBox(height: 15),
              //const Text("*Inclua apenas os filhos matriculados em uma escola e que estejam vacinados.", textAlign: TextAlign.justify, style: TextStyle(fontSize: 16.0, color : Colors.black,),),
              //const SizedBox(height: 15),
              ElevatedButton(
                onPressed:() {
                  if(_formKey.currentState!.validate()){
                    _calculate();
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white,),
                child: const Text("Calcular"),
              ),
              const SizedBox(height: 20),
              Text(_infoText, textAlign: TextAlign.center, style: const TextStyle(fontSize: 25.0, color : Colors.black,),),
            ],
          ),
        )
      ),
    );
  }
}