import 'package:dsi_app/constants.dart';
import 'package:dsi_app/dsi_widgets.dart';
import 'package:dsi_app/infra.dart';
import 'package:dsi_app/pessoa.dart';
import 'package:flutter/material.dart';

import 'dsi_widgets.dart';
import 'pessoa.dart';


class Professor extends Pessoa {

    String codID;

    //Construtor da classe Professor.
    Professor({cpf, nome, endereco, this.codID})
        : super(cpf: cpf, nome: nome, endereco: endereco);

    Professor.fromJson(Map<String, dynamic> json)
        : codID = json['codID'],
          super.fromJson(json);

    ///TIP este método converte o objeto atual para um mapa que representa um
    ///objeto JSON.
    Map<String, dynamic> toJson() => super.toJson()
      ..addAll({
        'codID': codID,
      });

} // End class Professor


var professorController = ProfessorController();

class ProfessorController{
    List<Professor> getAll(){
      return pessoaController.getAll().whereType<Professor>().toList();
    }
    Professor save(professor) {
      return pessoaController.save(professor);
    }

    bool remove(professor) {
      return pessoaController.remove(professor);
    }
} // End class ProfessorController


class ListProfessorPage extends StatefulWidget {
    @override
    ListProfessorPageState createState() => ListProfessorPageState();
}

class ListProfessorPageState extends State<ListProfessorPage>{

    List<Professor> _professor = professorController.getAll();

    @override
    Widget build(BuildContext context) {
    return DsiScaffold(
      title: 'Listagem de Professores',
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => dsiHelper.go(context, '/maintain_professor'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: _professor.length,
        itemBuilder: _buildListTileProfessor,
      ),
    );
  }

    Widget _buildListTileProfessor(context, index) {
      var professor = _professor[index];
      return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          setState(() {
            professorController.remove(professor);
            _professor.remove(index);
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
        professorController.save(professor);
        dsiHelper.go(context, '/list_professor');
      },
      body: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: Constants.boxSmallHeight.height,
        children: <Widget>[
          MaintainPessoaBody(professor),
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