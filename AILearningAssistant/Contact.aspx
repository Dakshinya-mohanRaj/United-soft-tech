<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="AILearningAssistant.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="ust-page__inner">

        <h1 class="ust-page__title">Contact</h1>
        <p class="ust-page__lead">
            Our counsellors are available for course guidance, batch details and enrolment.
        </p>

        <main aria-labelledby="title">
            <h2 id="title" class="ust-card__title">Your contact page.</h2>

            <div class="ust-card">
                <address>
                    One Microsoft Way<br />
                    Redmond, WA 98052-6399<br />
                    <abbr title="Phone">P:</abbr>
                    425.555.0100
                </address>

                <address>
                    <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
                    <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
                </address>
            </div>

            <div class="ust-card">
                <h3 class="ust-card__title">Prefer to enquire online?</h3>
                <p class="ust-card__text">
                    Use the enquiry form inside the AI Assistant and our team will call you
                    back at your convenient time.
                </p>
                <a class="ust-btn" href="~/Default.aspx">Open AI Assistant</a>
            </div>
        </main>

    </div>

</asp:Content>
