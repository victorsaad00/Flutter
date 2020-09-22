import 'package:dsi_app/pessoa.dart';
import 'Professor.dart';
import 'aluno.dart';
import 'infra.dart';


class Controller {

  Future<List<Pessoa>> getAll() async {

  }

  Future<Pessoa> getById(int id) async {

  }
  Future<Pessoa> getByCPF(String cpf) async {

  }

  Future<Pessoa> save(pessoa) async {

  }

  Future<bool> remove(pessoa) async {

  }
  void validateOnSave(pessoa) async {

  }


}









/*
Future<List<Pessoa>> getAllAluno() async {
  return dsiHelper.getJson<List<Pessoa>>(
    'aluno',
        (jsonMaps) =>
        jsonMaps.map<Aluno>((json) => Aluno.fromJson(json)).toList(),
  );
}

Future<Pessoa> getByIdAluno(int id) async {
  return dsiHelper.getJson<Pessoa>(
    'alunos/$id',
        (json) => Aluno.fromJson(json),
  );
}
Future<Pessoa> getByCPFAluno(String cpf) async {
  var params = {
    'cpf': cpf,
  };
  List<Pessoa> result = await dsiHelper.getJson<List<Pessoa>>(
    'alunos',
        (jsonMaps) =>
        jsonMaps.map<Aluno>((json) => Aluno.fromJson(json)).toList(),
    params,
  );
  return result != null && result.isNotEmpty ? result.first : null;
}

Future<Pessoa> saveAluno(pessoa) async {
  validateOnSaveAluno(pessoa);
  return dsiHelper.putJson(
    'alunos',
    pessoa.id,
        (json) => Aluno.fromJson(json),
    pessoa.toJson(),
  );
}

Future<bool> removeAluno(pessoa) async {
  return dsiHelper.deleteJson(
    'alunos',
    pessoa.id,
  );
}
void validateOnSaveAluno(pessoa) async {
  Pessoa p = await getByCPFAluno(pessoa.cpf);
  if (p != null && p.id != pessoa.id)
    throw Exception('Já existe uma pessoa com o cpf ${pessoa.cpf}.');
}

// Professor
Future<List<Pessoa>> getAllProfessor() async {
  return dsiHelper.getJson<List<Pessoa>>(
    'professores',
        (jsonMaps) =>
        jsonMaps.map<Professor>((json) => Professor.fromJson(json)).toList(),
  );
}

Future<Pessoa> getByIdProfessor(int id) async {
  return dsiHelper.getJson<Pessoa>(
    'professores/$id',
        (json) => Professor.fromJson(json),
  );
}
Future<Pessoa> getByCPFProfessor(String cpf) async {
  var params = {
    'cpf': cpf,
  };
  List<Pessoa> result = await dsiHelper.getJson<List<Pessoa>>(
    'professores',
        (jsonMaps) =>
        jsonMaps.map<Professor>((json) => Professor.fromJson(json)).toList(),
    params,
  );
  return result != null && result.isNotEmpty ? result.first : null;
}

Future<Pessoa> saveProfessor(pessoa) async {
  validateOnSaveAluno(pessoa);
  return dsiHelper.putJson(
    'professores',
    pessoa.id,
        (json) => Professor.fromJson(json),
    pessoa.toJson(),
  );
}

Future<bool> removeProfessor(pessoa) async {
  return dsiHelper.deleteJson(
    'professores',
    pessoa.id,
  );
}
void validateOnSaveProfessor(pessoa) async {
  Pessoa p = await getByCPFAluno(pessoa.cpf);
  if (p != null && p.id != pessoa.id)
    throw Exception('Já existe uma pessoa com o cpf ${pessoa.cpf}.');
}
} // End of controllerPessoa
*/