import 'package:dsi_app/constants.dart';
import 'package:dsi_app/dsi_widgets.dart';
import 'package:dsi_app/infra.dart';
import 'package:dsi_app/pessoa.dart';
import 'package:flutter/material.dart';

class Professor {

  String codID;
  Pessoa pessoa;

  Professor({this.codID, this.pessoa});


  Professor.fromJson(Map<String, dynamic> json)
      : codID = json['codID'],
        pessoa = Pessoa.fromJson(json['pessoa']);

  ///TIP este método converte o objeto atual para um mapa que representa um
  ///objeto JSON.
  Map<String, dynamic> toJson() =>
    {
      'codID': codID,
      'id':pessoa.id,
    };

} // End class Professor
var professorController = ProfessorController();

class ProfessorController {

  Future<List<Professor>> getAll() async {
    List<Pessoa> professores = await pessoaController.getAll();
    return professores.whereType<Professor>().toList();
  }

  Future<Pessoa> getById(String id) async {
    return pessoaController.getById(id);
  }

  Future<Professor> save(Professor professor) async {
    Pessoa pessoa = await pessoaController.save(professor);

    return pessoa as Professor;
  }

  Future<bool> remove(Professor professor) async {
    return pessoaController.remove(professor);
  }
}

class ListProfessorPage extends StatefulWidget {
  @override
  ListProfessorPageState createState() => ListProfessorPageState();
}
class ListProfessorPageState extends State<ListProfessorPage>{

  Future<List<Professor>> _professor;

  @override
  void initState() {
    super.initState();
    _professor = professorController.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return DsiScaffold(
      title: 'Listagem de Professores',
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => dsiHelper.go(context, '/maintain_professor'),
      ),
      body: FutureBuilder(
          future: _professor,
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator());
            }
            var professores = snapshot.data;
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: professores.length,
              itemBuilder: (context, index) =>
                  _buildListTileProfessor(context, professores[index]),
            );
          }
      ),
    );
  }

  Widget _buildListTileProfessor(context, professor) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        setState(() {
          professorController.remove(professor);
        });
        dsiHelper.showMessage(
          context: context,
          message: '${professor.nome} foi removido.',
        );
      },
      background: Container(
        color: Colors.red,
        child: Row(
          children: <Widget>[
            Constants.boxSmallWidth,
            Icon(Icons.delete, color: Colors.white),
            Spacer(),
            Icon(Icons.delete, color: Colors.white),
            Constants.boxSmallWidth,
          ],
        ),
      ),
      child: ListTile(
        title: Text(professor.nome),
        subtitle: Text('codID. ${professor.codID}'),
        onTap: () => dsiHelper.go(context, "/maintain_professor", arguments: professor),
      ),
    );
  }
}

class MaintainProfessorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Professor professor = dsiHelper.getRouteArgs(context);
    if (professor == null) {
      professor = Professor();
    }

    return DsiBasicFormPage(
      title: 'Professor',
      onSave: () {

        dsiHelper.go(context, '/list_professor');
      },
      body: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: Constants.boxSmallHeight.height,
        children: <Widget>[
          MaintainPessoaBody(professor.pessoa),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'codigo de ID*'),
            validator: (String value) {
              return value.isEmpty ? 'codigo de ID inválido.' : null;
            },
            initialValue: professor.codID,
            onSaved: (newValue) => professor.codID = newValue,
          ),
        ],
      ),
    );
  }
}

