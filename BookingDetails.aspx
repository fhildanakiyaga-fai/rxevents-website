
<%@ Page Title="Booking Details"
    Language="C#"
    MasterPageFile="~/Customer.Master"
    AutoEventWireup="true"
    CodeBehind="BookingDetails.aspx.cs"
    Inherits="RxEvents.BookingDetails" %>

<asp:Content ID="HeadContent"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        .booking-details-page {
            padding: 35px 25px;
            min-height: 80vh;
            background: #f7f5fa;
            color: #292435;
            font-family: 'Segoe UI', Arial, sans-serif;
        }

        .booking-breadcrumb {
            max-width: 1000px;
            margin: 0 auto 22px;
            color: #81798c;
            font-size: 13px;
        }

        .booking-breadcrumb span {
            color: #631D73;
            font-weight: 600;
        }

        .booking-details-card {
            max-width: 1000px;
            margin: 0 auto;
            padding: 35px;
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 8px 30px rgba(48, 25, 65, .08);
            border: 1px solid #eee8f2;
        }

        .booking-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            padding-bottom: 25px;
            border-bottom: 1px solid #eee8f2;
        }

        .booking-header h1 {
            color: #631D73;
            font-size: 27px;
            font-weight: 700;
            margin: 0 0 8px;
        }

        .booking-header p {
            color: #81798c;
            font-size: 14px;
            margin: 0;
        }

        .booking-icon {
            width: 55px;
            height: 55px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 14px;
            background: #f4eaf6;
            color: #631D73;
            font-size: 25px;
        }

        .booking-section-title {
            color: #631D73;
            font-size: 17px;
            font-weight: 700;
            margin: 28px 0 5px;
        }

        .booking-section-description {
            color: #928a9b;
            font-size: 13px;
            margin-bottom: 20px;
        }

        .booking-details-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 16px;
            margin-top: 20px;
        }

        .booking-detail-item {
            padding: 19px;
            background: #faf8fc;
            border: 1px solid #eee8f2;
            border-radius: 12px;
            min-height: 85px;
            transition: .2s ease;
            overflow-wrap: anywhere;
        }

        .booking-detail-item:hover {
            border-color: #d6b7df;
            background: #fcfaff;
        }

        .booking-detail-label {
            display: block;
            color: #898092;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 10px;
            text-transform: uppercase;
            letter-spacing: .5px;
        }

        .booking-detail-value {
            display: block;
            color: #34263d;
            font-size: 15px;
            font-weight: 650;
            line-height: 1.5;
        }

        .booking-detail-item:last-child {
            grid-column: span 2;
        }

        .booking-detail-item:nth-child(8) {
            background: #fbf6e9;
            border-color: #eee0b9;
        }

        .booking-detail-item:nth-child(8) .booking-detail-value {
            color: #98701c;
            font-size: 19px;
        }

        .booking-detail-item:nth-child(9) .booking-detail-value {
            color: #631D73;
        }

        .booking-actions {
            display: flex;
            justify-content: flex-start;
            margin-top: 30px;
            padding-top: 23px;
            border-top: 1px solid #eee8f2;
        }

        .booking-back-button {
            display: inline-block;
            padding: 13px 23px;
            border: none;
            border-radius: 9px;
            background: #631D73;
            color: #fff;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: .2s ease;
        }

        .booking-back-button:hover {
            background: #4d155a;
            color: #fff;
            transform: translateY(-2px);
            box-shadow: 0 5px 12px rgba(99, 29, 115, .2);
        }

        .booking-message {
            display: block;
            margin-top: 20px;
            padding: 12px 15px;
            color: #a12d36;
            background: #fff0f0;
            border: 1px solid #f3d0d0;
            border-radius: 9px;
            font-size: 14px;
        }

        @media (max-width: 650px) {
            .booking-details-page {
                padding: 20px 12px;
            }

            .booking-details-card {
                padding: 22px 17px;
            }

            .booking-header h1 {
                font-size: 23px;
            }

            .booking-details-grid {
                grid-template-columns: 1fr;
                gap: 12px;
            }

            .booking-detail-item:last-child {
                grid-column: span 1;
            }

            .booking-icon {
                width: 45px;
                height: 45px;
            }

            .booking-back-button {
                width: 100%;
            }
        }

        @media (max-width: 380px) {
            .booking-details-card {
                padding: 18px 13px;
            }

            .booking-detail-item {
                padding: 15px;
            }
        }
    </style>

</asp:Content>

<asp:Content ID="MainContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="booking-details-page">

        <div class="booking-breadcrumb">
            Home &nbsp; › &nbsp; My Bookings &nbsp; › &nbsp;
            <span>Booking Details</span>
        </div>

        <div class="booking-details-card">

            <div class="booking-header">

                <div>
                    <h1>Booking Details</h1>
                    <p>View and review the complete information
                        about your event booking.</p>
                </div>

                <div class="booking-icon">
                    &#9733;
                </div>

            </div>

            <asp:Label ID="MessageLabel"
                runat="server"
                EnableViewState="false"
                CssClass="booking-message" />

            <asp:Panel ID="BookingPanel"
                runat="server"
                Visible="false">

                <div class="booking-section-title">
                    Event Information
                </div>

                <div class="booking-section-description">
                    Details about your selected event and schedule.
                </div>

                <div class="booking-details-grid">

                    <div class="booking-detail-item">
                        <span class="booking-detail-label">
                            Booking Reference
                        </span>
                        <asp:Label ID="BookingReferenceLabel"
                            runat="server"
                            CssClass="booking-detail-value" />
                    </div>

                    <div class="booking-detail-item">
                        <span class="booking-detail-label">
                            Event Name
                        </span>
                        <asp:Label ID="EventNameLabel"
                            runat="server"
                            CssClass="booking-detail-value" />
                    </div>

                    <div class="booking-detail-item">
                        <span class="booking-detail-label">
                            Event Date
                        </span>
                        <asp:Label ID="EventDateLabel"
                            runat="server"
                            CssClass="booking-detail-value" />
                    </div>

                    <div class="booking-detail-item">
                        <span class="booking-detail-label">
                            Event Time
                        </span>
                        <asp:Label ID="EventTimeLabel"
                            runat="server"
                            CssClass="booking-detail-value" />
                    </div>

                    <div class="booking-detail-item">
                        <span class="booking-detail-label">
                            Venue
                        </span>
                        <asp:Label ID="VenueLabel"
                            runat="server"
                            CssClass="booking-detail-value" />
                    </div>

                    <div class="booking-detail-item">
                        <span class="booking-detail-label">
                            Selected Package
                        </span>
                        <asp:Label ID="PackageLabel"
                            runat="server"
                            CssClass="booking-detail-value" />
                    </div>

                </div>

                <div class="booking-section-title">
                    Booking Summary
                </div>

                <div class="booking-section-description">
                    Payment, guest and booking status information.
                </div>

                <div class="booking-details-grid">

                    <div class="booking-detail-item">
                        <span class="booking-detail-label">
                            Number of Guests
                        </span>
                        <asp:Label ID="GuestCountLabel"
                            runat="server"
                            CssClass="booking-detail-value" />
                    </div>

                    <div class="booking-detail-item">
                        <span class="booking-detail-label">
                            Total Amount
                        </span>
                        <asp:Label ID="AmountLabel"
                            runat="server"
                            CssClass="booking-detail-value" />
                    </div>

                    <div class="booking-detail-item">
                        <span class="booking-detail-label">
                            Booking Status
                        </span>
                        <asp:Label ID="BookingStatusLabel"
                            runat="server"
                            CssClass="booking-detail-value" />
                    </div>

                    <div class="booking-detail-item">
                        <span class="booking-detail-label">
                            Booking Date
                        </span>
                        <asp:Label ID="BookingDateLabel"
                            runat="server"
                            CssClass="booking-detail-value" />
                    </div>

                    <div class="booking-detail-item">
                        <span class="booking-detail-label">
                            Additional Notes
                        </span>
                        <asp:Label ID="NotesLabel"
                            runat="server"
                            CssClass="booking-detail-value" />
                    </div>

                </div>

            </asp:Panel>

            <div class="booking-actions">

                <asp:Button ID="BackButton"
                    runat="server"
                    Text="&#8592;  Back to My Bookings"
                    CssClass="booking-back-button"
                    CausesValidation="false"
                    OnClick="BackButton_Click" />

            </div>

        </div>

    </div>

</asp:Content>
