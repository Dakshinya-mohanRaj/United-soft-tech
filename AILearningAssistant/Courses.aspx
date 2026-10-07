<%@ Page Title="Courses" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="AILearningAssistant.Courses" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="ust-page__inner">

        <h1 class="ust-page__title">Courses</h1>
        <p class="ust-page__lead">
            Career focused training programmes delivered by UNITED SOFT TECH. Every course is
            available at Beginner, Intermediate and Advanced levels.
        </p>

        <div class="ust-grid ust-grid--4">

            <div class="ust-tile">
                <h2 class="ust-tile__title">Python</h2>
                <p class="ust-tile__text">
                    Programming fundamentals, data handling, automation and APIs.
                </p>
                <span class="ust-tile__meta">3 Months</span>
            </div>

            <div class="ust-tile">
                <h2 class="ust-tile__title">Java</h2>
                <p class="ust-tile__text">
                    Object oriented programming, collections, JDBC and backend development.
                </p>
                <span class="ust-tile__meta">3 Months</span>
            </div>

            <div class="ust-tile">
                <h2 class="ust-tile__title">Web Development</h2>
                <p class="ust-tile__text">
                    HTML5, CSS3, JavaScript, front-end frameworks and full stack delivery.
                </p>
                <span class="ust-tile__meta">4 Months</span>
            </div>

            <div class="ust-tile">
                <h2 class="ust-tile__title">AI &amp; ML</h2>
                <p class="ust-tile__text">
                    Data preparation, supervised and unsupervised learning, model evaluation
                    and deployment.
                </p>
                <span class="ust-tile__meta">4 Months</span>
            </div>

        </div>

        <div class="ust-card" style="margin-top:22px;">
            <h2 class="ust-card__title">Need the full syllabus?</h2>
            <p class="ust-card__text">
                The AI Assistant answers questions on levels, duration, syllabus, tools,
                projects and placement support for every course.
            </p>
            <a class="ust-btn" href="~/Default.aspx">Open AI Assistant</a>
        </div>

    </div>

</asp:Content>