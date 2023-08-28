import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        // widget do material, pede topo, meio, e fundo.
        appBar: AppBar(
          leading: Container(),
          title: Text('Tarefas'),
        ),
        //esse widget permite a inserção do scrow, e também não precisa de alinhamento,
        body: ListView(
          children: [
            Task(
                'Aprender Flutter',
                'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                3),
            Task(
                "Andar de bike",
                "https://images.pexels.com/photos/7936392/pexels-photo-7936392.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                2),
            Task(
                "Meditar",
                "https://images.pexels.com/photos/6298293/pexels-photo-6298293.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                5),
            Task(
                "Ler",
                "https://images.pexels.com/photos/3747163/pexels-photo-3747163.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                4),
            Task(
                "Jogar",
                "https://images.pexels.com/photos/9071466/pexels-photo-9071466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                1),
          ],
        ),
      ),
    );
  }
}

//criando um widget, para repetir as tarefas, sem copicola do código
class Task extends StatefulWidget {
  final String taskName; //criando um parametro para alterar o nome da tarefa
  final String foto;
  final int dificuldade;

  const Task(this.taskName, this.foto, this.dificuldade, {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel =
      0; //tem que ser antes do override para que o código não seja reescrito, voltando o valor sempre que executa

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black26,
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(   //widget que permite a edição das imagens
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            widget.foto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 200,
                              child: Text(
                                widget.taskName,
                                style: TextStyle(
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 1)
                                    ? Colors.deepPurple
                                    : Colors.deepPurple[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 2)
                                    ? Colors.deepPurple
                                    : Colors.deepPurple[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 3)
                                    ? Colors.deepPurple
                                    : Colors.deepPurple[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 4)
                                    ? Colors.deepPurple
                                    : Colors.deepPurple[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 5)
                                    ? Colors.deepPurple
                                    : Colors.deepPurple[100],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 70,
                        width: 64,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                nivel++;
                              });
                              print(nivel);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.arrow_drop_up),
                                Text(
                                  'UP',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.dificuldade > 0)
                              ? (nivel / widget.dificuldade) / 10
                              : 1,
                        ),
                        width: 208,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Nível: $nivel",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
