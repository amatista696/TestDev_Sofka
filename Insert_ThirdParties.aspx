<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Insert_ThirdParties.aspx.cs" Inherits="TestDev.Insert_ThirdParties" %>

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
                        <asp:Label Class="h2" ID="lblBienvenida" runat="server" Text="Insert ThirdParties"></asp:Label>                        
                    </div>
                    <div>
                        <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
                        <asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server" placeholder="FirstName" ></asp:TextBox>
                    </div>
                    <br />
                    <div>
                        <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
                        <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server" placeholder="LastName" ></asp:TextBox>
                    </div>
                    
                    <br />
                    <div>
                        <asp:Label ID="lblDocumentTypeID" runat="server" Text="Document TypeID:"></asp:Label>
                        <asp:DropDownList ID="DropDocument" runat="server"></asp:DropDownList>
                    </div>
                    <br />
                    <div>
                        <asp:Label ID="lblDocumentNumber" runat="server" Text="Document Number:"></asp:Label>
                        <asp:TextBox ID="txtDocumentNumber" CssClass="form-control" runat="server" placeholder="DocumentNumber" ></asp:TextBox>
                    </div>
                    <br />
                    <div>
                        <asp:Label ID="lblCityIataCode" runat="server" Text="City IataCode:"></asp:Label>
                        <asp:DropDownList ID="DropCity" runat="server"></asp:DropDownList>
                    </div>
                    <br />
                    <div>
                        <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number:"></asp:Label>
                        <asp:TextBox ID="txtPhoneNumber" CssClass="form-control" runat="server" placeholder="PhoneNumber" ></asp:TextBox>
                    </div>
                    <br />
                    <div>
                        <asp:Label ID="lblFaxNumber" runat="server" Text="Fax Number:"></asp:Label>
                        <asp:TextBox ID="txtFaxNumber" CssClass="form-control" runat="server" placeholder="Fax Number" ></asp:TextBox>
                    </div>
                    <br />
                    <div>
                        <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label>
                        <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" placeholder="Address" ></asp:TextBox>
                    </div>
                    <br />
                    <div>
                        <asp:Label ID="lblMobilePhoneNumber" runat="server" Text="Mobile Phone Number:"></asp:Label>
                        <asp:TextBox ID="txtMobilePhoneNumber" CssClass="form-control" runat="server" placeholder="MobilePhoneNumber" ></asp:TextBox>
                    </div>
                    <br />
                    <div>
                        <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                        <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="Email" ></asp:TextBox>
                    </div>
                    <br />
                    <div>
                        <asp:Label ID="lblCountryID" runat="server" Text="Country ID:"></asp:Label>
                        <asp:DropDownList ID="DropCountry" runat="server"></asp:DropDownList>
                    </div>
                    
                    <br />
                    <div class="row">
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </div>
                    <div>
                        <br />
                        <asp:Button ID="btnInsert" CssClass="btn btn-primary btn-dark" runat="server" Text="Guardar" OnClick="btnInsert_Click" />
                    </div>
                </div>
            </form>           
        </div>
    </div>
</body>
</html>
