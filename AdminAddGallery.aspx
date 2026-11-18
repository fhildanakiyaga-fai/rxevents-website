
<%@ Page Title="Add Gallery Image" Language="C#" MasterPageFile="~/Admin.Master"
    AutoEventWireup="true" CodeBehind="AdminAddGallery.aspx.cs"
    Inherits="RxEvents.AdminAddGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="<%= ResolveUrl("~/Content/css/admin.css") %>"
        rel="stylesheet" type="text/css" />

    <style>
        .add-gallery-page { padding: 30px; color: #30243a; }
        .add-gallery-header { margin-bottom: 28px; }
        .add-gallery-header h1 { color: #631D73; font-size: 27px; font-weight: 700; }
        .add-gallery-header p { color: #81788a; font-size: 14px; }
        .add-gallery-back {
            display: inline-block; padding: 11px 18px;
            background: #631D73; color: white !important;
            border-radius: 8px; text-decoration: none;
            font-size: 13px; font-weight: 600; transition: .2s;
        }
        .add-gallery-back:hover, .add-gallery-save:hover {
            background: #491456; transform: translateY(-2px);
        }
        .add-gallery-card {
            max-width: 900px; background: white;
            border: 1px solid #eee6f0; border-radius: 14px;
            padding: 32px; box-shadow: 0 6px 24px rgba(50,20,60,.06);
        }
        .add-gallery-section-title {
            padding-bottom: 20px; margin-bottom: 25px;
            border-bottom: 1px solid #eee8f1;
        }
        .add-gallery-section-title h2 {
            color: #631D73; font-size: 20px; margin: 0 0 7px;
        }
        .add-gallery-section-title p {
            color: #898092; font-size: 13px; margin: 0;
        }
        .add-gallery-form-grid {
            display: grid; grid-template-columns: 1fr 1fr;
            gap: 24px;
        }
        .add-gallery-field { display: flex; flex-direction: column; gap: 9px; }
        .add-gallery-field > label {
            color: #493951; font-size: 13px; font-weight: 600;
        }
        .add-gallery-input {
            width: 100%; padding: 12px 14px;
            border: 1px solid #e5dce9; border-radius: 8px;
            background: #fcfafd; color: #34263d;
            font-size: 13px; outline: none; transition: .2s;
        }
        .add-gallery-input:focus {
            border-color: #8d4b9a; background: white;
            box-shadow: 0 0 0 3px rgba(99,29,115,.08);
        }
        .add-gallery-full-width { grid-column: span 2; }
        .add-gallery-file {
            width: 100%; padding: 17px;
            background: #faf7fb; border: 1px dashed #b88ac1;
            border-radius: 10px; color: #66566d;
            font-size: 13px; cursor: pointer;
        }
        .add-gallery-file::file-selector-button {
            background: #631D73; color: white; border: none;
            border-radius: 6px; padding: 9px 13px;
            margin-right: 13px; cursor: pointer;
        }
        .add-gallery-help { color: #92899a; font-size: 12px; line-height: 1.6; }
        .add-gallery-error { color: #c03945; font-size: 12px; }
        .add-gallery-message {
            display: block; margin-bottom: 18px;
            color: #631D73; font-size: 13px;
        }
        .add-gallery-actions {
            display: flex; justify-content: flex-end;
            align-items: center; gap: 13px;
            margin-top: 32px; padding-top: 22px;
            border-top: 1px solid #eee8f1;
        }
        .add-gallery-cancel, .add-gallery-save {
            padding: 12px 23px; border-radius: 8px;
            font-size: 13px; font-weight: 600;
            text-decoration: none; cursor: pointer; transition: .2s;
        }
        .add-gallery-cancel {
            color: #66566d !important; background: #f3eff5;
        }
        .add-gallery-cancel:hover { background: #e9e0ed; }
        .add-gallery-save {
            background: #631D73; color: white;
            border: none;
        }
        @media(max-width:650px) {
            .add-gallery-page { padding: 18px 12px; }
            .add-gallery-card { padding: 22px 16px; }
            .add-gallery-form-grid { grid-template-columns: 1fr; gap: 19px; }
            .add-gallery-full-width { grid-column: span 1; }
            .add-gallery-actions { flex-direction: column-reverse; }
            .add-gallery-cancel, .add-gallery-save {
                width: 100%; text-align: center;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="add-gallery-page">

        <div class="add-gallery-header">
            <div>
                <h1>
                    <asp:Literal ID="PageHeadingLiteral" runat="server"
                        Text="Add Gallery Image" />
                </h1>
                <p>Upload and manage images for your events.</p>
            </div>

            <asp:HyperLink ID="BackToGalleryLink" runat="server"
                NavigateUrl="~/AdminGallery.aspx"
                CssClass="add-gallery-back">
                &#8592; Back to Gallery
            </asp:HyperLink>
        </div>

        <asp:Label ID="GalleryFormMessage" runat="server"
            CssClass="add-gallery-message"
            EnableViewState="false" />

        <div class="add-gallery-card">

            <div class="add-gallery-section-title">
                <h2>Image Information</h2>
                <p>Choose an event and provide the image details.</p>
            </div>

            <div class="add-gallery-form-grid">

                <div class="add-gallery-field">
                    <asp:Label ID="GalleryEventLabel" runat="server"
                        AssociatedControlID="GalleryEventDropdown"
                        Text="Event *" />

                    <asp:DropDownList ID="GalleryEventDropdown" runat="server"
                        CssClass="add-gallery-input">
                        <asp:ListItem Text="Select an event" Value="" />
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="GalleryEventValidator"
                        runat="server" ControlToValidate="GalleryEventDropdown"
                        InitialValue="" ErrorMessage="Please select an event."
                        CssClass="add-gallery-error" Display="Dynamic" />
                </div>

                <div class="add-gallery-field">
                    <asp:Label ID="GalleryCaptionLabel" runat="server"
                        AssociatedControlID="GalleryCaptionInput"
                        Text="Image Caption" />

                    <asp:TextBox ID="GalleryCaptionInput" runat="server"
                        CssClass="add-gallery-input" MaxLength="255"
                        placeholder="Enter a short caption" />
                </div>

                <div class="add-gallery-field add-gallery-full-width">
                    <asp:Label ID="GalleryImageLabel" runat="server"
                        AssociatedControlID="GalleryImageUpload"
                        Text="Choose Image *" />

                    <asp:FileUpload ID="GalleryImageUpload" runat="server"
                        CssClass="add-gallery-file" />

                    <asp:Label ID="GalleryImageHelp" runat="server"
                        CssClass="add-gallery-help"
                        Text="Allowed formats: JPG, JPEG, PNG, and WEBP. Maximum size: 5 MB." />

                    <asp:CustomValidator ID="GalleryImageValidator" runat="server"
                        ErrorMessage="Please select a valid image."
                        CssClass="add-gallery-error" Display="Dynamic"
                        OnServerValidate="GalleryImageValidator_ServerValidate"
                        ValidationGroup="GalleryForm" />
                </div>

                <div class="add-gallery-field">
                    <asp:Label ID="GalleryStatusLabel" runat="server"
                        AssociatedControlID="GalleryStatusDropdown"
                        Text="Image Status" />

                    <asp:DropDownList ID="GalleryStatusDropdown" runat="server"
                        CssClass="add-gallery-input">
                        <asp:ListItem Text="Active" Value="1" />
                        <asp:ListItem Text="Inactive" Value="0" />
                    </asp:DropDownList>
                </div>

            </div>

            <div class="add-gallery-actions">

                <asp:HyperLink ID="CancelGalleryLink" runat="server"
                    NavigateUrl="~/AdminGallery.aspx"
                    CssClass="add-gallery-cancel">
                    Cancel
                </asp:HyperLink>

                <asp:Button ID="SaveGalleryButton" runat="server"
                    Text="Save Image"
                    CssClass="add-gallery-save"
                    ValidationGroup="GalleryForm"
                    OnClick="SaveGalleryButton_Click" />

            </div>

        </div>

    </div>

</asp:Content>
