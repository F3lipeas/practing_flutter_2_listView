import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contato> contatos = [];

  @override
  void initState() {
    setState(() {
      contatos.add(Contato(
          nome: "Severino",
          telefone: "(83) 9 999605024",
          tipo: ContatoType.CELULAR));
      contatos.add(Contato(
          nome: "João", telefone: "(83) 9 99961861", tipo: ContatoType.CASA));
      contatos.add(Contato(
          nome: "Maria",
          telefone: "(81) 9 84805024",
          tipo: ContatoType.FAVORITO));
      contatos.add(Contato(
          nome: "John",
          telefone: "(83) 9 1231605024",
          tipo: ContatoType.TRABALHO));
      contatos.add(Contato(
          nome: "Felipe",
          telefone: "(83) 9 999605024",
          tipo: ContatoType.CELULAR));
      contatos.add(Contato(
          nome: "João", telefone: "(83) 9 99961861", tipo: ContatoType.CASA));
      contatos.add(Contato(
          nome: "Maria",
          telefone: "(81) 9 84805024",
          tipo: ContatoType.FAVORITO));
      contatos.add(Contato(
          nome: "John",
          telefone: "(83) 9 1231605024",
          tipo: ContatoType.TRABALHO));


      contatos.sort((a, b) => a.nome.compareTo(b.nome));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            itemBuilder: (context, index) {
              var contato = contatos[index];
              return ListTile(
                leading: CircleAvatar(
                  child: ContatoHelper.getIconByContatoType(contato.tipo),
                  backgroundColor: Colors.blue[100],
                ),
                title: Text(contato.nome),
                subtitle: Text(contato.telefone),
                trailing: IconButton(
                  icon:Icon(Icons.call, color: Colors.red,),
                  onPressed: () => {},
                ),

              );
            },
            separatorBuilder: (context, index) => Divider() ,
            itemCount: contatos
                .length) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class Contato {
  Contato({required this.nome, required this.telefone, required this.tipo});

  String nome;
  String telefone;
  ContatoType tipo;
}

enum ContatoType { CELULAR, TRABALHO, FAVORITO, CASA }

class ContatoHelper{
  static Icon getIconByContatoType(ContatoType tipo){
    switch (tipo){
      case ContatoType.CELULAR:
        return Icon(Icons.phone_android, color: Colors.green[700],);
      case ContatoType.CASA:
        return Icon(Icons.house, color: Colors.purple[600],);
      case ContatoType.FAVORITO:
        return Icon(Icons.star, color: Colors.yellowAccent);
      case ContatoType.TRABALHO:
        return Icon(Icons.work, color: Colors.brown[600],);
    }
  }
}
