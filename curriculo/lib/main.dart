import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Curriculo(),
  debugShowCheckedModeBanner: false,));
}

class Curriculo extends StatefulWidget {
  const Curriculo({super.key});

  @override
  State<Curriculo> createState() => _CurriculoState();
}

class _CurriculoState extends State<Curriculo> {
  //estou dizendo que minha classe é uma tela através do StatefulWidget
  List<Info> infos = [
      Info(
        'Emanuel Martins',
        '3° Ano do Ensino Médio Técnico em Informática',
        'Distro Linux personalizado usando Debian Live Build para compilar',
        'Professor Orientador: "Emanuel é um aluno dedicado e comprometido, sempre buscando aprender mais e se destacar em suas atividades acadêmicas."'
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currículo'),
        leading: FlutterLogo(
          style: FlutterLogoStyle.stacked,
          size: 40,
        ),
        actions: [IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddInfo())).then((info) {

            setState((){
              infos.add(info);
            });

            debugPrint('Escolaridade: ${info.escolaridade.toString()}, Projetos: ${info.projetos.toString()}, Recomendações: ${info.recomendacoes.toString()}');
          });
        }, icon: Icon(Icons.add))]
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80.0),
        child: 
          ListView(
            children: [

              SizedBox(
                height: 190.0,
                width: 190.0,
                child: 
                  FittedBox(
                    fit: BoxFit.contain,
                    child:
                      CircleAvatar(
                        backgroundImage: AssetImage('images/cachorro.jpg'),
                          radius: 75,
                  
                ))),
              Center(
                child: Text(
                  'Emanuel Martins',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),  

              SizedBox(
                height: 8.0,
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Escolaridade(infos: infos,
                    Excluir: (item) {
                      setState(() {
                        infos.remove(item);
                      });
                    })),
                  );
                },
                child: Text('Escolaridade'),

              ),

              SizedBox(
                height: 8.0,
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Projetos(infos: infos,
                    Excluir: (item) {
                      setState(() {
                        infos.remove(item);
                      });
                    })),
                  );
                },
                child: Text('Projetos'),
              ),

              SizedBox(
                height: 8.0,
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Recomedacoes(infos: infos,
                    Excluir: (item) {
                      setState(() {
                        infos.remove(item);
                      });
                    })),
                  );
                },
                child: Text('Recomendações'),
              ),

            ]
        ),
      ),
    );
  }
}

class Escolaridade extends StatelessWidget {
  final List<Info> infos;
  const Escolaridade({super.key, required this.infos, required this.Excluir});
  final Function(Info) Excluir;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolaridade'),
      ),
      body: Center(
        child:
        ListView.builder(
          itemCount: infos.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: IconButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Detalhes(infos[index])),
                  )
                } 
              , icon: Icon(Icons.info_rounded)),

              title:
               Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Nome: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '${infos[index].nome}'),
                    const TextSpan(
                      text: ' - Escolaridade: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '${infos[index].escolaridade}'),
                  ],
                ), // Mantém o alinhamento que você estava usando
              ),
              
              trailing: IconButton(
                onPressed: () => {
                  showDialog(       //Widget diferente
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Excluir Informação'),
                      content: Text('Tem certeza que deseja excluir esta informação? Você será redirecionado para a tela inicial.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Excluir(infos[index]);
                            Navigator.pop(context);

                            Navigator.pop(
                              context,
                              MaterialPageRoute(builder: (context) => Curriculo()),);
                          },
                          child: Text('Sim'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Não'),
                        ),
                      ],
                    )
                  )
                },
                icon: Icon(Icons.delete, color: Colors.red,),
              ),
            );
          },
        )
      ),
    );
  }
}

class Projetos extends StatelessWidget {
  final List<Info> infos;
  const Projetos({super.key, required this.infos, required this.Excluir});
  final Function(Info) Excluir;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projetos'),
      ),
      body: Center(
        child: 
        ListView.builder(
          itemCount: infos.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: IconButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Detalhes(infos[index])),
                  )
                } 
              , icon: Icon(Icons.info_rounded)),

              title:
               Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Nome: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '${infos[index].nome}'),
                    const TextSpan(
                      text: ' - Projetos: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '${infos[index].projetos}'),
                  ],
                ), // Mantém o alinhamento que você estava usando
              ),

              trailing: IconButton(
                onPressed: () => {
                  showDialog(       //Widget diferente
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Excluir Informação'),
                      content: Text('Tem certeza que deseja excluir esta informação? Você será redirecionado para a tela inicial.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Excluir(infos[index]);
                            Navigator.pop(context);

                            Navigator.pop(
                              context,
                              MaterialPageRoute(builder: (context) => Curriculo()),);
                          },
                          child: Text('Sim'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Não'),
                        ),
                      ],
                    )
                  )
                },
                icon: Icon(Icons.delete, color: Colors.red,),
              ),
            );
          },
        )
      ),
    );
  }
}

class Recomedacoes extends StatelessWidget {
  final List<Info> infos;
  const Recomedacoes({super.key, required this.infos, required this.Excluir});
  final Function(Info) Excluir;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Recomendações'),
      ),
      body: Center(
        child: 
        ListView.builder(
          itemCount: infos.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: IconButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Detalhes(infos[index])),
                  )
                } 
              , icon: Icon(Icons.info_rounded)),

              title:
               Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Nome: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '${infos[index].nome}'),
                    const TextSpan(
                      text: ' - Recomendações: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '${infos[index].recomendacoes}'),
                  ],
                ), // Mantém o alinhamento que você estava usando
              ),

              trailing: IconButton(
                onPressed: () => {
                  showDialog(       //Widget diferente
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Excluir Informação'),
                      content: Text('Tem certeza que deseja excluir esta informação? Você será redirecionado para a tela inicial.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Excluir(infos[index]);
                            Navigator.pop(context);

                            Navigator.pop(
                              context,
                              MaterialPageRoute(builder: (context) => Curriculo()),);
                          },
                          child: Text('Sim'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Não'),
                        ),
                      ],
                    )
                  )
                },
                icon: Icon(Icons.delete, color: Colors.red,),
              ),
            );
          },
        )
      )
    );
  }
}

class Info {
  String nome;
  String escolaridade;
  String projetos;
  String recomendacoes;

  Info(this.nome, this.escolaridade, this.projetos, this.recomendacoes);
}

class AddInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController nome = TextEditingController();
    TextEditingController escolaridade = TextEditingController();
    TextEditingController projetos = TextEditingController();
    TextEditingController recomendacoes = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Informações'),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45.0),
        child:
          ListView(
            children: [
              TextField(
                controller: nome,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
              ),

              TextField(
                controller: escolaridade,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Escolaridade',
                ),
              ),

              TextField(
                controller: projetos,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Projetos',
                ),
              ),

              TextField(
                controller: recomendacoes,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Recomendações',
                ),
              ),

              ElevatedButton(onPressed: () {
                if(nome.text != '' && escolaridade.text != '' && projetos.text != '' && recomendacoes.text != '') {
                  Info info = Info(nome.text, escolaridade.text, projetos.text, recomendacoes.text);
                  Navigator.pop(context, info);
                  
                } else {
                  debugPrint('Preencha todos os campos');
                }
              },
              child: Text('Salvar'))
            ]
          ) 
      ),
    );
  }
}

class Detalhes extends StatelessWidget {
  Info infos;

  Detalhes(this.infos);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Currículo'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0),
        child: 
          ListView(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Nome: ', 
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '${infos.nome}'),
                  ],
                ),
                textAlign: TextAlign.center, // Mantém o alinhamento que você estava usando
              ),
              const Divider(
                indent: 60,
                endIndent: 60,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Escolaridade: ', 
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '${infos.escolaridade}'),
                  ],
                ),
                textAlign: TextAlign.center, // Mantém o alinhamento que você estava usando
              ),
              const Divider(
                indent: 60,
                endIndent: 60,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Projetos: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '${infos.projetos}'),
                  ],
                ),
                textAlign: TextAlign.center, // Mantém o alinhamento que você estava usando
              ),
              const Divider(
                indent: 60,
                endIndent: 60,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Recomendações: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '${infos.recomendacoes}'),
                  ],
                ),
                textAlign: TextAlign.center, // Mantém o alinhamento que você estava usando
              ),
            ]
          )
      ),
    );
  }

}