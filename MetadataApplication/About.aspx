<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="MetadataApplication.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p><div class="form-horizontal">
        <h4>Create new Sub Sub Category</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="CrmEntityNameId" CssClass="col-md-2 control-label">CrmEntityName</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="CrmEntityNameId" CssClass="form-control"  />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="CrmEntityNameId"
                    CssClass="text-danger" ErrorMessage="The field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="CrmFieldNameId" CssClass="col-md-2 control-label">CrmFieldName</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="CrmFieldNameId" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="CrmFieldNameId"
                    CssClass="text-danger" ErrorMessage="The field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="LabelTextId" CssClass="col-md-2 control-label">LabelText</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="LabelTextId" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="LabelTextId"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The field is required." />
                
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="Unnamed_Click" Text="Create" CssClass="btn btn-default" />
            </div>
        </div>
    </div></p>
</asp:Content>
