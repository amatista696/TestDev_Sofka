<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Select_ThirdParties.aspx.cs" Inherits="TestDev.Select_ThirdParties" %>

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
             <form id="formThird1" runat="server">
                <div class="form-control">
                    <div class="col-md-6 text-center mb-5" >
                        <asp:Label Class="h2" ID="lbltitulo" runat="server" Text="Select ThirdParties" ></asp:Label>                        
                    </div>
                    <br />
                    <div>
                        <asp:Label ID="lblDocumentTypeID" runat="server" Text="Document TypeID:"></asp:Label>
                        <asp:DropDownList ID="DropDocument" runat="server"></asp:DropDownList>
                    </div>
                    <br />
                    <div>
                        <asp:Label ID="lblCountryID" runat="server" Text="Country ID:"></asp:Label>
                        <asp:DropDownList ID="DropCountry" runat="server"></asp:DropDownList>
                    </div>
                    <br />
                    <div>
                        <br />
                        <asp:Button ID="btnSelect" CssClass="btn btn-primary btn-dark" runat="server" Text="Consultar" OnClick="btnSelect_Click" />
                    </div>
                </div>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="false" AllowSorting="True" 
                        DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#666666" 
                        GridLines="none" DataKeyNames="ID" AutoGenerateColumns="False"                        BackColor="White" CssClass="wrapper" BorderStyle="None">                    
                    <Columns >
                        <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" >
                            </asp:BoundField>
                        <asp:BoundField DataField="FirstName" HeaderText=" First Name" SortExpression="FirstName">
                            </asp:BoundField>
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                        <asp:BoundField DataField="Doc" HeaderText="Type Doc" SortExpression="Doc" />
                        <asp:BoundField DataField="DocumentNumber" HeaderText="Nro Doc " SortExpression="DocumentNumber" />
                        <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" SortExpression="Ciudad" />
                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone " SortExpression="PhoneNumber" />
                        <asp:BoundField DataField="FaxNumber" HeaderText="Fax " SortExpression="FaxNumber" />
                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                        <asp:BoundField DataField="MobilePhoneNumber" HeaderText="Mobile " SortExpression="MobilePhoneNumber" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                        <asp:BoundField DataField="VerificationDigit" HeaderText=" Digit" SortExpression="VerificationDigit" />
                    </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexion%>" ProviderName="<%$ ConnectionStrings:conexion.ProviderName %>"></asp:SqlDataSource>
            </form>         
        </div>
    </div>      
</body>
</html>
