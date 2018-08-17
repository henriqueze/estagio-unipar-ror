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

//select 2
$(document).ready(function() {
 $("#e1").select2();
 theme: "bootstrap"
 language: "pt-BR"
});

//soma valor da view de item venda
$(document).on('turbolinks:load', function() {

  $('#valor, #qtde').blur(function(){
    var valor = parseFloat($('#valor').val()) || 0;
    var qtde = parseFloat($('#qtde').val()) || 0;

    if(valor == " ") valor = 0;

    var resultado = valor * qtde;
    console.log(resultado);
    $('#valor_total_produto').val(resultado);
  })

});

//calcula margem de lucro
$(document).on('turbolinks:load', function(){

  $('#valor_venda, #valor_compra').blur(function() {
    var vlrVenda = parseFloat($('#valor_venda').val()) || 0;
    var vlrCompra = parseFloat($('#valor_compra').val()) || 0;

    var valor1 = vlrVenda - vlrCompra;
    var valor2 = valor1 * 100;
    var valor3 = valor2 / vlrCompra;

    $('#margem').val(valor3);
  })

/*METODO PARA CALCULAR COM A PORCENTAGEM OU COM O VALOR DEPENDENDO DO CHECKBOX
UTILIZAR UM IF E ELSE
    $('#valor_compra, #margem').blur(function(){
      var valrCompra = $('#valor_compra').val();
      var margem = $('#margem').val();

      var vlr_venda = parseInt(valrCompra) * parseFloat(margem);
      $('#valor_venda').val(vlr_venda);
    })
  }*/

});

$(document).on('turbolinks:load', function() {
  $('.mask_phone').inputmask({mask: "(99) 9999[9]-9999"});
  $('.mask_cpf').inputmask({mask: "999.999.999-99"});
  $('.mask_rg').inputmask({mask: "99.999.999-9"})
  $('.mask_cnpj').inputmask({mask: "99.999.999/9999-99"});
  $('.mask_cep').inputmask({mask: "99999-999"});
});

$(document).submit(function() {

  $('.mask_phone').unmask();
  $('.mask_cpf').unmask();
  $('.mask_rg').unmask();
  $('.mask_cnpj').unmask();
  $('.mask_cep').unmask();

});


