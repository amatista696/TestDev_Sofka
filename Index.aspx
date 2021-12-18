<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="TestDev.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
    <link href="CSS/Estilos.css" rel="stylesheet" />
    <title></title>
</head>
<body class="bg-light">
    <div class="wrapper">
        <div class="formContent">
             <form id="formLogin" runat="server">
                <div class="form-control">
                    <div class="col-md-6 text-center mb-5">
                        <asp:Label Class="h2" ID="lblBienvenida" runat="server" Text="Seleccione una Opción"></asp:Label>                        
                    </div>
                    <div>
                        <asp:Button ID="btnInsert" runat="server" Text="Insert ThirdParties" CssClass="btn btn-secondary" OnClick="BtnInsert_Click"/>                  
                    </div>
                    <br />
                    <div>
                        <asp:Button ID="btnSelect" runat="server" Text="Select ThirdParties" CssClass="btn btn-secondary" OnClick="BtnSelect_Click"/>                  
                    </div>
                    <br />
                    <div>
                        <asp:Button ID="btnJson" runat="server" Text="Objeto Json" CssClass="btn btn-secondary" OnClick="BtnJson_Click"/>
                    </div>
                </div>
            </form>           
        </div>
    </div>
</body>
</html>
