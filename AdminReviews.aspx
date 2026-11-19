
<%@ Page Title="Reviews" Language="C#" MasterPageFile="~/Admin.Master"
    AutoEventWireup="true" CodeBehind="AdminReviews.aspx.cs"
    Inherits="RxEvents.AdminReviews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="<%= ResolveUrl("~/Content/css/admin.css") %>" rel="stylesheet" />

    <style>
        .reviews-page {
            max-width: 1400px;
            margin: 30px auto;
            padding: 0 22px 40px;
            color: #30283a;
        }

        .reviews-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            margin-bottom: 25px;
        }

        .reviews-header h1 {
            margin: 0 0 8px;
            color: #32143d;
            font-size: 29px;
            font-weight: 750;
        }

        .reviews-header p {
            margin: 0;
            color: #82798b;
            font-size: 14px;
        }

        .reviews-export-button,
        .reviews-filter-button,
        .reviews-clear-button {
            padding: 11px 19px;
            border: 0;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 650;
            cursor: pointer;
            transition: .2s ease;
        }

        .reviews-export-button,
        .reviews-filter-button {
            background: #631d73;
            color: #fff;
        }

        .reviews-export-button:hover,
        .reviews-filter-button:hover {
            background: #491456;
        }

        .reviews-message {
            display: block;
            margin-bottom: 18px;
            padding: 12px 15px;
            border-radius: 8px;
        }

        .reviews-filter-card,
        .reviews-table-card {
            background: #fff;
            border: 1px solid #eee8f1;
            border-radius: 14px;
            padding: 24px;
            margin-bottom: 23px;
            box-shadow: 0 6px 22px rgba(48, 24, 57, .06);
        }

        .reviews-filter-card {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1.4fr;
            gap: 18px;
            align-items: end;
        }

        .reviews-filter-field {
            display: flex;
            flex-direction: column;
            gap: 8px;
            min-width: 0;
        }

        .reviews-filter-field label {
            color: #40384a;
            font-size: 13px;
            font-weight: 650;
        }

        .reviews-input {
            width: 100%;
            box-sizing: border-box;
            min-height: 43px;
            padding: 10px 12px;
            border: 1px solid #ddd5e2;
            border-radius: 8px;
            background: #fff;
            color: #30283a;
            font-size: 13px;
            outline: none;
        }

        .reviews-input:focus {
            border-color: #813795;
            box-shadow: 0 0 0 3px rgba(129, 55, 149, .11);
        }

        .reviews-filter-actions {
            display: flex;
            gap: 9px;
            grid-column: 1 / -1;
            justify-content: flex-end;
            padding-top: 5px;
        }

        .reviews-clear-button {
            background: #f1edf3;
            color: #5b4964;
        }

        .reviews-clear-button:hover {
            background: #e6ddea;
        }

        .reviews-table-card {
            overflow: hidden;
        }

        .reviews-table-scroll {
            width: 100%;
            overflow-x: auto;
        }

        .reviews-grid {
            width: 100%;
            min-width: 950px;
            border-collapse: collapse;
            font-size: 13px;
        }

        .reviews-grid th {
            padding: 15px 13px;
            background: #f7f2f9;
            color: #56315f;
            text-align: left;
            font-size: 12px;
            font-weight: 700;
            white-space: nowrap;
        }

        .reviews-grid td {
            padding: 15px 13px;
            border-bottom: 1px solid #f0ebf2;
            color: #504858;
            vertical-align: middle;
        }

        .reviews-grid tr:hover td {
            background: #fcfaff;
        }

        .reviews-customer-cell {
            display: flex;
            align-items: center;
            gap: 11px;
            min-width: 175px;
        }

        .reviews-avatar {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 37px;
            height: 37px;
            flex-shrink: 0;
            border-radius: 50%;
            background: #eee1f2;
            color: #631d73;
            font-weight: 750;
        }

        .reviews-customer-cell strong,
        .reviews-event-cell strong {
            color: #35233e;
        }

        .reviews-customer-cell p,
        .reviews-event-cell p {
            margin: 4px 0 0;
            color: #898191;
            font-size: 11px;
        }

        .reviews-stars {
            color: #e6a52a;
            white-space: nowrap;
        }

        .reviews-rating-number {
            margin-left: 5px;
            color: #5a5061;
            font-weight: 650;
            white-space: nowrap;
        }

        .reviews-text-cell {
            max-width: 240px;
            line-height: 1.6;
            overflow-wrap: anywhere;
        }

        .reviews-row-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 9px;
            min-width: 150px;
        }

        .reviews-row-actions a {
            padding: 6px 9px;
            border-radius: 6px;
            background: #f1e8f4;
            color: #631d73;
            font-size: 11px;
            font-weight: 650;
            text-decoration: none;
        }

        .reviews-row-actions a:hover {
            background: #e5d5eb;
        }

        .reviews-pagination {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            padding-top: 22px;
            color: #777181;
            font-size: 13px;
        }

        .reviews-pagination-buttons {
            display: flex;
            align-items: center;
            gap: 7px;
        }

        .reviews-page-button {
            min-width: 34px;
            min-height: 34px;
            padding: 6px 10px;
            border: 1px solid #e5dce9;
            border-radius: 7px;
            background: #fff;
            color: #60476a;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }

        .reviews-page-button:hover,
        .reviews-page-active {
            background: #631d73;
            border-color: #631d73;
            color: #fff;
        }

        @media (max-width: 950px) {
            .reviews-filter-card {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
        }

        @media (max-width: 600px) {
            .reviews-page { padding: 0 13px 25px; }

            .reviews-header {
                align-items: flex-start;
                flex-direction: column;
            }

            .reviews-header h1 { font-size: 24px; }

            .reviews-filter-card,
            .reviews-table-card { padding: 17px; }

            .reviews-filter-card { grid-template-columns: 1fr; }

            .reviews-filter-actions {
                flex-direction: column;
                grid-column: auto;
            }

            .reviews-filter-actions input { width: 100%; }

            .reviews-pagination {
                align-items: flex-start;
                flex-direction: column;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="reviews-page">

        <div class="reviews-header">
            <div>
                <h1>Customer Reviews</h1>
                <p>Dashboard &gt; Reviews &nbsp; / &nbsp; Manage customer feedback</p>
            </div>

            <div class="reviews-header-actions">
                <asp:Button ID="ExportReviewsButton" runat="server"
                    Text="↓ Export Reviews"
                    CssClass="reviews-export-button"
                    OnClick="ExportReviewsButton_Click" />
            </div>
        </div>

        <asp:Label ID="ReviewsMessage" runat="server"
            CssClass="reviews-message" EnableViewState="false" />

        <div class="reviews-filter-card">

            <div class="reviews-filter-field reviews-search-field">
                <asp:Label ID="ReviewSearchLabel" runat="server"
                    AssociatedControlID="ReviewSearchTextBox"
                    Text="Search Reviews" />
                <asp:TextBox ID="ReviewSearchTextBox" runat="server"
                    CssClass="reviews-input"
                    placeholder="Customer, event or review..." />
            </div>

            <div class="reviews-filter-field">
                <asp:Label ID="RatingFilterLabel" runat="server"
                    AssociatedControlID="RatingFilter" Text="Rating" />
                <asp:DropDownList ID="RatingFilter" runat="server"
                    CssClass="reviews-input">
                    <asp:ListItem Text="All Ratings" Value="" />
                    <asp:ListItem Text="5 Stars" Value="5" />
                    <asp:ListItem Text="4 Stars" Value="4" />
                    <asp:ListItem Text="3 Stars" Value="3" />
                    <asp:ListItem Text="2 Stars" Value="2" />
                    <asp:ListItem Text="1 Star" Value="1" />
                </asp:DropDownList>
            </div>

            <div class="reviews-filter-field">
                <asp:Label ID="ReviewStatusLabel" runat="server"
                    AssociatedControlID="ReviewStatusFilter" Text="Status" />
                <asp:DropDownList ID="ReviewStatusFilter" runat="server"
                    CssClass="reviews-input">
                    <asp:ListItem Text="All Statuses" Value="" />
                    <asp:ListItem Text="Pending" Value="Pending" />
                    <asp:ListItem Text="Approved" Value="Approved" />
                    <asp:ListItem Text="Rejected" Value="Rejected" />
                </asp:DropDownList>
            </div>

            <div class="reviews-filter-field">
                <asp:Label ID="ReviewEventLabel" runat="server"
                    AssociatedControlID="ReviewEventFilter" Text="Event / Service" />
                <asp:DropDownList ID="ReviewEventFilter" runat="server"
                    CssClass="reviews-input">
                    <asp:ListItem Text="All Events & Services" Value="" />
                </asp:DropDownList>
            </div>

            <div class="reviews-filter-actions">
                <asp:Button ID="ApplyReviewFiltersButton" runat="server"
                    Text="Apply Filters" CssClass="reviews-filter-button"
                    OnClick="ApplyReviewFiltersButton_Click" />

                <asp:Button ID="ClearReviewFiltersButton" runat="server"
                    Text="↻ Clear Filters" CssClass="reviews-clear-button"
                    CausesValidation="false"
                    OnClick="ClearReviewFiltersButton_Click" />
            </div>

        </div>

        <div class="reviews-table-card">

            <div class="reviews-table-scroll">
                <asp:GridView ID="ReviewsGridView" runat="server"
                    AutoGenerateColumns="False" DataKeyNames="ReviewID"
                    CssClass="reviews-grid" GridLines="None"
                    OnRowCommand="ReviewsGridView_RowCommand"
                    EmptyDataText="No reviews found.">

                    <Columns>
                        <asp:TemplateField HeaderText="Customer">
                            <ItemTemplate>
                                <div class="reviews-customer-cell">
                                    <div class="reviews-avatar">
                                        <%#: Eval("CustomerInitials") %>
                                    </div>
                                    <div>
                                        <strong><%#: Eval("CustomerName") %></strong>
                                        <p><%#: Eval("CustomerEmail") %></p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Event / Service">
                            <ItemTemplate>
                                <div class="reviews-event-cell">
                                    <strong><%#: Eval("EventName") %></strong>
                                    <p><%# Eval("ReviewDate", "{0:dd MMM yyyy}") %></p>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Rating">
                            <ItemTemplate>
                                <span class="reviews-stars">
                                    <%# GetStars(Eval("Rating")) %>
                                </span>
                                <span class="reviews-rating-number">
                                    <%#: Eval("Rating") %>/5
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Review">
                            <ItemTemplate>
                                <div class="reviews-text-cell">
                                    <%#: Eval("ReviewText") %>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="ReviewDate"
                            HeaderText="Date"
                            DataFormatString="{0:dd MMM yyyy hh:mm tt}" />

                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <span class='<%# GetReviewStatusCss(Eval("Status")) %>'>
                                    <%#: Eval("Status") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <div class="reviews-row-actions">
                                    <asp:LinkButton ID="ViewReviewButton" runat="server"
                                        Text="View" ToolTip="View review"
                                        CommandName="ViewReview"
                                        CommandArgument='<%# Eval("ReviewID") %>'
                                        CausesValidation="false" />

                                    <asp:LinkButton ID="ApproveReviewButton" runat="server"
                                        Text="Approve" ToolTip="Approve review"
                                        Visible='<%# Convert.ToString(Eval("Status")) != "Approved" %>'
                                        CommandName="ApproveReview"
                                        CommandArgument='<%# Eval("ReviewID") %>'
                                        CausesValidation="false" />

                                    <asp:LinkButton ID="RejectReviewButton" runat="server"
                                        Text="Reject" ToolTip="Reject review"
                                        Visible='<%# Convert.ToString(Eval("Status")) != "Rejected" %>'
                                        CommandName="RejectReview"
                                        CommandArgument='<%# Eval("ReviewID") %>'
                                        CausesValidation="false" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <div class="reviews-pagination">

                <asp:Label ID="ReviewPaginationSummary" runat="server"
                    Text="Showing 0 reviews" />

                <div class="reviews-pagination-buttons">

                    <asp:Button ID="PreviousReviewPageButton" runat="server"
                        Text="‹" CssClass="reviews-page-button"
                        CausesValidation="false"
                        OnClick="PreviousReviewPageButton_Click" />

                    <asp:Repeater ID="ReviewPaginationRepeater" runat="server"
                        OnItemCommand="ReviewPaginationRepeater_ItemCommand">
                        <ItemTemplate>
                            <asp:LinkButton ID="ReviewPageButton" runat="server"
                                Text='<%# Eval("PageNumber") %>'
                                CommandName="GoToPage"
                                CommandArgument='<%# Eval("PageNumber") %>'
                                CssClass='<%# Convert.ToInt32(Eval("PageNumber")) == CurrentReviewPage
                                    ? "reviews-page-button reviews-page-active"
                                    : "reviews-page-button" %>'
                                CausesValidation="false" />
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:Button ID="NextReviewPageButton" runat="server"
                        Text="›" CssClass="reviews-page-button"
                        CausesValidation="false"
                        OnClick="NextReviewPageButton_Click" />

                </div>
            </div>

        </div>
    </div>

</asp:Content>
