<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Cadastro.aspx.cs" Inherits="Cadastro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">   
    <div class="bloco_centro">
        <div class="form_trabalhe_conosco">

            <div class="form_faca-cadastro">

                <div class="nome">
                    <label for="email">Email*</label>

                    <input type="text" name="email" id="email" value="" maxlength="100">
                </div>

                <div class="nome">
                    <label for="nome">Nome*</label>

                    <input type="text" name="nome" id="nome" value="" maxlength="150">
                </div>

                <div class="empresa_edit">
                    <label for="razao_social">Empresa*</label>

                    <input type="text" name="razao_social" id="razao_social" value="" maxlength="150">
                </div>

                <div class="cnpj_edit">
                    <label for="documento">CNPJ/CPF*</label>

                    <input type="text" name="documento" id="documento" value="" maxlength="25">
                </div>


                <div class="endereco_edit">
                    <label for="endereco">Endereço*</label>

                    <input type="text" name="endereco" id="endereco" value="" maxlength="250">
                </div>

                <div class="numero_edit">
                    <label for="numero">Número*</label>

                    <input type="text" name="numero" id="numero" value="" maxlength="5" onkeypress="return Numeros(event);">
                </div>



                <div class="estado">
                    <label for="estado">Estado*</label>

                    <select name="estado" id="estado">
                    </select>
                </div>

                <div class="cidade">
                    <label for="cidade">Cidade*</label>

                    <%--<input type="text" name="cidade" id="cidade" value="" maxlength="150">--%>

                    <select name="cidade" id="cidade">
                    </select>
                </div>

                <div class="endereco_edit">
                    <label for="complemento">Complemento</label>

                    <input type="text" name="complemento" id="complemento" value="" maxlength="100">
                </div>

                <div class="numero_edit">
                    <label for="cep">CEP*</label>

                    <input type="text" name="cep" id="cep" class="validaCEP ValidaRequerido" value="">
                </div>

                <div class="empresa_edit">
                    <label for="bairro">Bairro*</label>

                    <input type="text" name="bairro" id="bairro" value="" maxlength="100">
                </div>

                <div class="cnpj_edit">
                    <label for="telefone">Telefone*</label>

                    <input type="text" name="telefone" id="telefone" value="" class="validaTelefoneBR" onkeypress="return Mascaras(event, 'FONE', 'telefone');">
                </div>

            </div>

            <div class="form_edit-login">

                <div class="nome">
                    <label for="login_edit_cadastro">Login*</label>
                    <input type="text" name="login_edit_cadastro" id="login_edit_cadastro" value="" maxlength="100" readonly="readonly">
                </div>



                <div class="login-edit">
                    <label for="senha_edit_cadastro">Senha*</label>

                    <input type="password" name="senha_edit_cadastro" id="senha_edit_cadastro" value="" maxlength="20">
                </div>

                <div class="repete-login-edit">
                    <label>Repita sua senha*</label>

                    <input type="password" name="confirmar_senha" id="confirmar_senha" value="" maxlength="20">
                </div>
                <input type="submit" value="" title="Enviar" class="bt_enviar_edit">
            </div>
        </div>
    </div>
</asp:Content>

