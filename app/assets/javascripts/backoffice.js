//= require bootstrap_sb_admin_base_v2
//= require notifyjs


function exibir_ocultar(val) {
  if(val.value == 'Fisica') {
    document.getElementById('pes_juridica').style.display = 'none';
    document.getElementById('pes_fisica').style.display = 'block';
  }
  else if(val.value == 'Juridica') {
    document.getElementById('pes_juridica').style.display = 'block';
    document.getElementById('pes_fisica').style.display = 'none';
  }
  else{
    document.getElementById('pes_juridica').style.display = 'none';
    document.getElementById('pes_fisica').style.display = 'none';
  }
}

function soma(){
  var qtd = document.getElementById('quantidade').value;
  var vlr = document.getElementById('valor').value;
  document.getElementById('valor_total_produto').value = qtd * vlr;

  console.log("nada");
};

$(document).ready(function() {
 $("#e1").select2();
  theme: "bootstrap"
  language: "pt-BR"
});


