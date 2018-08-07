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
};

$(document).on('turbolinks:load', function() {

  var fone = $('#mask_phone').find('input');
  var cpf = $('#mask_cpf').find('input');

  cpf.inputmask("999.999.999-99")
  fone.inputmask("(99) 9999-9999[9]");
  //Nono digito
  fone.blur(function(event){
    if($(this).val().length == 15){ // Celular com 9 dígitos + 2 dígitos DDD e 4 da máscara
        $('#fone').inputmask('(00) 00000-0009');
      } else {
        $('#fone').inputmask('(00) 0000-00009');
      }
    });


  $( ".cidade" ).select2({
      theme: "bootstrap"
  });





});


