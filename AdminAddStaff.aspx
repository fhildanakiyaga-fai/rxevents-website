
<%@ Page Title="Add Staff" Language="C#" MasterPageFile="~/Admin.Master"
    AutoEventWireup="true" CodeBehind="AdminAddStaff.aspx.cs"
    Inherits="RxEvents.AdminAddStaff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="<%= ResolveUrl("~/Content/css/admin.css") %>"
        rel="stylesheet" type="text/css" />

    <style>
        .add-staff-page {
            max-width: 1100px;
            margin: 30px auto;
            padding: 0 22px 40px;
            color: #30283a;
        }

        .add-staff-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            margin-bottom: 25px;
        }

        .add-staff-header h1 {
            margin: 0 0 8px;
            font-size: 29px;
            font-weight: 750;
            color: #32143d;
        }

        .add-staff-header p,
        .add-staff-section-title p {
            margin: 0;
            color: #777181;
            font-size: 14px;
        }

        .add-staff-back,
        .add-staff-cancel,
        .add-staff-save {
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

        .add-staff-back {
            background: #f2eaf5;
            color: #631d73;
        }

        .add-staff-back:hover {
            background: #e8d9ee;
            color: #491456;
        }

        .add-staff-message {
            display: block;
            margin-bottom: 18px;
            padding: 12px 16px;
            border-radius: 8px;
        }

        .add-staff-card {
            background: #fff;
            border: 1px solid #eee8f1;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 8px 28px rgba(48, 24, 57, .07);
        }

        .add-staff-section-title {
            padding-bottom: 20px;
            margin-bottom: 25px;
            border-bottom: 1px solid #eee9f1;
        }

        .add-staff-section-title h2 {
            margin: 0 0 7px;
            font-size: 20px;
            color: #3c1947;
        }

        .add-staff-form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 23px;
        }

        .add-staff-field {
            display: flex;
            flex-direction: column;
            gap: 9px;
            min-width: 0;
        }

        .add-staff-field label {
            color: #40384a;
            font-size: 14px;
            font-weight: 650;
        }

        .add-staff-input {
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

        .add-staff-input:focus {
            border-color: #813795;
            box-shadow: 0 0 0 3px rgba(129, 55, 149, .12);
        }

        .add-staff-error {
            color: #c0394b;
            font-size: 12px;
        }

        .add-staff-actions {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 12px;
            margin-top: 30px;
            padding-top: 23px;
            border-top: 1px solid #eee9f1;
        }

        .add-staff-cancel {
            background: #f3f1f5;
            color: #51495b;
        }

        .add-staff-cancel:hover {
            background: #e8e4ec;
        }

        .add-staff-save {
            border: 0;
            background: #631d73;
            color: #fff;
            min-width: 145px;
        }

        .add-staff-save:hover {
            background: #491456;
            box-shadow: 0 5px 13px rgba(99, 29, 115, .2);
        }

        @media (max-width: 650px) {
            .add-staff-page { padding: 0 14px 25px; }

            .add-staff-header {
                align-items: flex-start;
                flex-direction: column;
            }

            .add-staff-header h1 { font-size: 24px; }

            .add-staff-card { padding: 20px 16px; }

            .add-staff-form-grid { grid-template-columns: 1fr; }

            .add-staff-actions {
                flex-direction: column-reverse;
                align-items: stretch;
            }

            .add-staff-actions a,
            .add-staff-actions input {
                width: 100%;
                box-sizing: border-box;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="add-staff-page">

        <div class="add-staff-header">
            <div>
                <h1>
                    <asp:Literal ID="PageHeadingLiteral" runat="server"
                        Text="Add New Staff" />
                </h1>
                <p>Manage staff members and their employment details.</p>
            </div>

            <asp:HyperLink ID="BackToStaffLink" runat="server"
                NavigateUrl="~/AdminStaff.aspx"
                CssClass="add-staff-back">
                &#8592; Back to Staff
            </asp:HyperLink>
        </div>

        <asp:Label ID="StaffMessage" runat="server"
            CssClass="add-staff-message" EnableViewState="false" />

        <div class="add-staff-card">

            <div class="add-staff-section-title">
                <h2>Staff Information</h2>
                <p>Enter the staff member's personal and employment details.</p>
            </div>

            <div class="add-staff-form-grid">

                <div class="add-staff-field">
                    <asp:Label ID="FirstNameLabel" runat="server"
                        AssociatedControlID="FirstNameInput"
                        Text="First Name *" />
                    <asp:TextBox ID="FirstNameInput" runat="server"
                        CssClass="add-staff-input" MaxLength="50"
                        placeholder="Enter first name" />
                    <asp:RequiredFieldValidator ID="FirstNameValidator"
                        runat="server" ControlToValidate="FirstNameInput"
                        ErrorMessage="First name is required."
                        CssClass="add-staff-error" Display="Dynamic" />
                </div>

                <div class="add-staff-field">
                    <asp:Label ID="LastNameLabel" runat="server"
                        AssociatedControlID="LastNameInput"
                        Text="Last Name *" />
                    <asp:TextBox ID="LastNameInput" runat="server"
                        CssClass="add-staff-input" MaxLength="50"
                        placeholder="Enter last name" />
                    <asp:RequiredFieldValidator ID="LastNameValidator"
                        runat="server" ControlToValidate="LastNameInput"
                        ErrorMessage="Last name is required."
                        CssClass="add-staff-error" Display="Dynamic" />
                </div>

                <div class="add-staff-field">
                    <asp:Label ID="StaffEmailLabel" runat="server"
                        AssociatedControlID="StaffEmailInput"
                        Text="Email Address" />
                    <asp:TextBox ID="StaffEmailInput" runat="server"
                        CssClass="add-staff-input" TextMode="Email"
                        MaxLength="100" placeholder="staff@example.com" />
                    <asp:RegularExpressionValidator ID="StaffEmailValidator"
                        runat="server" ControlToValidate="StaffEmailInput"
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                        ErrorMessage="Enter a valid email address."
                        CssClass="add-staff-error" Display="Dynamic" />
                </div>

                <div class="add-staff-field">
                    <asp:Label ID="StaffPhoneLabel" runat="server"
                        AssociatedControlID="StaffPhoneInput"
                        Text="Phone Number" />
                    <asp:TextBox ID="StaffPhoneInput" runat="server"
                        CssClass="add-staff-input" MaxLength="20"
                        placeholder="Enter phone number" />
                </div>

                <div class="add-staff-field">
                    <asp:Label ID="StaffPositionLabel" runat="server"
                        AssociatedControlID="StaffPositionDropdown"
                        Text="Position / Role" />
                    <asp:DropDownList ID="StaffPositionDropdown" runat="server"
                        CssClass="add-staff-input">
                        <asp:ListItem Text="Select Position" Value="" />
                        <asp:ListItem Text="Event Manager" Value="Event Manager" />
                        <asp:ListItem Text="Operations Head" Value="Operations Head" />
                        <asp:ListItem Text="Event Planner" Value="Event Planner" />
                        <asp:ListItem Text="Accountant" Value="Accountant" />
                        <asp:ListItem Text="Marketing Officer" Value="Marketing Officer" />
                        <asp:ListItem Text="Logistics Coordinator" Value="Logistics Coordinator" />
                        <asp:ListItem Text="Customer Support" Value="Customer Support" />
                        <asp:ListItem Text="Technical Lead" Value="Technical Lead" />
                        <asp:ListItem Text="Other" Value="Other" />
                    </asp:DropDownList>
                </div>

                <div class="add-staff-field">
                    <asp:Label ID="HireDateLabel" runat="server"
                        AssociatedControlID="HireDateInput"
                        Text="Hire Date" />
                    <asp:TextBox ID="HireDateInput" runat="server"
                        CssClass="add-staff-input" TextMode="Date" />
                </div>

                <div class="add-staff-field">
                    <asp:Label ID="StaffStatusLabel" runat="server"
                        AssociatedControlID="StaffStatusDropdown"
                        Text="Employment Status" />
                    <asp:DropDownList ID="StaffStatusDropdown" runat="server"
                        CssClass="add-staff-input">
                        <asp:ListItem Text="Active" Value="1" />
                        <asp:ListItem Text="Inactive" Value="0" />
                    </asp:DropDownList>
                </div>

            </div>

            <div class="add-staff-actions">

                <asp:HyperLink ID="CancelStaffLink" runat="server"
                    NavigateUrl="~/AdminStaff.aspx"
                    CssClass="add-staff-cancel">
                    Cancel
                </asp:HyperLink>

                <asp:Button ID="SaveStaffButton" runat="server"
                    Text="Save Staff"
                    CssClass="add-staff-save"
                    OnClick="SaveStaffButton_Click" />

            </div>

        </div>
    </div>

</asp:Content>
