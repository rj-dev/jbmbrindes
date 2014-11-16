function flash() {
	jQuery(".flash_inicial_aberto").removeClass("flash_inicial_aberto").addClass("flash_inicial");
}
 function flash2() {
	jQuery(".flash_inicial").removeClass("flash_inicial").addClass("flash_inicial_aberto");
}
function flash3() {
	jQuery("#menuflash").removeClass("menuaberto").addClass("menu");
}
 function flash4() {
	jQuery("#menuflash").removeClass("menu").addClass("menuaberto");
}


function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function validaemail(email) {
  var objRegExp  = /^[A-Za-z0-9]([\w\.\-\_]*)@([A-Za-z0-9\.]*)\.(([A-Za-z]{3}\.[A-Za-z]{2}$)|([A-Za-z]{3}$)|([a-z]{2}$))/i ;
  return objRegExp.test(email);
}

function envia(param) {
  if (param == 1) {
    if (document.f1.nome.value.length < 3) {
      alert("Preencha o campo NOME!");
      document.f1.nome.focus();
    }
    else {
      if (!validaemail(document.f1.emai.value)) {
        alert("Preencha o campo E-MAIL!");
              document.f1.emai.focus();
      }
      else {
        document.f1.submit();
      }
    }
  }
  else if (param == 2) {
    if (!validaemail(document.f2.emai.value)) {
      alert("Preencha o campo E-MAIL!");
      document.f2.emai.focus();
    }
    else {
      document.f2.submit();
    }
  }
  else if ( param == 3 ) {
    if (document.f1.nome.value.length < 3) {
      alert("Preencha o campo NOME!");
      document.f1.nome.focus();
    }
    else {
      if (!validaemail(document.f1.email.value)) {
        alert("Preencha o campo E-MAIL!");
              document.f1.email.focus();
      }
      else {
        if ( document.f1.mensagem.value.length < 3 )
        {
            alert("Preencha o campo MENSAGEM!");
        } else {
            document.f1.submit();
        }
      }
    }
  } else {
    if (document.f1.nome.value.length < 3) {
      alert("Preencha o campo NOME!");
      document.f1.nome.focus();
    }
    else {
      if (!validaemail(document.f1.email.value)) {
        alert("Preencha o campo E-MAIL!");
              document.f1.email.focus();
      }
      else {
        document.f1.submit();
      }
    }
  }
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
/*
    COMO USAR
    EX: onkeypress="return Mascaras ( event, 'FONE', 'nome_id' );"
*/
function Mascaras ( e, formato, objeto )
{
    var key;

    if ( window.event ) keyPressed = window.event.keyCode; // IE hack
    else keyPressed = e.which; // <B>standard method</B>

    if ( keyPressed >= 48 && keyPressed <= 57 )
    {
        var campo = document.getElementById(objeto);
        
        /*
            DATA
            FORMATO: 00/00/0000
        */
        if ( formato == 'DATA' )
        {
            separador = '/'; 
            conjunto1 = 2;
            conjunto2 = 5;
            if ( campo.value.length == conjunto1 )
                campo.value = campo.value + separador;
            
            if ( campo.value.length == conjunto2 )
                campo.value = campo.value + separador;
            
            return true;
        }
        
        /*
            HORA
            FORMATO: 00:00
        */
        if (formato == 'HORA')
        {
            separador = ':';
            conjunto1 = 2;
            if ( campo.value.length == conjunto1 )
                campo.value = campo.value + separador;
            
            return true;
        }
        
        /*
            CEP
            FORMATO: 00000-000
        */
        if (formato == 'CEP')
        {
            separador = '-';
            conjunto1 = 5;
            if (    campo.value.length == conjunto1 )
                campo.value = campo.value + separador;
            
            return true;
        } 
        
        /*
            CPF
            FORMATO: 000.000.000-00
        */
        if (formato == 'CPF')
        {
            separador = '.';
            separador1 = '-';
            conjunto1 = 3;
            conjunto2 = 7;
            conjunto3 = 11;
            if ( campo.value.length == conjunto1 )
                campo.value = campo.value + separador;

            if ( campo.value.length == conjunto2 )
                campo.value = campo.value + separador;

            if ( campo.value.length == conjunto3 )
                campo.value = campo.value + separador1;
            
            return true;
        }
        
        /*
            CNPJ
            FORMATO: 00.000.000/0000-00
        */
        if (formato == 'CNPJ')
        {
            separador1 = '.';
            separador2 = '/';
            separador3 = '-';
            conjunto1 = 2;
            conjunto2 = 6;
            conjunto3 = 10;
            conjunto4 = 15;
            if ( campo.value.length == conjunto1 )
                campo.value = campo.value + separador1;
            
            if ( campo.value.length == conjunto2 )
                campo.value = campo.value + separador1;
            
            if ( campo.value.length == conjunto3 )
                campo.value = campo.value + separador2;
            
            if ( campo.value.length == conjunto4 )
                campo.value = campo.value + separador3;
            
            return true;
        }
        
        /*
            FONE
            FORMATO: (00) 0000-0000
        */
        if ( formato == 'FONE' )
        {
            separador1 = '(';
            separador2 = ') ';
            separador3 = '-';
            conjunto1 = 0;
            conjunto2 = 3;
            conjunto3 = 9;
            if ( campo.value.length == conjunto1 )
                campo.value = campo.value + separador1;
            
            if ( campo.value.length == conjunto2 )
                campo.value = campo.value + separador2;
            
            if ( campo.value.length == conjunto3 )
                campo.value = campo.value + separador3;
            
            return true;
        }
        
        /*
            FONE2
            FORMATO: 0000-0000
        */
        if ( formato == 'FONESIMPLES' )
        {
            separador1 = '-';
            conjunto1 = 4;
            if ( campo.value.length == conjunto1 )
                campo.value = campo.value + separador1;
            
            return true;
        }
    }
    else if ( keyPressed == 8 || keyPressed == 13 || keyPressed == 0 )
        return true;
    else
        return false;
}

/*
    COMO USAR
    EX: onkeypress="return TextoSimples ( event );"
*/
function TextoSimples ( e )
{
    if ( window.event ) keyPressed = window.event.keyCode; // IE hack
    else keyPressed = e.which; // <B>standard method</B>

    if ( keyPressed == 8 || keyPressed == 95  || keyPressed == 13  || keyPressed == 0 ) return true;
    else if ( ( keyPressed >= 48 && keyPressed <= 57 ) || (keyPressed > 96 && keyPressed < 123) || keyPressed == 95 ) return true;
    else if ( ( keyPressed > 191 && keyPressed < 221 ) || ( keyPressed > 223 && keyPressed < 253 ) ) return true;
    
    return false;
}

/*
    COMO USAR
    EX: onkeypress="return Numeros ( event );"
*/
function Numeros ( e )
{
    if ( window.event ) keyPressed = window.event.keyCode; // IE hack
    else keyPressed = e.which; // <B>standard method</B>
    
    if ( keyPressed == 8 || keyPressed == 13 || keyPressed == 0 ) return true;
    else if ( keyPressed >= 48 && keyPressed <= 57 ) return true;
              
    return false;
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
