
var mask = function() {
  $('.cpf').mask("000.000.000-00", {placeholder: "000.000.000-00"});
  $('.cnpj').mask("00.000.000/0000-00", {placeholder: "00.000.000/0000-00"});

  $('.date').mask("00/00/0000", {placeholder: "__/__/____"});
  $('.hour').mask("00:00", {placeholder: "00:00"});
  $('.cep').mask("00000-000", {placeholder: "00000-000"});

  $('.coin_mask').maskMoney({prefix:'R$ ', allowNegative: true,allowZero:true, thousands:'.', decimal:',', affixesStay: false});

  $(".chosen-select").chosen({
    placeholder: "selecione...",
    no_results_text: "Oops, nada encontrado!"
  });

}

$(document).on('page:change', mask)