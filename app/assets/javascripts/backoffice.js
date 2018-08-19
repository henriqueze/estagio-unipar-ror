//= require bootstrap_sb_admin_base_v2
//= require notifyjs
//= require jquery.inputmask
//= require jquery.inputmask.extensions
//= require jquery.inputmask.numeric.extensions
//= require jquery.inputmask.date.extensions
//= require DataTables
//= require bootbox

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

$('table').DataTable( {
  language: {
    "sEmptyTable": "Nenhum registro encontrado",
    "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
    "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
    "sInfoFiltered": "(Filtrados de _MAX_ registros)",
    "sInfoPostFix": "",
    "sInfoThousands": ".",
    "sLengthMenu": "_MENU_ resultados por página",
    "sLoadingRecords": "Carregando...",
    "sProcessing": "Processando...",
    "sZeroRecords": "Nenhum registro encontrado",
    "sSearch": "Pesquisar",
    "oPaginate": {
      "sNext": "Próximo",
      "sPrevious": "Anterior",
      "sFirst": "Primeiro",
      "sLast": "Último"
    },
    "oAria": {
      "sSortAscending": ": Ordenar colunas de forma ascendente",
      "sSortDescending": ": Ordenar colunas de forma descendente"
    },
    "select": {
      "rows": {
        "_": "Selecionado %d linhas",
        "0": "Nenhuma linha selecionada",
        "1": "Selecionado 1 linha"
      }
    }
  }
});

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

  $('#valor_venda, #valor_compra').blur(function() {
    var vlrVenda = parseFloat($('#valor_venda').val()) || 0;
    var vlrCompra = parseFloat($('#valor_compra').val()) || 0;

    var valor1 = vlrVenda - vlrCompra;
    var valor2 = valor1 * 100;
    var valor3 = valor2 / vlrCompra;

    $('#margem').val(valor3);
  })

  $('.mask_celphone').inputmask({mask: "(99) 9999[9]-9999"});
  $('.mask_phone').inputmask({mask: "(99) 9999-9999"});
  $('.mask_cpf').inputmask({mask: "999.999.999-99"});
  $('.mask_rg').inputmask({mask: "99.999.999-9"});
  $('.mask_cnpj').inputmask({mask: "99.999.999/9999-99"});
  $('.mask_ie').inputmask({mask: "99999999-99"})
  $('.mask_cep').inputmask({mask: "99999-999"});

});

/*//calcula margem de lucro
$(document).on('turbolinks:load', function(){



METODO PARA CALCULAR COM A PORCENTAGEM OU COM O VALOR DEPENDENDO DO CHECKBOX
UTILIZAR UM IF E ELSE
    $('#valor_compra, #margem').blur(function(){
      var valrCompra = $('#valor_compra').val();
      var margem = $('#margem').val();

      var vlr_venda = parseInt(valrCompra) * parseFloat(margem);
      $('#valor_venda').val(vlr_venda);
    })
  }

});*/


$('#btn_sub').click(function() {
  $('.mask_celphone').inputmask('remove');
  $('.mask_phone').inputmask('remove');
  $('.mask_cpf').inputmask('remove');
  $('.mask_rg').inputmask('remove');
  $('.mask_cnpj').inputmask('remove');
  $('.mask_cep').inputmask('remove');

});

/* Sobrescreve  data-confirm do Rails */
$.rails.allowAction = function(element) {
  var message = element.attr('data-confirm');
  if (!message) { return true; }

  var opts = {
    title: "Confirmação",
    message: message,
    buttons: {
      confirm: {
        label: 'Sim',
        className: 'btn-success'
      },
      cancel: {
        label: 'Não',
        className: 'btn-danger'
      }
    },
    callback: function(result) {
      if (result) {
        element.removeAttr('data-confirm');
        element.trigger('click.rails')
      }
    }
  };

  bootbox.confirm(opts);

  return false;
}


