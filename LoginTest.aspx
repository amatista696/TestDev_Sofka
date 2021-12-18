<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginTest.aspx.cs" Inherits="TestDev.LoginTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
    <link href="CSS/Estilos.css" rel="stylesheet" />
    <title>LOGIN TEST</title>
</head>
<body class="bg-light">
    <div class="wrapper">
        <div class="formContent">
            <form id="formLogin" runat="server">
                <div class="form-control">
                    <div class="col-md-6 text-center mb-5">
                        <asp:Label Class="h3" ID="lblBienvenida" runat="server" Text="Bienvenido/a al sistema"></asp:Label>                        
                    </div>
                    <div>
                        <asp:Label ID="lblUser" runat="server" Text="Usuario:"></asp:Label>
                        <asp:TextBox ID="txtuser" CssClass="form-control" runat="server" placeholder="Nombre de usuario" ></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="lblPass" runat="server" Text="Password:"></asp:Label>
                        <asp:TextBox ID="txtPass" CssClass="form-control" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                    </div>
                    <br />
                    <div class="row">
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </div>
                    <div>
                        <br />
                        <asp:Button ID="btnLogin" CssClass="btn btn-primary btn-dark" runat="server" Text="Ingresar" OnClick="BtnbtnLogin_Click" />
                    </div>
                </div>
            </form>
        </div>
    </div>    
</body>

</html>
