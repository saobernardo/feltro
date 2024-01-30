List<Map<String, dynamic>> estadoList = [
  {'est_codigo': 1, 'est_nome': 'Acre', 'est_sigla': 'AC'},
  {'est_codigo': 2, 'est_nome': 'Alagoas', 'est_sigla': 'AL'},
  {'est_codigo': 3, 'est_nome': 'Amazonas', 'est_sigla': 'AM'},
  {'est_codigo': 4, 'est_nome': 'Amapá', 'est_sigla': 'AP'},
  {'est_codigo': 5, 'est_nome': 'Bahia', 'est_sigla': 'BA'},
  {'est_codigo': 6, 'est_nome': 'Ceará', 'est_sigla': 'CE'},
  {'est_codigo': 7, 'est_nome': 'Distrito Federal', 'est_sigla': 'DF'},
  {'est_codigo': 8, 'est_nome': 'Espírito Santo', 'est_sigla': 'ES'},
  {'est_codigo': 9, 'est_nome': 'Goiás', 'est_sigla': 'GO'},
  {'est_codigo': 10, 'est_nome': 'Maranhão', 'est_sigla': 'MA'},
  {'est_codigo': 11, 'est_nome': 'Minas Gerais', 'est_sigla': 'MG'},
  {'est_codigo': 12, 'est_nome': 'Mato Grosso do Sul', 'est_sigla': 'MS'},
  {'est_codigo': 13, 'est_nome': 'Mato Grosso', 'est_sigla': 'MT'},
  {'est_codigo': 14, 'est_nome': 'Pará', 'est_sigla': 'PA'},
  {'est_codigo': 15, 'est_nome': 'Paraíba', 'est_sigla': 'PB'},
  {'est_codigo': 16, 'est_nome': 'Pernambuco', 'est_sigla': 'PE'},
  {'est_codigo': 17, 'est_nome': 'Piauí', 'est_sigla': 'PI'},
  {'est_codigo': 18, 'est_nome': 'Paraná', 'est_sigla': 'PR'},
  {'est_codigo': 19, 'est_nome': 'Rio de Janeiro', 'est_sigla': 'RJ'},
  {'est_codigo': 20, 'est_nome': 'Rio Grande do Norte', 'est_sigla': 'RN'},
  {'est_codigo': 21, 'est_nome': 'Rondônia', 'est_sigla': 'RO'},
  {'est_codigo': 22, 'est_nome': 'Roraima', 'est_sigla': 'RR'},
  {'est_codigo': 23, 'est_nome': 'Rio Grande do Sul', 'est_sigla': 'RS'},
  {'est_codigo': 24, 'est_nome': 'Santa Catarina', 'est_sigla': 'SC'},
  {'est_codigo': 25, 'est_nome': 'Sergipe', 'est_sigla': 'SE'},
  {'est_codigo': 26, 'est_nome': 'São Paulo', 'est_sigla': 'SP'},
  {'est_codigo': 27, 'est_nome': 'Tocantins', 'est_sigla': 'TO'}
];

/*Map<String, dynamic> getEstadoById(int id) {
  for(Map<String, dynamic> estado in estadoList){
    if(estado['est_codigo'] == id){
      return estado;
    }
  }
  return null;
}*/

Map<String, dynamic> getEstadoById(int id) {
  return estadoList.elementAt(id);
}
