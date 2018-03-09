<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demo.aspx.cs" Inherits="MetadataApplication.Demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            font-family: Arial;
            font-size: 10pt;
        }

        .Grid td {
            background-color: #A1DCF2;
            color: black;
            font-size: 10pt;
            line-height: 200%;
        }

        .Grid th {
            background-color: #3AC0F2;
            color: White;
            font-size: 10pt;
            line-height: 200%;
        }

        .ChildGrid td {
            background-color: #eee !important;
            color: black;
            font-size: 10pt;
            line-height: 200%;
        }

        .ChildGrid th {
            background-color: #6C6C6C !important;
            color: White;
            font-size: 10pt;
            line-height: 200%;
        }
    </style>
    <style type="text/css">
        @import "http://fonts.googleapis.com/css?family=Droid+Serif";
        /* Above line is used for online google font */
        h2 {
            text-align: center;
            <!-- font-size: 24pxfont-size:24px; -->
        }

        hr {
            margin-bottom: 30px;
        }

        p {
            color: #000;
            font-size: 16px;
            font-weight: 700;
        }

        #button {
            border: 1px solid #0c799e;
            width: 250px;
            padding: 10px;
            font-size: 16px;
            font-weight: 700;
            color: #fff;
            border-radius: 3px;
            background: linear-gradient(to bottom,#59d0f8 5%,#49c0e8 100%);
            cursor: pointer;
        }

            #button:hover {
                background: linear-gradient(to bottom,#49c0e8 5%,#59d0f8 100%);
            }

        input[type=text] {
            margin-top: 5px;
            margin-bottom: 20px;
            width: 96%;
            border-radius: 5px;
            border: 0;
            padding: 5px 0;
        }

        #name, #email {
            padding-left: 10px;
        }

        input[type=submit] {
            width: 30%;
            border: 1px solid #59b4d4;
            background: #0078a3;
            color: #eee;
            padding: 3px 0;
            border-radius: 5px;
            margin-left: 33%;
            cursor: pointer;
        }

            input[type=submit]:hover {
                border: 1px solid #666;
                background: #555;
                color: #fff;
            }

        .ui-dialog .ui-dialog-content {
            padding: 2em;
        }

        div.container {
            width: 960px;
            height: 610px;
            margin: 50px auto;
            font-family: 'Droid Serif',serif;
            position: relative;
        }

        div.main {
            width: 320px;
            margin-top: 35px;
            float: left;
            padding: 10px 55px 25px;
            background-color: rgba(204,204,191,0.51);
            border: 15px solid #fff;
            box-shadow: 0 0 10px;
            border-radius: 2px;
            font-size: 13px;
            text-align: center;
        }
    </style>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/ui-darkness/jquery-ui.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(function () {

            });
        });
    </script>
    <script src="Scripts/FormFieldValues.js"></script>
    <script type="text/javascript">
        //var abc = 0;
        function performPlus(thisCtrl) {
            $(thisCtrl).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(thisCtrl).next().html() + "</td></tr>")
            $(thisCtrl).attr("src", "images/minus.png");
            $(thisCtrl).removeAttr('onclick');
            $(thisCtrl).attr('onclick', 'performMinus(this)');
        }

        function performMinus(thisCtrl) {
            $(thisCtrl).attr("src", "images/plus.png");
            $(thisCtrl).closest("tr").next().remove();
            $(thisCtrl).removeAttr('onclick');
            $(thisCtrl).attr('onclick', 'performPlus(this)');
        }

        function showPopUp(thisCtrl) {
            var currentId = thisCtrl.previousElementSibling.textContent;
            GetFieldDetails(currentId);
            return false;
        }

        function showCatPopUp(thisCtrl) {
            var currentId = thisCtrl.previousElementSibling.textContent;
            GetCatDetails(currentId);
            return false;
        }

        function showSubCatPopUp(thisCtrl) {
            var currentId = thisCtrl.previousElementSibling.textContent;
            GetSubCatDetails(currentId);
            return false;
        }

        function showSubSubCatPopUp(thisCtrl) {
            var currentId = thisCtrl.previousElementSibling.textContent;
            GetSubSubCatDetails(currentId);
            return false;
        }

        $(document).ready(function () {

        });

    </script>
    <link href="Content/StyleSheet.css" rel="stylesheet" />
    <link href="Content/main.css" rel="stylesheet" />
    <script type="text/javascript">

        $(document).ready(function () {

        });

        function initializePopUp() {
            $("#dialog").dialog({
                autoOpen: true,
                width: 750,
                buttons: {
                    "Create": function () {
                        $(this).dialog("close");
                        var f = $('#dialog').formFieldValues();

                        PostFieldDetails(f);

                        //$(this).remove();
                    },
                    Cancel: function () {
                        $(this).dialog("close");
                        //$(this).remove();
                    }
                },
                close: function () {
                }
            });
        }

        function initializeCatPopUp() {
            $("#catDialog").dialog({
                autoOpen: true,
                width: 525,
                buttons: {
                    "Create": function () {
                        $(this).dialog("close");
                        //$(this).remove();
                    },
                    Cancel: function () {
                        $(this).dialog("close");
                        //$(this).remove();
                    }
                },
                close: function () {
                }
            });
        }

        function initializeSubCatPopUp() {
            $("#subCatDialog").dialog({
                autoOpen: true,
                width: 525,
                buttons: {
                    "Create": function () {
                        $(this).dialog("close");

                        //$(this).remove();
                    },
                    Cancel: function () {
                        $(this).dialog("close");
                        //$(this).remove();
                    }
                },
                close: function () {
                }
            });
        }

        function initializeSubSubCatPopUp() {
            $("#subSubCatDialog").dialog({
                autoOpen: true,
                width: 525,
                buttons: {
                    "Create": function () {
                        $(this).dialog("close");
                        //$(this).remove();
                    },
                    Cancel: function () {
                        $(this).dialog("close");
                        //$(this).remove();
                    }
                },
                close: function () {
                }
            });
        }

        function SetPopUpFieldValues(field) {
            // Object with Form field values. (Form Field Name: 'value')
            var formFieldValues = {
                Id: field.Id,
                CrmEntityName: field.CrmEntityName,
                CrmFieldName: field.CrmFieldName,
                IsRequired: field.IsRequired,//name:value
                RequiredFieldValidationErrorMessage: field.RequiredFieldValidationErrorMessage,
                LabelText: field.LabelText,
                Description: field.Description,
                Type: field.Type,
                AllowOnlyHalfPoints: field.AllowOnlyHalfPoints,
                AllowNegative: field.AllowNegative,
                AllowDecimal: field.AllowDecimal,
                Visible: field.Visible,
                Enabled: field.Enabled,
                //Order
                MaxLength: field.MaxLength,
                MinLength: field.MinLength,
                DefaultValue: field.DefaultValue,
                DisplayFormat: field.DisplayFormat,
                DisplayCondition: field.DisplayCondition,
                Picklist: field.Picklist,
                PartsPicklist: field.PartsPicklist,
                CalculateFunction: field.CalculateFunction,
                AssociatedCategory: field.AssociatedCategory,
                DVR: field.DVR,
                Parent: field.Parent,
                DependentField: field.DependentField,
                dependentpicklist: field.dependentpicklist,
                initialLoad: field.initialLoad,
                PrimaryDisplayForCollection: field.PrimaryDisplayForCollection,
                IsCrmOptionSet: field.IsCrmOptionSet,
                DoNotSendToBackend: field.DoNotSendToBackend,
                SaveValueInsteadOfKey: field.SaveValueInsteadOfKey
            }

            // Set Form Field Values
            $('#dialog').formFieldValues(formFieldValues);
        }

        function SetCatPopUpFieldValues(cat) {
            // Object with Form field values. (Form Field Name: 'value')
            var formFieldValues = {
                CatId: cat.Id,
                displayname: cat.displayname,
                image: cat.image,
                visible: cat.visible,//not needed?
                enabled: cat.enabled,//not needed?
                //AbilityToAdd: cat.AbilityToAdd,//not needed
                //IsRequired: cat.IsRequired,//not needed
                dependentcategoryoncreation: cat.dependentcategoryoncreation,
                displaycondition: cat.displaycondition,
                IgnoreValidation: cat.IgnoreValidation
            }

            // Set Form Field Values
            $('#catDialog').formFieldValues(formFieldValues);
        }

        function SetSubCatPopUpFieldValues(subCat) {
            // Object with Form field values. (Form Field Name: 'value')
            var formFieldValues = {
                subCatId: subCat.Id,
                displayname: subCat.displayname,
                visible: subCat.visible,//not needed?
                enabled: subCat.enabled//not needed?
            }

            // Set Form Field Values
            $('#subCatDialog').formFieldValues(formFieldValues);
        }

        function SetSubSubCatPopUpFieldValues(subSubCat) {
            // Object with Form field values. (Form Field Name: 'value')
            var formFieldValues = {
                CatId: subSubCat.Id,
                displayname: subSubCat.displayname,
                visible: subSubCat.visible,//not needed?
                enabled: subSubCat.enabled,//not needed?
                AbilityToAdd: subSubCat.AbilityToAdd,
                IsRequired: subSubCat.IsRequired,//not needed?
                dependentcategoryoncreation: subSubCat.dependentcategoryoncreation,
                displaycondition: subSubCat.displaycondition,
                IgnoreValidation: subSubCat.IgnoreValidation
            }

            // Set Form Field Values
            $('#subSubCatDialog').formFieldValues(formFieldValues);
        }

        function PostFieldDetails(f) {
            var response = "";

            var fieldObj = {
                Id: f.Id,
                CrmEntityName: f.CrmEntityName,
                CrmFieldName: f.CrmFieldName,
                IsRequired: f.IsRequired,
                RequiredFieldValidationErrorMessage: f.RequiredFieldValidationErrorMessage,
                LabelText: f.LabelText,
                Description: f.Description,
                Type: f.Type,
                AllowOnlyHalfPoints: f.AllowOnlyHalfPoints,
                AllowNegative: f.AllowNegative,
                AllowDecimal: f.AllowDecimal,
                Visible: f.Visible,
                Enabled: f.Enabled,
                MaxLength: f.MaxLength,
                MinLength: f.MinLength,
                DefaultValue: f.DefaultValue,
                DisplayFormat: f.DisplayFormat,
                DisplayCondition: f.DisplayCondition,
                Picklist: f.Picklist,
                PartsPicklist: f.PartsPicklist,
                CalculateFunction: f.CalculateFunction,
                AssociatedCategory: f.AssociatedCategory,
                DVR: f.DVR,
                Parent: f.Parent,
                DependentField: f.DependentField,
                dependentpicklist: f.dependentpicklist,
                initialLoad: f.initialLoad,
                PrimaryDisplayForCollection: f.PrimaryDisplayForCollection,
                IsCrmOptionSet: f.IsCrmOptionSet,
                DoNotSendToBackend: f.DoNotSendToBackend,
                SaveValueInsteadOfKey: f.SaveValueInsteadOfKey,
                ReportSubCategoryId: f.ReportSubCategoryId,
                ReportColumnName: f.ReportColumnName,
                CrmEntityReferenceResponseField: f.CrmEntityReferenceResponseField,
            };
            $.ajax({
                type: "POST",
                url: "/Demo.aspx/ModifyFieldDetails",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ 'field': fieldObj }), // Check this call.
                success: function (data) {
                }
            });
            return response;
        }

        function GetFieldDetails(ID) {
            var response = "";
            $.ajax({
                type: "POST",
                url: "Demo.aspx/GetFieldDetails",
                data: "{ID: '" + ID + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var field = response.d;
                    initializePopUp();
                    SetPopUpFieldValues(field);

                },
                failure: function (response) {
                    alert(response.d);
                }
            });
            return response;
        }

        function GetCatDetails(ID) {
            var response = "";
            $.ajax({
                type: "POST",
                url: "Demo.aspx/GetCatDetails",
                data: "{ID: '" + ID + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var cat = response.d;
                    initializeCatPopUp();
                    SetCatPopUpFieldValues(cat);

                },
                failure: function (response) {
                    alert(response.d);
                }
            });
            return response;
        }

        function GetSubCatDetails(ID) {
            var response = "";
            $.ajax({
                type: "POST",
                url: "Demo.aspx/GetSubCatDetails",
                data: "{ID: '" + ID + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var subCat = response.d;
                    initializeSubCatPopUp();
                    SetSubCatPopUpFieldValues(subCat);

                },
                failure: function (response) {
                    alert(response.d);
                }
            });
            return response;
        }
        function GetSubSubCatDetails(ID) {
            var response = "";
            $.ajax({
                type: "POST",
                url: "Demo.aspx/GetSubSubCatDetails",
                data: "{ID: '" + ID + "' }",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var subSubCat = response.d;
                    initializeSubSubCatPopUp();
                    SetSubSubCatPopUpFieldValues(subSubCat);

                },
                failure: function (response) {
                    alert(response.d);
                }
            });
            return response;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" CssClass="Grid" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Style="cursor: pointer" ImageUrl="~/images/plus.png" onclick="performPlus(this)" />
                            <asp:Panel ID="pnlSubCategory" runat="server" Style="display: none">
                                <asp:GridView ID="gridSubCategory" runat="server" AutoGenerateColumns="false" CssClass="ChildGrid" OnRowDataBound="gridSubCategory_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Image ID="Image2" runat="server" Style="cursor: pointer" ImageUrl="~/images/plus.png" onclick="performPlus(this)" />
                                                <asp:Panel ID="pnlSubSubCategory" runat="server" Style="display: none">
                                                    <asp:GridView ID="gridSubSubCategory" runat="server" AutoGenerateColumns="false" CssClass="ChildGrid" OnRowDataBound="gridSubSubCategory_RowDataBound">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:Image ID="Image3" runat="server" Style="cursor: pointer" ImageUrl="~/images/plus.png" onclick="performPlus(this)" />
                                                                    <asp:Panel ID="pnlFields" runat="server" Style="display: none">
                                                                        <asp:GridView ID="gridFields" runat="server" AutoGenerateColumns="false" CssClass="ChildGrid" OnRowDataBound="gridFields_RowDataBound">
                                                                            <Columns>
                                                                                <asp:BoundField DataField="LabelText" HeaderText="Label Text" />
                                                                                <asp:BoundField DataField="CrmEntityName" HeaderText="Crm Entity Name" />
                                                                                <asp:BoundField DataField="CrmFieldName" HeaderText="Crm Field Name" />
                                                                                <asp:TemplateField HeaderText="Required Access">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label runat="server" Style="display: none" Text='<%# Eval("Id") %>'></asp:Label>
                                                                                        <asp:HyperLink onClick="return showPopUp(this);" ID="trigger_1id" runat="server">Modify</asp:HyperLink>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>

                                                                            </Columns>
                                                                        </asp:GridView>
                                                                    </asp:Panel>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="displayname" HeaderText="Sub Sub Category Name" />
                                                            <asp:BoundField DataField="order" HeaderText="Order Number" />
                                                            <asp:TemplateField HeaderText="Required Access">
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" Style="display: none" Text='<%# Eval("Id") %>'></asp:Label>
                                                                    <asp:HyperLink onClick="return showSubSubCatPopUp(this);" ID="trigger_SubSubCatId" runat="server">Modify</asp:HyperLink>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="displayname" HeaderText="Sub Category Name" />
                                        <asp:BoundField DataField="order" HeaderText="Order Number" />
                                        <asp:TemplateField HeaderText="Required Access">
                                            <ItemTemplate>
                                                <asp:Label runat="server" Style="display: none" Text='<%# Eval("Id") %>'></asp:Label>
                                                <asp:HyperLink onClick="return showSubCatPopUp(this);" ID="trigger_SubCatId" runat="server">Modify</asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="displayname" HeaderText="Category Name" />
                    <asp:BoundField DataField="image" HeaderText="Image Path" />
                    <asp:TemplateField HeaderText="Required Access">
                        <ItemTemplate>
                            <asp:Label runat="server" Style="display: none" Text='<%# Eval("Id") %>'></asp:Label>
                            <asp:HyperLink onClick="return showCatPopUp(this);" ID="trigger_CatId" runat="server">Modify</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div id="dialog" title="Field Properties" style="display: none;">
            <table>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <label>Id:</label>
                                </td>
                                <td>
                                    <input id="FieldId" name="Id" type="text" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Crm Entity Name:</label>
                                </td>
                                <td>
                                    <input id="CrmEntityName" name="CrmEntityName" type="text" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Crm Field Name:</label>
                                </td>
                                <td>
                                    <input id="CrmFieldName" name="CrmFieldName" type="text" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Label Text:</label>
                                </td>
                                <td>
                                    <input id="LabelText" name="LabelText" type="text" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Description:</label>
                                </td>
                                <td>
                                    <input id="Description" name="Description" type="text" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>DefaultValue:</label>
                                </td>
                                <td>
                                    <input id="DefaultValue" name="DefaultValue" type="text" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>DisplayCondition:</label>
                                </td>
                                <td>
                                    <input id="DisplayCondition" name="DisplayCondition" type="text" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Picklist:</label>
                                </td>
                                <td>
                                    <input id="Picklist" name="Picklist" type="text" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>PartsPicklist:</label>
                                </td>
                                <td>
                                    <input id="PartsPicklist" name="PartsPicklist" type="text" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>CalculateFunction:</label>
                                </td>
                                <td>
                                    <input id="CalculateFunction" name="CalculateFunction" type="text" />
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <label>Parent:</label>
                                </td>
                                <td>
                                    <input id="Parent" name="Parent" type="text" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>AssociatedCategory:</label>
                                </td>
                                <td>
                                    <input id="AssociatedCategory" name="AssociatedCategory" type="text" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <label>Is Required:</label>
                                </td>
                                <td>
                                    <form>
                                        <%--<legend>Choose your gender:</legend>--%>
                                        <label for="male1111111">True</label>
                                        <input type="radio" name="IsRequired" id="male1111111" value="true" />
                                        <label for="female111111">False</label>
                                        <input type="radio" name="IsRequired" id="female111111" value="false" />
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Type:</label>
                                </td>
                                <td>
                                    <select name="Type">
                                        <option value="Select">--Select--</option>
                                        <option value="TextBox">TextBox</option>
                                        <option value="DropDown">DropDown</option>
                                        <option value="textboxdropdownhybrid">textboxdropdownhybrid</option>
                                        <option value="NumberPicker">NumberPicker</option>
                                        <option value="Label">Label</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>AllowOnlyHalfPoints:</label>
                                </td>
                                <td>
                                    <form>
                                        <label for="male1">True</label>
                                        <input type="radio" name="AllowOnlyHalfPoints" id="male1" value="true" />
                                        <label for="female1">False</label>
                                        <input type="radio" name="AllowOnlyHalfPoints" id="female1" value="false" />
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>AllowNegative:</label>
                                </td>
                                <td>
                                    <form>
                                        <label for="AllowNegative1">True</label>
                                        <input type="radio" name="AllowNegative" id="AllowNegative1" value="true" />
                                        <label for="AllowNegative2">False</label>
                                        <input type="radio" name="AllowNegative" id="AllowNegative2" value="false" />
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>AllowDecimal:</label>
                                </td>
                                <td>
                                    <form>
                                        <label for="male">True</label>
                                        <input type="radio" name="AllowDecimal" id="male" value="true" />
                                        <label for="female">False</label>
                                        <input type="radio" name="AllowDecimal" id="female" value="false" />
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Visible:</label>
                                </td>
                                <td>
                                    <form>
                                        <fieldset id="dsf" data-role="controlgroup">
                                            <legend>Choose your gender:</legend>
                                            <label for="male111">True</label>
                                            <input type="radio" name="Visible" id="male111" value="true" />
                                            <label for="female121">False</label>
                                            <input type="radio" name="Visible" id="female121" value="false" />
                                        </fieldset>
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Enabled:</label>
                                </td>
                                <td>
                                    <form>
                                        <fieldset id="sdf" data-role="controlgroup1">
                                            <legend>Choose your:</legend>
                                            <label for="male1111">True</label>
                                            <input type="radio" name="Enabled" id="male1111" value="true" />
                                            <label for="female1211">False</label>
                                            <input type="radio" name="Enabled" id="female1211" value="false" />
                                        </fieldset>
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Min Length:</label>

                                </td>
                                <td>
                                    <input type="number" name="MinLength" min="0" max="100" step="1" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Max Length:</label>

                                </td>
                                <td>
                                    <input type="number" name="MaxLength" min="0" max="100" step="1" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>DisplayFormat:</label>

                                </td>
                                <td>
                                    <input id="DisplayFormat" name="DisplayFormat" type="text" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>initialLoad:</label>

                                </td>
                                <td>
                                    <form>
                                        <label for="male111112">True</label>
                                        <input type="radio" name="initialLoad" id="male111112" value="true" />
                                        <label for="female134">False</label>
                                        <input type="radio" name="initialLoad" id="female134" value="false" />
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>PrimaryDisplayForCollection:</label>

                                </td>
                                <td>
                                    <form>
                                        <label for="male1111121">True</label>
                                        <input type="radio" name="PrimaryDisplayForCollection" id="male1111121" value="true" />
                                        <label for="female1341">False</label>
                                        <input type="radio" name="PrimaryDisplayForCollection" id="female1341" value="false" />
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>IsCrmOptionSet:</label>

                                </td>
                                <td>
                                    <form>
                                        <label for="male11111211">True</label>
                                        <input type="radio" name="IsCrmOptionSet" id="male11111211" value="true" />
                                        <label for="female13411">False</label>
                                        <input type="radio" name="IsCrmOptionSet" id="female13411" value="false" />
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>DoNotSendToBackend:</label>

                                </td>
                                <td>
                                    <form>
                                        <label for="male1111121112">True</label>
                                        <input type="radio" name="DoNotSendToBackend" id="male1111121112" value="true" />
                                        <label for="female1341112">False</label>
                                        <input type="radio" name="DoNotSendToBackend" id="female1341112" value="false" />
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>SaveValueInsteadOfKey:</label>

                                </td>
                                <td>
                                    <form>
                                        <label for="male111112111">True</label>
                                        <input type="radio" name="SaveValueInsteadOfKey" id="male111112111" value="true" />
                                        <label for="female134111">False</label>
                                        <input type="radio" name="SaveValueInsteadOfKey" id="female134111" value="false" />
                                    </form>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <label>DVR:</label>
                                </td>
                                <td>
                                    <input id="DVR" name="DVR" type="text" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>DependentField:</label>
                                </td>
                                <td>
                                    <input id="DependentField" name="DependentField" type="text" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>dependentpicklist:</label>
                                </td>
                                <td>
                                    <input id="dependentpicklist" name="dependentpicklist" type="text" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Validation Message:</label>
                                </td>
                                <td>
                                    <input id="RequiredFieldValidationErrorMessage" name="RequiredFieldValidationErrorMessage" type="text" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

        </div>
        <div id="catDialog" title="Cateogory Properties" style="display: none;">
            <table>
                <tr>
                    <td>
                        <label>Id:</label>
                    </td>
                    <td>
                        <%--<label id="FieldId" name="FieldId">te</label>--%>
                        <input id="CatId" name="CatId" type="text" style="width: 150%;" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>displayname:</label>
                    </td>
                    <td>
                        <input id="displayname" name="displayname" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>image:</label>
                    </td>
                    <td>
                        <input id="image" name="image" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>dependentcategoryoncreation:</label>
                    </td>
                    <td>
                        <input id="dependentcategoryoncreation" name="dependentcategoryoncreation" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>displaycondition:</label>
                    </td>
                    <td>
                        <input id="displaycondition" name="displaycondition" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>visible:</label>
                    </td>
                    <td>
                        <form>
                            <%--<legend>Choose your gender:</legend>--%>
                            <label for="visible1">True</label>
                            <input type="radio" name="visible" id="visible1" value="true" />
                            <label for="visible2">False</label>
                            <input type="radio" name="visible" id="visible2" value="false" />
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>enabled:</label>
                    </td>
                    <td>
                        <form>
                            <label for="enabled1">True</label>
                            <input type="radio" name="enabled" id="enabled1" value="true" />
                            <label for="enabled2">False</label>
                            <input type="radio" name="enabled" id="enabled2" value="false" />
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>IgnoreValidation:</label>
                    </td>
                    <td>
                        <form>
                            <label for="IgnoreValidation1">True</label>
                            <input type="radio" name="IgnoreValidation" id="IgnoreValidation1" value="true" />
                            <label for="IgnoreValidation2">False</label>
                            <input type="radio" name="IgnoreValidation" id="IgnoreValidation2" value="false" />
                        </form>
                    </td>
                </tr>
            </table>
        </div>
        <div id="subCatDialog" title="Sub Cateogory Properties" style="display: none;">
            <table>
                <tr>
                    <td>
                        <label>Id:</label>
                    </td>
                    <td>
                        <%--<label id="FieldId" name="FieldId">te</label>--%>
                        <input id="subCatId" name="subCatId" type="text" style="width: 150%;" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>displayname:</label>
                    </td>
                    <td>
                        <input id="subdisplayname" name="displayname" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>visible:</label>
                    </td>
                    <td>
                        <form>
                            <%--<legend>Choose your gender:</legend>--%>
                            <label for="visible1">True</label>
                            <input type="radio" name="visible" id="visible1" value="true" />
                            <label for="visible2">False</label>
                            <input type="radio" name="visible" id="visible2" value="false" />
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>enabled:</label>
                    </td>
                    <td>
                        <form>
                            <label for="enabled1">True</label>
                            <input type="radio" name="enabled" id="enabled1" value="true" />
                            <label for="enabled2">False</label>
                            <input type="radio" name="enabled" id="enabled2" value="false" />
                        </form>
                    </td>
                </tr>
            </table>
        </div>
        <div id="subSubCatDialog" title="Sub Sub Cateogory Properties" style="display: none;">
            <table>
                <tr>
                    <td>
                        <label>Id:</label>
                    </td>
                    <td>
                        <%--<label id="FieldId" name="FieldId">te</label>--%>
                        <input id="subSubCatId" name="CatId" type="text" style="width: 150%;" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>displayname:</label>
                    </td>
                    <td>
                        <input id="subSubdisplayname" name="displayname" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>dependentcategoryoncreation:</label>
                    </td>
                    <td>
                        <input id="subSubdependentcategoryoncreation" name="dependentcategoryoncreation" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>displaycondition:</label>
                    </td>
                    <td>
                        <input id="subSubdisplaycondition" name="displaycondition" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>visible:</label>
                    </td>
                    <td>
                        <form>
                            <%--<legend>Choose your gender:</legend>--%>
                            <label for="visible1">True</label>
                            <input type="radio" name="visible" id="visible1" value="true" />
                            <label for="visible2">False</label>
                            <input type="radio" name="visible" id="visible2" value="false" />
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>enabled:</label>
                    </td>
                    <td>
                        <form>
                            <label for="enabled1">True</label>
                            <input type="radio" name="enabled" id="enabled1" value="true" />
                            <label for="enabled2">False</label>
                            <input type="radio" name="enabled" id="enabled2" value="false" />
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>IgnoreValidation:</label>
                    </td>
                    <td>
                        <form>
                            <label for="IgnoreValidation3">True</label>
                            <input type="radio" name="IgnoreValidation" id="IgnoreValidation3" value="true" />
                            <label for="IgnoreValidation4">False</label>
                            <input type="radio" name="IgnoreValidation" id="IgnoreValidation4" value="false" />
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>AbilityToAdd:</label>
                    </td>
                    <td>
                        <form>
                            <label for="AbilityToAdd3">True</label>
                            <input type="radio" name="AbilityToAdd" id="AbilityToAdd3" value="true" />
                            <label for="AbilityToAdd4">False</label>
                            <input type="radio" name="AbilityToAdd" id="AbilityToAdd4" value="false" />
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>IsRequired:</label>
                    </td>
                    <td>
                        <form>
                            <label for="IsRequired3">True</label>
                            <input type="radio" name="IsRequired" id="IsRequired3" value="true" />
                            <label for="IsRequired4">False</label>
                            <input type="radio" name="IsRequired" id="IsRequired4" value="false" />
                        </form>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
