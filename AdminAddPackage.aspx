
<%@ Page Title="Add Package" Language="C#" MasterPageFile="~/Admin.Master"
    AutoEventWireup="true" CodeBehind="AdminAddPackage.aspx.cs"
    Inherits="RxEvents.AdminAddPackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="<%= ResolveUrl("~/Content/css/admin.css") %>" rel="stylesheet" />

    <style>
        .add-package-page {
            max-width: 1100px;
            margin: 30px auto;
            padding: 0 22px 40px;
            color: #292536;
        }

        .add-package-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            margin-bottom: 25px;
        }

        .add-package-header h1 {
            margin: 0 0 8px;
            font-size: 29px;
            font-weight: 750;
            color: #32143d;
        }

        .add-package-header p,
        .add-package-section-title p {
            margin: 0;
            color: #777181;
            font-size: 14px;
        }

        .add-package-back, .add-package-cancel,
        .add-package-save {
            display: inline-flex;
            justify-content: center;
            align-items: center;
            padding: 11px 21px;
            border-radius: 9px;
            font-size: 14px;
            font-weight: 650;
            text-decoration: none;
            cursor: pointer;
            transition: .2s ease;
        }

        .add-package-back {
            background: #f2eaf5;
            color: #631d73;
        }

        .add-package-back:hover {
            background: #e8d9ee;
            color: #491456;
        }

        .add-package-message {
            display: block;
            margin-bottom: 18px;
            padding: 12px 16px;
            border-radius: 8px;
        }

        .add-package-card {
            background: #fff;
            border: 1px solid #eee8f1;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 8px 28px rgba(48, 24, 57, .07);
        }

        .add-package-section-title {
            padding-bottom: 20px;
            margin-bottom: 25px;
            border-bottom: 1px solid #eee9f1;
        }

        .add-package-section-title h2 {
            margin: 0 0 7px;
            font-size: 20px;
            color: #3c1947;
        }

        .add-package-form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 23px;
        }

        .add-package-field {
            display: flex;
            flex-direction: column;
            gap: 9px;
            min-width: 0;
        }

        .add-package-field label {
            color: #40384a;
            font-size: 14px;
            font-weight: 650;
        }

        .add-package-input {
            width: 100%;
            box-sizing: border-box;
            min-height: 45px;
            padding: 11px 13px;
            border: 1px solid #ddd5e2;
            border-radius: 8px;
            background: #fff;
            color: #30283a;
            font: inherit;
            font-size: 14px;
            outline: none;
            transition: border-color .2s, box-shadow .2s;
        }

        .add-package-input:focus {
            border-color: #813795;
            box-shadow: 0 0 0 3px rgba(129, 55, 149, .12);
        }

        textarea.add-package-input {
            min-height: 125px;
            resize: vertical;
        }

        .add-package-full {
            grid-column: 1 / -1;
        }

        .add-package-help {
            margin: 0;
            color: #81798a;
            font-size: 12px;
            line-height: 1.6;
        }

        .add-package-error {
            color: #c0394b;
            font-size: 12px;
        }

        .add-package-actions {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 12px;
            margin-top: 30px;
            padding-top: 23px;
            border-top: 1px solid #eee9f1;
        }

        .add-package-cancel {
            background: #f3f1f5;
            color: #51495b;
        }

        .add-package-cancel:hover {
            background: #e8e4ec;
        }

        .add-package-save {
            border: 0;
            background: #631d73;
            color: #fff;
            min-width: 145px;
        }

        .add-package-save:hover {
            background: #491456;
            box-shadow: 0 5px 13px rgba(99, 29, 115, .2);
        }

        @media (max-width: 650px) {
            .add-package-page { padding: 0 14px 25px; }
            .add-package-header {
                align-items: flex-start;
                flex-direction: column;
            }
            .add-package-header h1 { font-size: 24px; }
            .add-package-card { padding: 20px 16px; }
            .add-package-form-grid { grid-template-columns: 1fr; }
            .add-package-full { grid-column: auto; }
            .add-package-actions {
                flex-direction: column-reverse;
                align-items: stretch;
            }
            .add-package-actions a,
            .add-package-actions input { width: 100%; box-sizing: border-box; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="add-package-page">

        <div class="add-package-header">
            <div>
                <h1>
                    <asp:Literal ID="PageHeadingLiteral" runat="server"
                        Text="Add New Package" />
                </h1>
                <p>Create and manage event packages for your customers.</p>
            </div>

            <asp:HyperLink ID="BackToPackagesLink" runat="server"
                NavigateUrl="~/AdminPackages.aspx"
                CssClass="add-package-back">
                &#8592; Back to Packages
            </asp:HyperLink>
        </div>

        <asp:Label ID="PackageMessage" runat="server"
            CssClass="add-package-message" EnableViewState="false" />

        <div class="add-package-card">

            <div class="add-package-section-title">
                <h2>Package Information</h2>
                <p>Complete the details below to create your event package.</p>
            </div>

            <div class="add-package-form-grid">

                <div class="add-package-field">
                    <asp:Label ID="PackageNameLabel" runat="server"
                        AssociatedControlID="PackageNameInput"
                        Text="Package Name *" />
                    <asp:TextBox ID="PackageNameInput" runat="server"
                        CssClass="add-package-input" MaxLength="100"
                        placeholder="e.g. Platinum Package" />
                    <asp:RequiredFieldValidator ID="PackageNameValidator"
                        runat="server" ControlToValidate="PackageNameInput"
                        ErrorMessage="Package name is required."
                        CssClass="add-package-error" Display="Dynamic" />
                </div>

                <div class="add-package-field">
                    <asp:Label ID="PackageTypeLabel" runat="server"
                        AssociatedControlID="PackageTypeDropdown"
                        Text="Package Type *" />
                    <asp:DropDownList ID="PackageTypeDropdown" runat="server"
                        CssClass="add-package-input">
                        <asp:ListItem Text="Select package type" Value="" />
                        <asp:ListItem Text="Premium++" Value="Premium++" />
                        <asp:ListItem Text="Premium" Value="Premium" />
                        <asp:ListItem Text="Standard" Value="Standard" />
                        <asp:ListItem Text="Basic" Value="Basic" />
                        <asp:ListItem Text="Custom" Value="Custom" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="PackageTypeValidator"
                        runat="server" ControlToValidate="PackageTypeDropdown"
                        InitialValue="" ErrorMessage="Please select a package type."
                        CssClass="add-package-error" Display="Dynamic" />
                </div>

                <div class="add-package-field add-package-full">
                    <asp:Label ID="PackageDescriptionLabel" runat="server"
                        AssociatedControlID="PackageDescriptionInput"
                        Text="Package Description" />
                    <asp:TextBox ID="PackageDescriptionInput" runat="server"
                        CssClass="add-package-input" TextMode="MultiLine"
                        Rows="5" MaxLength="500"
                        placeholder="Describe what this package offers..." />
                </div>

                <div class="add-package-field">
                    <asp:Label ID="PackagePriceLabel" runat="server"
                        AssociatedControlID="PackagePriceInput"
                        Text="Package Price *" />
                    <asp:TextBox ID="PackagePriceInput" runat="server"
                        CssClass="add-package-input" TextMode="Number"
                        placeholder="Enter package price" />
                    <asp:RequiredFieldValidator ID="PackagePriceRequiredValidator"
                        runat="server" ControlToValidate="PackagePriceInput"
                        ErrorMessage="Package price is required."
                        CssClass="add-package-error" Display="Dynamic" />
                    <asp:RangeValidator ID="PackagePriceRangeValidator"
                        runat="server" ControlToValidate="PackagePriceInput"
                        Type="Double" MinimumValue="0" MaximumValue="999999999"
                        ErrorMessage="Enter a valid non-negative price."
                        CssClass="add-package-error" Display="Dynamic" />
                </div>

                <div class="add-package-field">
                    <asp:Label ID="PackageStatusLabel" runat="server"
                        AssociatedControlID="PackageStatusDropdown"
                        Text="Package Status" />
                    <asp:DropDownList ID="PackageStatusDropdown" runat="server"
                        CssClass="add-package-input">
                        <asp:ListItem Text="Active" Value="1" />
                        <asp:ListItem Text="Inactive" Value="0" />
                    </asp:DropDownList>
                </div>

                <div class="add-package-field add-package-full">
                    <asp:Label ID="PackageImageLabel" runat="server"
                        AssociatedControlID="PackageImageInput"
                        Text="Package Image" />
                    <asp:FileUpload ID="PackageImageInput" runat="server"
                        CssClass="add-package-input" />
                    <p class="add-package-help">
                        Upload an image for this package. If you edit a package
                        without selecting a new image, the existing image will be kept.
                    </p>
                </div>

            </div>

            <div class="add-package-actions">
                <asp:HyperLink ID="CancelPackageLink" runat="server"
                    NavigateUrl="~/AdminPackages.aspx"
                    CssClass="add-package-cancel">
                    Cancel
                </asp:HyperLink>

                <asp:Button ID="SavePackageButton" runat="server"
                    Text="Save Package"
                    CssClass="add-package-save"
                    OnClick="SavePackageButton_Click" />
            </div>

        </div>
    </div>

</asp:Content>
