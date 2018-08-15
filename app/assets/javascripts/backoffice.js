//= require bootstrap_sb_admin_base_v2
//= require notifyjs
//= require jquery.inputmask
//= require jquery.inputmask.extensions
//= require jquery.inputmask.numeric.extensions
//= require jquery.inputmask.date.extensions


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

$(document).on('turbolinks:load', function() {

    $('#valor, #qtde').blur(function(){
      var valor = $('#valor').val();
      var qtde = $('#qtde').val();

      if(valor == " ") valor = 0;

      var resultado   = parseInt(valor) + parseInt(qtde);
      $('#valor_total_produto').val(resultado);
    })

  });

$(document).on('turbolinks:load', function() {
  $('.mask_phone').inputmask({mask: "(99) 9999[9]-9999"});
  $('.mask_cpf').inputmask({mask: "999.999.999-99"});
  $('.mask_rg').inputmask({mask: "99.999.999-9"})
  $('.mask_cnpj').inputmask({mask: "99.999.999/9999-99"});
  $('.mask_cep').inputmask({mask: "99999-999"});
});


