<%@ Page Title="Projects" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="AILearningAssistant.Projects" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="ust-page__inner">

        <h1 class="ust-page__title">Projects</h1>
        <p class="ust-page__lead">
            Every UNITED SOFT TECH course ends with reviewed, portfolio ready projects so that
            learners leave with work they can show an employer.
        </p>

        <div class="ust-grid ust-grid--2">

            <div class="ust-tile">
                <h2 class="ust-tile__title">Python Projects</h2>
                <p class="ust-tile__text">
                    Expense tracker, web scraping report, REST API service and an automation
                    capstone.
                </p>
                <span class="ust-tile__meta">Beginner to Advanced</span>
            </div>

            <div class="ust-tile">
                <h2 class="ust-tile__title">Java Projects</h2>
                <p class="ust-tile__text">
                    Bank management console app, JDBC employee system, library management and
                    REST services.
                </p>
                <span class="ust-tile__meta">Beginner to Advanced</span>
            </div>

            <div class="ust-tile">
                <h2 class="ust-tile__title">Web Development Projects</h2>
                <p class="ust-tile__text">
                    Responsive landing pages, catalogue apps and a deployed full stack
                    dashboard.
                </p>
                <span class="ust-tile__meta">Beginner to Advanced</span>
            </div>

            <div class="ust-tile">
                <h2 class="ust-tile__title">AI &amp; ML Projects</h2>
                <p class="ust-tile__text">
                    Churn prediction, price prediction, sentiment analysis and a deployed
                    end-to-end model.
                </p>
                <span class="ust-tile__meta">Beginner to Advanced</span>
            </div>

        </div>

        <div class="ust-card" style="margin-top:22px;">
            <h2 class="ust-card__title">Ask the AI Assistant</h2>
            <p class="ust-card__text">
                Type &ldquo;What projects can I do in Python?&rdquo; to see the full project list
                for any course, along with the tools used.
            </p>
            <a class="ust-btn" href="~/Default.aspx">Open AI Assistant</a>
        </div>

    </div>

</asp:Content>