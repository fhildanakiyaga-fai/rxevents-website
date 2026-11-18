
<%@ Page Title="Add New Booking"
    Language="C#"
    MasterPageFile="~/Admin.Master"
    AutoEventWireup="true"
    CodeBehind="AdminAddBooking.aspx.cs"
    Inherits="RxEvents.AdminAddBooking" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="MainContent"
    runat="server">

<style>
    .add-booking-page {
        max-width: 1200px;
        margin: 0 auto;
        padding: 30px;
        color: #243047;
    }

    .add-booking-heading {
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
        gap: 20px;
        margin-bottom: 28px;
    }

    .add-booking-heading h2 {
        font-size: 28px;
        font-weight: 700;
        margin: 0 0 8px;
        color: #17233c;
    }

    .add-booking-heading p {
        margin: 0;
        color: #788399;
        font-size: 14px;
    }

    .booking-back-button {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 11px 20px;
        border: 1px solid #dce2eb;
        border-radius: 9px;
        background: #ffffff;
        color: #34415b;
        text-decoration: none;
        font-size: 14px;
        font-weight: 600;
        transition: all .2s ease;
    }

    .booking-back-button:hover {
        background: #f1f5fb;
        color: #2458c6;
        border-color: #b9c9e8;
    }

    .booking-form-message {
        display: block;
        margin-bottom: 20px;
        padding: 12px 16px;
        border-radius: 8px;
        font-size: 14px;
    }

    .add-booking-card {
        background: #ffffff;
        border: 1px solid #e8ecf2;
        border-radius: 14px;
        padding: 30px;
        box-shadow: 0 5px 20px rgba(28, 43, 70, .05);
    }

    .booking-section-heading {
        display: flex;
        align-items: center;
        gap: 13px;
        margin-bottom: 28px;
        padding-bottom: 20px;
        border-bottom: 1px solid #edf0f5;
    }

    .booking-section-icon {
        width: 43px;
        height: 43px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 11px;
        background: #edf3ff;
        color: #3565c9;
        font-size: 20px;
    }

    .booking-section-heading h3 {
        font-size: 18px;
        font-weight: 700;
        color: #243047;
        margin: 0 0 5px;
    }

    .booking-section-heading p {
        color: #8a94a6;
        font-size: 13px;
        margin: 0;
    }

    .add-booking-grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 23px 25px;
    }

    .booking-form-field {
        display: flex;
        flex-direction: column;
        gap: 9px;
        min-width: 0;
    }

    .booking-form-field label {
        color: #34415b;
        font-size: 13px;
        font-weight: 600;
    }

    .booking-form-control {
        width: 100%;
        min-height: 46px;
        box-sizing: border-box;
        padding: 11px 14px;
        border: 1px solid #dfe4ed;
        border-radius: 8px;
        background-color: #ffffff;
        color: #26334b;
        font-family: inherit;
        font-size: 14px;
        outline: none;
        transition: border-color .2s, box-shadow .2s;
    }

    .booking-form-control::placeholder {
        color: #a4adbd;
    }

    .booking-form-control:focus {
        border-color: #4777d5;
        box-shadow: 0 0 0 3px rgba(71, 119, 213, .12);
    }

    .booking-form-control:hover {
        border-color: #b9c5d8;
    }

    select.booking-form-control {
        cursor: pointer;
    }

    textarea.booking-form-control {
        min-height: 115px;
        resize: vertical;
        line-height: 1.6;
    }

    .full-width {
        grid-column: 1 / -1;
    }

    .booking-divider {
        border: 0;
        border-top: 1px solid #edf0f5;
        margin: 30px 0;
    }

    .booking-subheading {
        color: #26334b;
        font-size: 16px;
        font-weight: 700;
        margin: 0 0 22px;
    }

    .booking-status-hint {
        color: #8993a5;
        font-size: 12px;
        margin-top: 2px;
    }

    .add-booking-actions {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 13px;
        margin-top: 32px;
        padding-top: 24px;
        border-top: 1px solid #edf0f5;
    }

    .booking-cancel-button,
    .booking-save-button {
        min-height: 46px;
        padding: 0 25px;
        border-radius: 8px;
        font-family: inherit;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        transition: all .2s ease;
    }

    .booking-cancel-button {
        background: #ffffff;
        color: #596579;
        border: 1px solid #dce2eb;
    }

    .booking-cancel-button:hover {
        background: #f4f6f9;
    }

    .booking-save-button {
        background: #315fc3;
        color: #ffffff;
        border: 1px solid #315fc3;
        box-shadow: 0 3px 8px rgba(49, 95, 195, .15);
    }

    .booking-save-button:hover {
        background: #244fae;
        border-color: #244fae;
        transform: translateY(-1px);
        box-shadow: 0 5px 12px rgba(49, 95, 195, .2);
    }

    .booking-required-note {
        color: #8b95a7;
        font-size: 12px;
        margin-top: 22px;
    }

    .booking-required-note span {
        color: #e05252;
        font-weight: 700;
    }

    @media (max-width: 768px) {
        .add-booking-page {
            padding: 18px;
        }

        .add-booking-card {
            padding: 20px;
        }

        .add-booking-grid {
            grid-template-columns: 1fr;
            gap: 19px;
        }

        .full-width {
            grid-column: auto;
        }

        .add-booking-heading {
            align-items: flex-start;
            flex-direction: column;
        }

        .add-booking-actions {
            flex-direction: column-reverse;
            align-items: stretch;
        }

        .booking-cancel-button,
        .booking-save-button {
            width: 100%;
        }
    }

    @media (max-width: 420px) {
        .add-booking-page {
            padding: 12px;
        }

        .add-booking-card {
            padding: 16px;
        }

        .add-booking-heading h2 {
            font-size: 23px;
        }
    }
</style>

<div class="add-booking-page">

    <!-- PAGE HEADER -->
    <div class="add-booking-heading">
        <div>
            <h2>Add New Booking</h2>
            <p>Create and manage a new customer event booking.</p>
        </div>

        <asp:HyperLink ID="BackToBookingsLink"
            runat="server"
            NavigateUrl="~/AdminBookings.aspx"
            CssClass="booking-back-button">
            &#8592; Back to Bookings
        </asp:HyperLink>
    </div>

    <!-- MESSAGE -->
    <asp:Label ID="BookingMessage"
        runat="server"
        CssClass="booking-form-message" />

    <!-- BOOKING FORM -->
    <div class="add-booking-card">

        <div class="booking-section-heading">
            <div class="booking-section-icon">
                &#128221;
            </div>

            <div>
                <h3>Customer &amp; Event Details</h3>
                <p>Enter the customer information and booking details below.</p>
            </div>
        </div>

        <h4 class="booking-subheading">Customer Information</h4>

        <div class="add-booking-grid">

            <!-- CUSTOMER NAME -->
            <div class="booking-form-field">
                <asp:Label ID="CustomerLabel"
                    runat="server"
                    AssociatedControlID="CustomerNameInput"
                    Text="Customer Name *" />

                <asp:TextBox ID="CustomerNameInput"
                    runat="server"
                    CssClass="booking-form-control"
                    MaxLength="200"
                    placeholder="Enter customer full name" />
            </div>

            <!-- EVENT -->
            <div class="booking-form-field">
                <asp:Label ID="EventLabel"
                    runat="server"
                    AssociatedControlID="EventDropdown"
                    Text="Event *" />

                <asp:DropDownList ID="EventDropdown"
                    runat="server"
                    CssClass="booking-form-control"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="EventDropdown_SelectedIndexChanged" />
            </div>

        </div>

        <hr class="booking-divider" />

        <h4 class="booking-subheading">Event Arrangement</h4>

        <div class="add-booking-grid">

            <!-- VENUE -->
            <div class="booking-form-field">
                <asp:Label ID="VenueLabel"
                    runat="server"
                    AssociatedControlID="VenueDropdown"
                    Text="Venue" />

                <asp:DropDownList ID="VenueDropdown"
                    runat="server"
                    CssClass="booking-form-control" />
            </div>

            <!-- PACKAGE -->
            <div class="booking-form-field">
                <asp:Label ID="PackageLabel"
                    runat="server"
                    AssociatedControlID="PackageDropdown"
                    Text="Package *" />

                <asp:DropDownList ID="PackageDropdown"
                    runat="server"
                    CssClass="booking-form-control"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="PackageDropdown_SelectedIndexChanged" />
            </div>

            <!-- EVENT DATE -->
            <div class="booking-form-field">
                <asp:Label ID="EventDateLabel"
                    runat="server"
                    AssociatedControlID="EventDateInput"
                    Text="Event Date *" />

                <asp:TextBox ID="EventDateInput"
                    runat="server"
                    TextMode="Date"
                    CssClass="booking-form-control" />
            </div>

            <!-- EVENT TIME -->
            <div class="booking-form-field">
                <asp:Label ID="EventTimeLabel"
                    runat="server"
                    AssociatedControlID="EventTimeInput"
                    Text="Event Time *" />

                <asp:TextBox ID="EventTimeInput"
                    runat="server"
                    TextMode="Time"
                    CssClass="booking-form-control" />
            </div>

            <!-- GUEST COUNT -->
            <div class="booking-form-field">
                <asp:Label ID="GuestCountLabel"
                    runat="server"
                    AssociatedControlID="GuestCountInput"
                    Text="Number of Guests *" />

                <asp:TextBox ID="GuestCountInput"
                    runat="server"
                    TextMode="Number"
                    Text="1"
                    CssClass="booking-form-control" />
            </div>

            <!-- TOTAL AMOUNT -->
            <div class="booking-form-field">
                <asp:Label ID="TotalAmountLabel"
                    runat="server"
                    AssociatedControlID="TotalAmountInput"
                    Text="Total Amount *" />

                <asp:TextBox ID="TotalAmountInput"
                    runat="server"
                    TextMode="Number"
                    CssClass="booking-form-control"
                    placeholder="Enter total amount" />
            </div>

        </div>

        <hr class="booking-divider" />

        <h4 class="booking-subheading">Booking Confirmation</h4>

        <div class="add-booking-grid">

            <!-- BOOKING STATUS -->
            <div class="booking-form-field">
                <asp:Label ID="BookingStatusLabel"
                    runat="server"
                    AssociatedControlID="BookingStatusDropdown"
                    Text="Booking Status *" />

                <asp:DropDownList ID="BookingStatusDropdown"
                    runat="server"
                    CssClass="booking-form-control">

                    <asp:ListItem Value="Pending">Pending</asp:ListItem>
                    <asp:ListItem Value="Confirmed">Confirmed</asp:ListItem>

                </asp:DropDownList>

                <span class="booking-status-hint">
                    Select the current status of this booking.
                </span>
            </div>

            <!-- VENUE ADDRESS -->
            <div class="booking-form-field">
                <asp:Label ID="VenueAddressLabel"
                    runat="server"
                    AssociatedControlID="VenueAddressInput"
                    Text="Venue Address" />

                <asp:TextBox ID="VenueAddressInput"
                    runat="server"
                    CssClass="booking-form-control"
                    MaxLength="500"
                    placeholder="Enter complete venue address" />
            </div>

            <!-- ADDITIONAL NOTES -->
            <div class="booking-form-field full-width">
                <asp:Label ID="BookingNotesLabel"
                    runat="server"
                    AssociatedControlID="BookingNotesInput"
                    Text="Additional Notes" />

                <asp:TextBox ID="BookingNotesInput"
                    runat="server"
                    TextMode="MultiLine"
                    Rows="4"
                    CssClass="booking-form-control"
                    MaxLength="1000"
                    placeholder="Enter any special requests, instructions or additional booking information..." />
            </div>

        </div>

        <p class="booking-required-note">
            <span>*</span> Required fields must be completed before creating a booking.
        </p>

        <!-- ACTION BUTTONS -->
        <div class="add-booking-actions">

            <asp:Button ID="CancelBookingButton"
                runat="server"
                Text="Cancel"
                CssClass="booking-cancel-button"
                CausesValidation="false"
                PostBackUrl="~/AdminBookings.aspx" />

            <asp:Button ID="SaveBookingButton"
                runat="server"
                Text="Create Booking"
                CssClass="booking-save-button"
                OnClick="SaveBookingButton_Click" />

        </div>

    </div>

</div>

</asp:Content>
