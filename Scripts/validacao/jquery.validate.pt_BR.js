jQuery.extend(jQuery.validator.messages, {
	required: "Campo obrigatório",
	maxlength: jQuery.validator.format("Valor excede o limite máximo ({0} caracteres)"),
	minlength: jQuery.validator.format("Valor não atinge o limite mínimo ({0} caracteres)"),
	rangelength: jQuery.validator.format("Valor deve conter entre {0} e {1} caracteres"),
	email: "Formato de e-mail inválido",
	url: "Formato de url inválido",
	date: "Formato de data inválido",
	number: "Formato inválido",
	digits: "Formato inválido",
	equalTo: "Os valores não conferem",
	range: jQuery.validator.format("Informe um valor entre {0} e {1}"),
	max: jQuery.validator.format("Valor máximo é {0}"),
	min: jQuery.validator.format("Valor mínimo é {0}"),
	creditcard: "Número inválido"
});

/**
 * validando datas no formato brasileiro
 */
jQuery.validator.addMethod("dateBR", function(value, element) {
	 //contando chars
	if(value.length!=10) return false;
	// verificando data
	var data 		= value;
	var dia 		= data.substr(0,2);
	var barra1		= data.substr(2,1);
	var mes 		= data.substr(3,2);
	var barra2		= data.substr(5,1);
	var ano 		= data.substr(6,4);
	if(data.length!=10||barra1!="/"||barra2!="/"||isNaN(dia)||isNaN(mes)||isNaN(ano)||dia>31||mes>12)return false;
	if((mes==4||mes==6||mes==9||mes==11)&&dia==31)return false;
	if(mes==2 && (dia>29||(dia==29&&ano%4!=0)))return false;
	if(ano < 1900)return false;
	return true;
}, "Informe uma data válida");  // Mensagem padrão

//VALIDA HORA
jQuery.validator.addMethod("dateTimeBR", function(value, element) {

	// verificando hora
	var horario 	= value;
	var hora 		= horario.substr(0,2);
	var doispontos 	        = horario.substr(2,1);
	var minuto 		= horario.substr(3,2);
        var segundos 		= horario.substr(6,2);
	if(horario.length!=8||isNaN(hora)||isNaN(minuto)||hora>23||minuto>59||doispontos!=":"||segundos>59)return false;
	return true;
}, "Informe uma hora válida");


//VALIDA DOMINIO DO EMAIL
jQuery.validator.addMethod("verificaDominioEmail", function(value) {
var resposta ;
//***************************************
$.ajax({
  url: 'validarEmail.php',
  data:{email: value},
  type:'post',
  dataType: "json",
  global: true,
  async: false,
  success: function(data) {
   resposta = data.valido;
  }
});

if(resposta == 0){
  return false;
}
else{
  return true;
}
	
}, "Informe um e-mail com domínio válido");


/**
 * valida cnpj e cpf
 */

function isCnpj(cnpj) { 
	var numeros, digitos, soma, i, resultado, pos, tamanho, digitos_iguais;
	if (cnpj.length == 0) {
		return false;
	}
	
	cnpj = cnpj.replace(/\D+/g, '');
	digitos_iguais = 1;

	for (i = 0; i < cnpj.length - 1; i++)
		if (cnpj.charAt(i) != cnpj.charAt(i + 1)) {
			digitos_iguais = 0;
			break;
		}
	if (digitos_iguais)
		return false;
	
	tamanho = cnpj.length - 2;
	numeros = cnpj.substring(0,tamanho);
	digitos = cnpj.substring(tamanho);
	soma = 0;
	pos = tamanho - 7;
	for (i = tamanho; i >= 1; i--) {
		soma += numeros.charAt(tamanho - i) * pos--;
		if (pos < 2)
			pos = 9;
	}
	resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
	if (resultado != digitos.charAt(0)){
		return false;
	}
	tamanho = tamanho + 1;
	numeros = cnpj.substring(0,tamanho);
	soma = 0;
	pos = tamanho - 7;
	for (i = tamanho; i >= 1; i--) {
		soma += numeros.charAt(tamanho - i) * pos--;
		if (pos < 2)
			pos = 9;
	}

	resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
	
	return (resultado == digitos.charAt(1));
}

function isCnpjFormatted(cnpj) {
	var validCNPJ = /\d{2,3}.\d{3}.\d{3}\/\d{4}-\d{2}/;
	return cnpj.match(validCNPJ);
}


function isCpf(cpf){
    exp = /\.|-/g;
    cpf = cpf.toString().replace(exp, "");
    var digitoDigitado = eval(cpf.charAt(9)+cpf.charAt(10));
    var soma1=0, soma2=0;
    var vlr =11;
    for(i=0;i<9;i++){
        soma1+=eval(cpf.charAt(i)*(vlr-1));
        soma2+=eval(cpf.charAt(i)*vlr);
        vlr--;
    }   
    soma1 = (((soma1*10)%11)==10 ? 0:((soma1*10)%11));
    soma2 = (((soma2+(2*soma1))*10)%11);
   
    if(cpf == "11111111111" || cpf == "22222222222" || cpf ==
			"33333333333" || cpf == "44444444444" || cpf == "55555555555" || cpf ==
			"66666666666" || cpf == "77777777777" || cpf == "88888888888" || cpf ==
			"99999999999" || cpf == "00000000000" ){
		var digitoGerado = null;
    }else{
        var digitoGerado = (soma1*10) + soma2;
    }

    if(digitoGerado != digitoDigitado){
       return false;
    }
    return true;
}
function isCpfFormatted(cpf) {
	var validCPF = /^\d{3}\.\d{3}\.\d{3}\-\d{2}$/;
	return cpf.match(validCPF);
}

(function($) {
	$.validator.addMethod("cpf", function(value, element, type) {
		if (value == "")
			return true;
		
		if ((type == 'format' || type == 'both') && !isCpfFormatted(value))
			return false;
		else
			return ((type == 'valid' || type == 'both')) ? isCpf(value) : true;
		
	}, function(type,element) {
		return (type == 'format' || (type == 'both' && !isCpfFormatted($(element).val()))) ?
				'Formato do CPF não é válido' : 'Por favor digite um CPF válido';
	});
	$.validator.addMethod("cnpj", function(value, element, type) {
		if (value == "")
			return true;
		
		if ((type == 'format' || type == 'both') && !isCnpjFormatted(value))
			return false;
		else
			return ((type == 'valid' || type == 'both')) ? isCnpj(value) : true;
		
	}, function(type,element) {
		return (type == 'format' || (type == 'both' && !isCnpjFormatted($(element).val()))) ?
				'Formato do CNPJ não é válido' : 'Por favor digite um CNPJ válido';
	});
})(jQuery);


