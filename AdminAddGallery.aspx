
<%@ Page Title="Add Gallery Image" Language="C#" MasterPageFile="~/Admin.Master"
    AutoEventWireup="true" CodeBehind="AdminAddGallery.aspx.cs"
    Inherits="RxEvents.AdminAddGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="<%= ResolveUrl("~/Content/css/admin.css") %>"
        rel="stylesheet" type="text/css" />

    <style>
        /* ================= RX EVENTS GALLERY UI ================= */

        .rx-gallery-page {
            --purple: #631D73;
            --purple-dark: #491456;
            --ink: #30243a;
            --muted: #81788a;
            --border: #eee6f0;
            max-width: 1180px;
            margin: 0 auto;
            padding: 30px;
            color: var(--ink);
            box-sizing: border-box;
        }

        .rx-gallery-page *,
        .rx-gallery-page *::before,
        .rx-gallery-page *::after {
            box-sizing: border-box;
        }

        /* PAGE HEADER */

        .rx-gallery-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            margin-bottom: 26px;
        }

        .rx-gallery-eyebrow {
            display: block;
            margin-bottom: 8px;
            color: var(--purple);
            font-size: 11px;
            font-weight: 800;
            letter-spacing: 1.4px;
            text-transform: uppercase;
        }

        .rx-gallery-title {
            margin: 0;
            color: #30243a;
            font-size: 28px;
            font-weight: 750;
            line-height: 1.25;
        }

        .rx-gallery-subtitle {
            margin: 8px 0 0;
            color: var(--muted);
            font-size: 14px;
            line-height: 1.6;
        }

        .rx-gallery-back {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            min-height: 43px;
            padding: 0 17px;
            border: 1px solid #e4d8e8;
            border-radius: 9px;
            background: #fff;
            color: var(--purple) !important;
            font-size: 13px;
            font-weight: 700;
            text-decoration: none;
            white-space: nowrap;
            transition: .2s ease;
        }

        .rx-gallery-back:hover {
            border-color: #c9afd0;
            background: #faf5fb;
            color: var(--purple-dark) !important;
            text-decoration: none;
            transform: translateY(-1px);
        }

        /* MESSAGE */

        .rx-gallery-message {
            display: block;
            margin: 0 0 20px;
            padding: 12px 15px;
            border: 1px solid #ead8ed;
            border-radius: 9px;
            background: #fbf5fc;
            color: var(--purple);
            font-size: 13px;
            line-height: 1.5;
        }

        .rx-gallery-message:empty {
            display: none;
        }

        /* MAIN CARD */

        .rx-gallery-card {
            max-width: 940px;
            overflow: hidden;
            border: 1px solid var(--border);
            border-radius: 15px;
            background: #fff;
            box-shadow: 0 8px 28px rgba(50,20,60,.055);
        }

        .rx-gallery-card-heading {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 24px 28px;
            border-bottom: 1px solid #f0eaf2;
            background: linear-gradient(110deg,#fff,#fdfafd);
        }

        .rx-gallery-icon {
            display: flex;
            flex: 0 0 46px;
            align-items: center;
            justify-content: center;
            width: 46px;
            height: 46px;
            border-radius: 12px;
            background: #f5edf7;
            color: var(--purple);
            font-size: 21px;
        }

        .rx-gallery-card-heading h2 {
            margin: 0;
            color: var(--purple);
            font-size: 18px;
            font-weight: 750;
        }

        .rx-gallery-card-heading p {
            margin: 5px 0 0;
            color: var(--muted);
            font-size: 12px;
        }

        .rx-gallery-card-body {
            padding: 28px;
        }

        /* FORM SECTION */

        .rx-gallery-section-heading {
            display: flex;
            align-items: center;
            gap: 11px;
            margin-bottom: 22px;
        }

        .rx-gallery-section-number {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 30px;
            height: 30px;
            border-radius: 8px;
            background: #f5edf7;
            color: var(--purple);
            font-size: 12px;
            font-weight: 800;
        }

        .rx-gallery-section-heading h3 {
            margin: 0;
            color: #493951;
            font-size: 15px;
            font-weight: 750;
        }

        .rx-gallery-section-heading p {
            margin: 4px 0 0;
            color: #92899a;
            font-size: 11px;
        }

        /* FORM GRID */

        .rx-gallery-grid {
            display: grid;
            grid-template-columns: repeat(2,minmax(0,1fr));
            gap: 22px 24px;
        }

        .rx-gallery-field {
            display: flex;
            flex-direction: column;
            min-width: 0;
            gap: 8px;
        }

        .rx-gallery-field.full-width {
            grid-column: 1 / -1;
        }

        .rx-gallery-field label {
            color: #493951;
            font-size: 12px;
            font-weight: 700;
            line-height: 1.4;
        }

        /* INPUTS AND DROPDOWNS */

        .rx-gallery-control {
            display: block;
            width: 100%;
            min-width: 0;
            min-height: 45px;
            padding: 11px 13px;
            border: 1px solid #e5dce9;
            border-radius: 8px;
            outline: none;
            background: #fcfafd;
            color: #34263d;
            font-family: inherit;
            font-size: 13px;
            transition: .2s ease;
        }

        .rx-gallery-control::placeholder {
            color: #a79cab;
        }

        .rx-gallery-control:hover {
            border-color: #cbb8d1;
        }

        .rx-gallery-control:focus {
            border-color: #8d4b9a;
            background: #fff;
            box-shadow: 0 0 0 3px rgba(99,29,115,.09);
        }

        select.rx-gallery-control {
            cursor: pointer;
        }

        /* IMAGE UPLOAD */

        .rx-gallery-upload {
            display: block;
            width: 100%;
            min-height: 76px;
            padding: 17px;
            border: 1px dashed #b88ac1;
            border-radius: 10px;
            background: #faf7fb;
            color: #66566d;
            font-family: inherit;
            font-size: 13px;
            cursor: pointer;
            transition: .2s ease;
        }

        .rx-gallery-upload:hover {
            border-color: var(--purple);
            background: #f8f1fa;
        }

        .rx-gallery-upload:focus {
            outline: 3px solid rgba(99,29,115,.12);
            outline-offset: 2px;
        }

        .rx-gallery-upload::file-selector-button {
            margin-right: 13px;
            padding: 9px 13px;
            border: 0;
            border-radius: 6px;
            background: var(--purple);
            color: #fff;
            font-size: 12px;
            font-weight: 700;
            cursor: pointer;
        }

        .rx-gallery-help {
            color: #92899a;
            font-size: 11px;
            line-height: 1.6;
        }

        .rx-gallery-error {
            color: #c03945;
            font-size: 12px;
            line-height: 1.45;
        }

        /* FOOTER */

        .rx-gallery-required {
            margin: 23px 0 0;
            color: #92899a;
            font-size: 11px;
        }

        .rx-gallery-required strong {
            color: #c03945;
        }

        .rx-gallery-actions {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 25px;
            padding-top: 22px;
            border-top: 1px solid #f0eaf2;
        }

        .rx-gallery-cancel,
        .rx-gallery-save {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 125px;
            min-height: 44px;
            padding: 0 21px;
            border-radius: 8px;
            font-family: inherit;
            font-size: 12px;
            font-weight: 750;
            text-decoration: none;
            cursor: pointer;
            transition: .2s ease;
        }

        .rx-gallery-cancel {
            border: 1px solid #e7dfea;
            background: #f5f1f6;
            color: #66566d !important;
        }

        .rx-gallery-cancel:hover {
            border-color: #d9c9de;
            background: #ece5ef;
            color: #493951 !important;
            text-decoration: none;
        }

        .rx-gallery-save {
            border: 1px solid var(--purple);
            background: var(--purple);
            color: #fff;
            box-shadow: 0 4px 10px rgba(99,29,115,.16);
        }

        .rx-gallery-save:hover {
            border-color: var(--purple-dark);
            background: var(--purple-dark);
            color: #fff;
            box-shadow: 0 6px 14px rgba(99,29,115,.2);
            transform: translateY(-1px);
        }

        .rx-gallery-save:focus,
        .rx-gallery-cancel:focus {
            outline: 3px solid rgba(99,29,115,.14);
            outline-offset: 2px;
        }

        /* RESPONSIVE DESIGN */

        @media(max-width:760px) {
            .rx-gallery-page {
                padding: 22px;
            }

            .rx-gallery-card-body {
                padding: 24px;
            }
        }

        @media(max-width:650px) {
            .rx-gallery-page {
                padding: 16px 12px;
            }

            .rx-gallery-header {
                align-items: flex-start;
                flex-direction: column;
                gap: 15px;
            }

            .rx-gallery-title {
                font-size: 24px;
            }

            .rx-gallery-card-heading,
            .rx-gallery-card-body {
                padding: 20px;
            }

            .rx-gallery-grid {
                grid-template-columns: minmax(0,1fr);
                gap: 19px;
            }

            .rx-gallery-field.full-width {
                grid-column: auto;
            }

            .rx-gallery-actions {
                flex-direction: column-reverse;
                align-items: stretch;
            }

            .rx-gallery-cancel,
            .rx-gallery-save {
                width: 100%;
                text-align: center;
            }
        }

        @media(max-width:380px) {
            .rx-gallery-page {
                padding: 11px;
            }

            .rx-gallery-card-body {
                padding: 16px;
            }

            .rx-gallery-title {
                font-size: 22px;
            }

            .rx-gallery-back {
                width: 100%;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="rx-gallery-page">

        <!-- PAGE HEADER -->
        <div class="rx-gallery-header">
            <div>
                <span class="rx-gallery-eyebrow">Gallery Management</span>

                <h1 class="rx-gallery-title">
                    <asp:Literal ID="PageHeadingLiteral" runat="server"
                        Text="Add Gallery Image" />
                </h1>

                <p class="rx-gallery-subtitle">
                    Upload and manage images from your events.
                </p>
            </div>

            <asp:HyperLink ID="BackToGalleryLink" runat="server"
                NavigateUrl="~/AdminGallery.aspx"
                CssClass="rx-gallery-back">
                <span aria-hidden="true">&#8592;</span>
                Back to Gallery
            </asp:HyperLink>
        </div>

        <!-- MESSAGE AREA -->
        <asp:Label ID="GalleryFormMessage" runat="server"
            CssClass="rx-gallery-message"
            EnableViewState="false" />

        <!-- MAIN CARD -->
        <div class="rx-gallery-card">

            <div class="rx-gallery-card-heading">
                <div class="rx-gallery-icon" aria-hidden="true">
                    &#128444;
                </div>

                <div>
                    <h2>Image Information</h2>
                    <p>Choose an event and provide the image details.</p>
                </div>
            </div>

            <div class="rx-gallery-card-body">

                <section class="rx-gallery-section">

                    <div class="rx-gallery-section-heading">
                        <span class="rx-gallery-section-number">01</span>

                        <div>
                            <h3>Gallery Image Details</h3>
                            <p>Enter the information that will appear with the image.</p>
                        </div>
                    </div>

                    <div class="rx-gallery-grid">

                        <!-- EVENT -->
                        <div class="rx-gallery-field">

                            <asp:Label ID="GalleryEventLabel" runat="server"
                                AssociatedControlID="GalleryEventDropdown"
                                Text="Event *" />

                            <asp:DropDownList ID="GalleryEventDropdown" runat="server"
                                CssClass="rx-gallery-control">
                                <asp:ListItem Text="Select an event" Value="" />
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="GalleryEventValidator"
                                runat="server"
                                ControlToValidate="GalleryEventDropdown"
                                InitialValue=""
                                ErrorMessage="Please select an event."
                                CssClass="rx-gallery-error"
                                Display="Dynamic"
                                ValidationGroup="GalleryForm" />

                        </div>

                        <!-- CAPTION -->
                        <div class="rx-gallery-field">

                            <asp:Label ID="GalleryCaptionLabel" runat="server"
                                AssociatedControlID="GalleryCaptionInput"
                                Text="Image Caption" />

                            <asp:TextBox ID="GalleryCaptionInput" runat="server"
                                CssClass="rx-gallery-control"
                                MaxLength="255"
                                placeholder="Enter a short caption" />

                            <span class="rx-gallery-help">
                                Optional caption displayed with the gallery image.
                            </span>

                        </div>

                        <!-- IMAGE UPLOAD -->
                        <div class="rx-gallery-field full-width">

                            <asp:Label ID="GalleryImageLabel" runat="server"
                                AssociatedControlID="GalleryImageUpload"
                                Text="Choose Image *" />

                            <asp:FileUpload ID="GalleryImageUpload" runat="server"
                                CssClass="rx-gallery-upload" />

                            <asp:Label ID="GalleryImageHelp" runat="server"
                                CssClass="rx-gallery-help"
                                Text="Allowed formats: JPG, JPEG, PNG, and WEBP. Maximum size: 5 MB." />

                            <asp:CustomValidator ID="GalleryImageValidator"
                                runat="server"
                                ErrorMessage="Please select a valid image."
                                CssClass="rx-gallery-error"
                                Display="Dynamic"
                                OnServerValidate="GalleryImageValidator_ServerValidate"
                                ValidationGroup="GalleryForm" />

                        </div>

                        <!-- IMAGE STATUS -->
                        <div class="rx-gallery-field">

                            <asp:Label ID="GalleryStatusLabel" runat="server"
                                AssociatedControlID="GalleryStatusDropdown"
                                Text="Image Status" />

                            <asp:DropDownList ID="GalleryStatusDropdown" runat="server"
                                CssClass="rx-gallery-control">

                                <asp:ListItem Text="Active" Value="1" />
                                <asp:ListItem Text="Inactive" Value="0" />

                            </asp:DropDownList>

                            <span class="rx-gallery-help">
                                Active images can be displayed in the public gallery.
                            </span>

                        </div>

                    </div>
                </section>

                <!-- FORM FOOTER -->
                <p class="rx-gallery-required">
                    <strong>*</strong> Required fields must be completed.
                </p>

                <div class="rx-gallery-actions">

                    <asp:HyperLink ID="CancelGalleryLink" runat="server"
                        NavigateUrl="~/AdminGallery.aspx"
                        CssClass="rx-gallery-cancel">
                        Cancel
                    </asp:HyperLink>

                    <asp:Button ID="SaveGalleryButton" runat="server"
                        Text="Save Image"
                        CssClass="rx-gallery-save"
                        ValidationGroup="GalleryForm"
                        OnClick="SaveGalleryButton_Click" />

                </div>

            </div>
        </div>
    </div>

</asp:Content>
