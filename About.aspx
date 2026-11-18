
<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="About.aspx.cs"
    Inherits="RxEvents.About" %>

<asp:Content ID="MainContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

<style>
.rx-about-page {
    font-family: 'Segoe UI', Arial, sans-serif;
    color: #30243a;
    background: #fff;
    overflow: hidden;
}
.rx-about-page * { box-sizing: border-box; }

.rx-about-hero {
    text-align: center;
    padding: 100px 20px 95px;
    background: linear-gradient(135deg, #631D73, #42134f);
    color: white;
}
.rx-about-label {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 12px;
    color: #d9b76a;
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 2.5px;
}
.rx-about-label span {
    width: 28px;
    height: 1px;
    background: #d9b76a;
}
.rx-about-hero h1 {
    margin: 22px 0 15px;
    font-size: clamp(32px, 5vw, 52px);
    font-weight: 700;
    letter-spacing: -.8px;
}
.rx-about-hero p {
    max-width: 620px;
    margin: auto;
    color: #eee3f0;
    font-size: 16px;
    line-height: 1.8;
}
.rx-about-story {
    max-width: 1120px;
    margin: auto;
    padding: 85px 25px;
    display: grid;
    grid-template-columns: 1.3fr .9fr;
    gap: 65px;
    align-items: center;
}
.rx-about-small-title {
    color: #b18a39;
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 2px;
    margin-bottom: 15px;
}
.rx-about-story-content h2,
.rx-about-services-content h2 {
    color: #631D73;
    font-size: 31px;
    line-height: 1.3;
    margin: 0 0 22px;
}
.rx-about-story-content p,
.rx-about-services-content p {
    color: #716879;
    font-size: 14px;
    line-height: 1.9;
    margin-bottom: 15px;
}
.rx-about-story-box {
    background: #f7f1f8;
    border: 1px solid #eaddec;
    border-radius: 18px;
    padding: 42px 35px;
    text-align: center;
    box-shadow: 0 12px 30px rgba(60,20,70,.06);
}
.rx-about-quote-mark {
    color: #c6a04f;
    font-family: Georgia, serif;
    font-size: 65px;
    height: 55px;
}
.rx-about-story-box p {
    color: #631D73;
    font-family: Georgia, serif;
    font-size: 21px;
    font-style: italic;
    line-height: 1.6;
}
.rx-about-quote-line {
    width: 45px;
    height: 2px;
    background: #c6a04f;
    margin: 22px auto;
}
.rx-about-story-box span {
    color: #927b99;
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 2px;
}
.rx-about-beliefs {
    padding: 75px 25px 90px;
    background: #faf8fb;
}
.rx-about-section-heading { text-align: center; }
.rx-about-section-heading h2 {
    color: #631D73;
    font-size: 34px;
    margin: 15px 0 10px;
}
.rx-about-section-heading p {
    color: #81788a;
    font-size: 14px;
}
.rx-about-values {
    max-width: 1120px;
    margin: 40px auto 0;
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
}
.rx-about-value {
    background: white;
    padding: 30px 22px;
    border-radius: 13px;
    border: 1px solid #eee7f0;
    text-align: center;
    transition: .3s ease;
}
.rx-about-value:hover {
    transform: translateY(-7px);
    border-color: #c9a0d0;
    box-shadow: 0 12px 25px rgba(65,20,75,.08);
}
.rx-about-value-icon {
    width: 53px;
    height: 53px;
    margin: 0 auto 18px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    background: #f4eaf6;
    color: #b18a39;
    font-size: 23px;
}
.rx-about-value h3 {
    color: #631D73;
    font-size: 17px;
    margin: 0 0 12px;
}
.rx-about-value p {
    color: #81788a;
    font-size: 13px;
    line-height: 1.8;
    margin: 0;
}
.rx-about-services {
    max-width: 1120px;
    margin: auto;
    padding: 85px 25px;
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 75px;
    align-items: center;
}
.rx-about-services-content h2 { max-width: 450px; }
.rx-about-services-content p { margin-bottom: 27px; }
.rx-about-button {
    display: inline-flex;
    align-items: center;
    gap: 15px;
    padding: 13px 22px;
    border-radius: 7px;
    background: #631D73;
    color: white !important;
    font-size: 13px;
    font-weight: 600;
    text-decoration: none !important;
    transition: .25s;
}
.rx-about-button:hover {
    background: #4b1558;
    transform: translateY(-3px);
}
.rx-about-button span { color: #e1c276; font-size: 19px; }
.rx-about-services-list {
    border: 1px solid #eee6f0;
    border-radius: 13px;
    padding: 10px 25px;
    background: #fff;
    box-shadow: 0 8px 25px rgba(50,20,60,.05);
}
.rx-about-services-list div {
    display: flex;
    align-items: center;
    gap: 22px;
    padding: 17px 5px;
    color: #45364c;
    font-size: 14px;
    font-weight: 600;
    border-bottom: 1px solid #f0ebf2;
    transition: .2s;
}
.rx-about-services-list div:last-child { border-bottom: none; }
.rx-about-services-list div:hover {
    color: #631D73;
    padding-left: 12px;
}
.rx-about-services-list span {
    color: #b18a39;
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 1px;
}
@media(max-width:850px) {
    .rx-about-values { grid-template-columns: repeat(2,1fr); }
    .rx-about-story, .rx-about-services { gap: 35px; }
}
@media(max-width:650px) {
    .rx-about-hero { padding: 75px 20px; }
    .rx-about-story, .rx-about-services {
        grid-template-columns: 1fr;
        padding: 60px 22px;
    }
    .rx-about-story-content h2,
    .rx-about-services-content h2 { font-size: 27px; }
    .rx-about-beliefs { padding: 60px 18px; }
    .rx-about-values { gap: 13px; }
    .rx-about-value { padding: 25px 14px; }
    .rx-about-section-heading h2 { font-size: 29px; }
}
@media(max-width:400px) {
    .rx-about-values { grid-template-columns: 1fr; }
    .rx-about-story-box { padding: 30px 22px; }
}
</style>

<section class="rx-about-page">

    <div class="rx-about-hero">
        <div class="rx-about-label">
            <span></span> ABOUT RX EVENTS <span></span>
        </div>
        <h1>Creating Memorable Moments</h1>
        <p>
            We plan, coordinate and bring your special occasions
            to life with creativity, care and attention to detail.
        </p>
    </div>

    <div class="rx-about-story">
        <div class="rx-about-story-content">
            <div class="rx-about-small-title">OUR STORY</div>
            <h2>Where Every Celebration Becomes a Memory</h2>
            <p>
                Rx Events Solutions is an event planning and management
                company dedicated to creating beautiful and meaningful
                celebrations.
            </p>
            <p>
                From weddings and birthdays to corporate events,
                graduations, baby showers and proposals, we take care
                of the details so our clients can enjoy their special
                moments.
            </p>
            <p>
                Our approach combines thoughtful planning, elegant
                design, reliable coordination and personalized service
                to create events that reflect each client's vision.
            </p>
        </div>

        <div class="rx-about-story-box">
            <div class="rx-about-quote-mark">“</div>
            <p>
                Beautiful events begin with thoughtful planning
                and end with unforgettable memories.
            </p>
            <div class="rx-about-quote-line"></div>
            <span>RX EVENTS SOLUTIONS</span>
        </div>
    </div>

    <div class="rx-about-beliefs">
        <div class="rx-about-section-heading">
            <div class="rx-about-label">
                <span></span> WHAT DRIVES US <span></span>
            </div>
            <h2>Our Values</h2>
            <p>The principles behind every event we create.</p>
        </div>

        <div class="rx-about-values">
            <div class="rx-about-value">
                <div class="rx-about-value-icon">★</div>
                <h3>Quality</h3>
                <p>We focus on quality in every detail, from planning to the final celebration.</p>
            </div>

            <div class="rx-about-value">
                <div class="rx-about-value-icon">♥</div>
                <h3>Creativity</h3>
                <p>We create distinctive experiences that make every occasion feel special.</p>
            </div>

            <div class="rx-about-value">
                <div class="rx-about-value-icon">✓</div>
                <h3>Reliability</h3>
                <p>We carefully coordinate every detail so our clients can celebrate with confidence.</p>
            </div>

            <div class="rx-about-value">
                <div class="rx-about-value-icon">◆</div>
                <h3>Personal Service</h3>
                <p>Every event is planned around the client's needs, preferences and vision.</p>
            </div>
        </div>
    </div>

    <div class="rx-about-services">
        <div class="rx-about-services-content">
            <div class="rx-about-small-title">WHAT WE DO</div>
            <h2>From the First Idea to the Final Moment</h2>
            <p>
                Our team helps transform ideas into carefully planned
                events. We provide services including event planning,
                venue decoration, catering, photography, entertainment
                and event coordination.
            </p>
            <a href="Services.aspx" class="rx-about-button">
                Explore Our Services <span>→</span>
            </a>
        </div>

        <div class="rx-about-services-list">
            <div><span>01</span> Event Planning</div>
            <div><span>02</span> Venue Decoration</div>
            <div><span>03</span> Catering</div>
            <div><span>04</span> Photography</div>
            <div><span>05</span> Entertainment</div>
            <div><span>06</span> Event Coordination</div>
        </div>
    </div>

</section>

</asp:Content>
