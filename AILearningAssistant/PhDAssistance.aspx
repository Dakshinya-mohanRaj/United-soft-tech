<%@ Page Title="PhD Assistance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PhDAssistance.aspx.cs" Inherits="AILearningAssistant.PhDAssistance" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="ust-page__inner">

        <h1 class="ust-page__title">PhD Assistance</h1>
        <p class="ust-page__lead">
            Research support for research scholars and doctoral candidates, from topic
            finalisation through to submission and publication.
        </p>

        <div class="ust-grid ust-grid--3">

            <div class="ust-tile">
                <h2 class="ust-tile__title">Topic &amp; Proposal</h2>
                <p class="ust-tile__text">
                    Research gap identification, topic refinement and proposal structuring.
                </p>
            </div>

            <div class="ust-tile">
                <h2 class="ust-tile__title">Literature Review</h2>
                <p class="ust-tile__text">
                    Systematic literature study, reference management and gap analysis.
                </p>
            </div>

            <div class="ust-tile">
                <h2 class="ust-tile__title">Methodology &amp; Analysis</h2>
                <p class="ust-tile__text">
                    Research design, statistical analysis, results interpretation and
                    visualisation.
                </p>
            </div>

            <div class="ust-tile">
                <h2 class="ust-tile__title">Writing Support</h2>
                <p class="ust-tile__text">
                    Chapter structuring, technical editing and academic language review.
                </p>
            </div>

            <div class="ust-tile">
                <h2 class="ust-tile__title">Publication</h2>
                <p class="ust-tile__text">
                    Journal formatting, submission guidance and reviewer response support.
                </p>
            </div>

            <div class="ust-tile">
                <h2 class="ust-tile__title">Data &amp; Tools</h2>
                <p class="ust-tile__text">
                    SPSS, R, Python, Excel and survey design assistance for primary research.
                </p>
            </div>

        </div>

        <div class="ust-card" style="margin-top:22px;">
            <h2 class="ust-card__title">Talk to us</h2>
            <p class="ust-card__text">
                Share your research area through the AI Assistant enquiry form and our
                research team will get in touch.
            </p>
            <a class="ust-btn" href="~/Default.aspx">Open AI Assistant</a>
        </div>

    </div>

</asp:Content>