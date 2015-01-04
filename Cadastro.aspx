<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Cadastro.aspx.cs" Inherits="Cadastro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="bloco_centro">
        <div class="form_trabalhe_conosco">

            <div class="form_faca-cadastro">

                <div class="nome">
                    <label for="email">Email*</label>

                    <%--<input type="text" name="email" id="email" value="" maxlength="100">--%>
                    <asp:TextBox runat="server" ID="txtEmail" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" ErrorMessage="Informe o Email"
                        ControlToValidate="txtEmail" ForeColor="Red" SetFocusOnError="True" ValidationGroup="cadastro"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="None" ErrorMessage="Email invalido"
                        ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" ValidationGroup="cadastro"></asp:RegularExpressionValidator>
                </div>

                <div class="nome">
                    <label for="nome">Nome*</label>
                    <%--<input type="text" name="nome" id="nome" value="" maxlength="150">--%>
                    <asp:TextBox runat="server" ID="txtNome" MaxLength="150"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="None" ErrorMessage="Informe o Nome"
                        ControlToValidate="txtNome" ForeColor="Red" SetFocusOnError="True" ValidationGroup="cadastro"></asp:RequiredFieldValidator>
                </div>

                <div class="empresa_edit">
                    <label for="razao_social">Empresa*</label>

                    <%--<input type="text" name="razao_social" id="razao_social" value="" maxlength="150">--%>
                    <asp:TextBox runat="server" ID="txtEmpresa" MaxLength="150"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="None" ErrorMessage="Informe a Empresa"
                        ControlToValidate="txtEmpresa" ForeColor="Red" SetFocusOnError="True" ValidationGroup="cadastro"></asp:RequiredFieldValidator>
                </div>

                <div class="cnpj_edit">
                    <label for="documento">CNPJ/CPF*</label>

                    <input type="text" name="documento" id="documento" value="" maxlength="25">
                </div>


                <div class="endereco_edit">
                    <label for="endereco">Endereço*</label>

                    <%--<input type="text" name="endereco" id="endereco" value="" maxlength="250">--%>
                    <asp:TextBox runat="server" ID="txtEndereco" MaxLength="250"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="None" ErrorMessage="Informe o Endereço"
                        ControlToValidate="txtEndereco" ForeColor="Red" SetFocusOnError="True" ValidationGroup="cadastro"></asp:RequiredFieldValidator>
                </div>

                <div class="numero_edit">
                    <label for="numero">Número*</label>

                    <%--<input type="text" name="numero" id="numero" value="" maxlength="5" onkeypress="return Numeros(event);">--%>
                    <asp:TextBox runat="server" ID="txtNumero" MaxLength="5" onkeypress="return Numeros(event);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="None" ErrorMessage="Informe o Numero"
                        ControlToValidate="txtNumero" ForeColor="Red" SetFocusOnError="True" ValidationGroup="cadastro"></asp:RequiredFieldValidator>
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

                    <%--<input type="text" name="cep" id="cep" class="validaCEP ValidaRequerido" value="">--%>
                    <asp:TextBox runat="server" ID="txtCep" CssClass="validaCEP ValidaRequerido"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="None" ErrorMessage="Informe o CEP"
                        ControlToValidate="txtCep" ForeColor="Red" SetFocusOnError="True" ValidationGroup="cadastro"></asp:RequiredFieldValidator>
                </div>

                <div class="empresa_edit">
                    <label for="bairro">Bairro*</label>

                    <%--<input type="text" name="bairro" id="bairro" value="" maxlength="100">--%>
                    <asp:TextBox runat="server" ID="txtBairro" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="None" ErrorMessage="Informe o Bairro"
                        ControlToValidate="txtBairro" ForeColor="Red" SetFocusOnError="True" ValidationGroup="cadastro"></asp:RequiredFieldValidator>
                </div>

                <div class="cnpj_edit">
                    <label for="telefone">Telefone*</label>

                    <%--<input type="text" name="telefone" id="telefone" value="" class="validaTelefoneBR" onkeypress="return Mascaras(event, 'FONE', 'telefone');">--%>
                    <asp:TextBox runat="server" ID="txtTelefone" CssClass="validaTelefoneBR" onkeypress="return Mascaras(event, 'FONE', 'telefone');"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="None" ErrorMessage="Informe o Bairro"
                        ControlToValidate="txtTelefone" ForeColor="Red" SetFocusOnError="True" ValidationGroup="cadastro"></asp:RequiredFieldValidator>
                </div>

            </div>

            <div class="form_edit-login">

                <div class="nome">
                    <label for="login_edit_cadastro">Login*</label>
                    <%--<input type="text" name="login_edit_cadastro" id="login_edit_cadastro" value="" maxlength="100" readonly="readonly">--%>
                    <asp:TextBox runat="server" ID="txtLogin" MaxLength="100"></asp:TextBox>  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="None" ErrorMessage="Informe o Login"
                        ControlToValidate="txtLogin" ForeColor="Red" SetFocusOnError="True" ValidationGroup="cadastro"></asp:RequiredFieldValidator>
                </div>



                <div class="login-edit">
                    <label for="senha_edit_cadastro">Senha*</label>

                    <%--<input type="password" name="senha_edit_cadastro" id="senha_edit_cadastro" value="" maxlength="20">--%>
                    <asp:TextBox runat="server" ID="txtSenha1" MaxLength="20" TextMode="Password"></asp:TextBox>
                </div>

                <div class="repete-login-edit">
                    <label>Repita sua senha*</label>

                    <%--<input type="password" name="confirmar_senha" id="confirmar_senha" value="" maxlength="20">--%>
                    <asp:TextBox runat="server" ID="txtSenha2" MaxLength="20" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Senhas não conferem" Display="None"
                        ControlToValidate="txtSenha1" ControlToCompare="txtSenha2" ForeColor="Red" SetFocusOnError="True" ValidationGroup="cadastro"></asp:CompareValidator>
                </div>
                <%--<input type="submit" value="" title="Enviar" class="bt_enviar_edit">--%>
                <asp:Button runat="server" ID="btnEnviar" CssClass="bt_enviar_edit" ValidationGroup="cadastro" />

                <div style="margin-top: 55%;">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="cadastro" ForeColor="Red" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

