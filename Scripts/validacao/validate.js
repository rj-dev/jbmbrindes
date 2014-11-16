/**
 * @author Joao Paulo Raminelli
 * Biblioteca js para validar formulários e colocar mascaras nos campos 
 * 
 * versão 1.0
 * 
 */



jQuery.validator.addMethod("requiredus", $.validator.methods.required, "This field is required.");
jQuery.validator.addMethod("emailus", $.validator.methods.email, "Please enter a valid email address.");
jQuery.validator.addMethod("verificaDominioEmailus", $.validator.methods.verificaDominioEmail, "Please enter an email with valid domain");

$(function(){ 
	    //	REQUERIDO
	    jQuery.validator.addClassRules("ValidaRequerido", {
		  required: true
		});
	    
	    //EMAIL
	    jQuery.validator.addClassRules("validaEmail", {
			  email:true,
                          verificaDominioEmail:true
	    });
             //	REQUERIDO
	    jQuery.validator.addClassRules("ValidaRequeridoUs", {
		  requiredus: true
		});
	    
	    //EMAIL
	    jQuery.validator.addClassRules("validaEmailUs", {
			  emailus:true,
                          verificaDominioEmailus:true
	    });	    
	   	    
	    //	VALIDA CNPJ
	    jQuery.validator.addClassRules("validaCNPJ", {
	    	cnpj: 'both'
		});
	    
	    //VALIDA INTEIRO
	    jQuery.validator.addClassRules("validaInteiro", {
	    	digits: true
		});
        
	    //VALIDA CPF
	    jQuery.validator.addClassRules("validaCPF", {
	    	cpf: 'both'
		});
	    
	    //VALIDA TELEFONE EM GERAL
	    jQuery.validator.addClassRules("validaTelefone", {
	    	minlength:14
		});
		
		//VALIDA TELEFONE EM GERAL
	    jQuery.validator.addClassRules("validaTelefoneBR", {
	    	minlength:14
		});
        
	    //VALIDA CEP
	    jQuery.validator.addClassRules("validaCEP", {
	    	minlength:9
		});
         
	    //VALIDA DATA
	    jQuery.validator.addClassRules("validaData", {
	    	dateBR:true
		});
	    
	    
	    $("#f1").validate({
                onkeyup: false,
                onclick: false
            });   	
	    $("#f2").validate({
                onkeyup: false,
                onclick: false
            });   	
	    $("#f3").validate({
                onkeyup: false,
                onclick: false
            });   	
    
    //*
    //mascaras
    //*
    $(".validaTelefone").setMask('phone');
    $(".validaTelefoneUs").setMask({mask:'(999) 999-9999-9999',autoTab: false});
    $(".validaCPF").setMask('cpf');
    $(".validaCNPJ").setMask('cnpj');
    $(".validaInteiro").setMask('inteiro');
    $(".validaCEP").setMask('cep');
    $(".validaDinheiro").setMask('dinheiro');
    $(".validaData").setMask('date');
    
        var regraNonoDig = new Array("119","129", "139", "149", "159", "169", "179", "189", "199", "219", "229", "249", "279", "289");

    mask = '';
    if($(".validaTelefoneBR").length > 0){
    var phone = $(".validaTelefoneBR").val().replace(/[^0-9]/g, '');
    if(phone.length >= 10 && regraNonoDig.indexOf(phone.substring(0,3)) != -1){
        mask = "(99) 99999-9999";
    } else {
        mask = "(99) 9999-9999";
    }

    $(".validaTelefoneBR").setMask({
                    mask: mask,
                    autoTab: false
                }).keyup(function() {
                    var element = $(this);
                    element.unsetMask();
                    var phone = element.val().replace(/[^0-9]/g, '');
                    if(phone.length >= 10 && regraNonoDig.indexOf(phone.substring(0,3)) != -1){
                        element.setMask("(99) 99999-9999");
                    } else {
                        element.setMask("(99) 9999-9999");
                    }
                });
    }
    
    
     $("#cnpj_cpf, #documento").keyup(function(){
            
            $(this).unsetMask();
            
            //verifica o tamanho do campo digitado 
             

            var tamanho = $(this).val().length;

            
            if(tamanho > 14){ 
                $(this).setMask('99.999.999/9999-99');
                $(this).removeClass('validaCPF');
                $(this).addClass('validaCNPJ');
            } 
            else{
                $(this).setMask('999.999.999-999');
                $(this).removeClass('validaCNPJ');
                $(this).addClass('validaCPF');
               
            }    
        });
   
});
