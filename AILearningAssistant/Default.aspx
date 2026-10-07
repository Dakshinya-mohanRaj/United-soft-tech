<%@ Page Title="AI Learning Assistant"
    Language="C#"
    MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

<style>

    * {
        box-sizing: border-box;
    }

    .assistant-page {
        width: 100%;
        min-height: 100vh;
        background: #f6f7fb;
        display: flex;
        flex-direction: column;
        overflow: hidden;
    }

    /* =========================
       COMPANY LOGO SECTION
       ========================= */

    .company-logo-section {
        width: 100%;
        height: 90px;
        background-color: #ffffff;
        background-image: url('Images/company-logo.png');
        background-repeat: no-repeat;
        background-position: center;
        background-size: contain;
        border-bottom: 1px solid #e7e9ef;
        flex-shrink: 0;
    }

    /* =========================
       MAIN AREA
       ========================= */

    .assistant-main {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 22px;
        min-height: 0;
    }

    /* =========================
       CHAT WRAPPER
       ========================= */

    .chat-wrapper {
        width: min(1100px, 100%);
        height: calc(100vh - 135px);
        min-height: 560px;
        max-height: 850px;
        background: #ffffff;
        border-radius: 24px;
        border: 1px solid #e4e7ee;
        box-shadow: 0 16px 45px rgba(31, 41, 55, 0.10);
        display: flex;
        flex-direction: column;
        overflow: hidden;
    }

    /* =========================
       CHAT HEADER
       ========================= */

    .chat-header {
        height: 78px;
        padding: 14px 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        border-bottom: 1px solid #edf0f4;
        background: #ffffff;
        flex-shrink: 0;
    }

    .header-left {
        display: flex;
        align-items: center;
        gap: 13px;
    }

    .ai-avatar {
        width: 48px;
        height: 48px;
        border-radius: 50%;
        background: linear-gradient(135deg, #667eea, #764ba2);
        color: #ffffff;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 21px;
        font-weight: 700;
        box-shadow: 0 5px 14px rgba(102, 126, 234, 0.25);
    }

    .header-info {
        display: flex;
        flex-direction: column;
        gap: 3px;
    }

    .header-title {
        color: #172033;
        font-size: 17px;
        font-weight: 700;
    }

    .online-status {
        display: flex;
        align-items: center;
        gap: 6px;
        color: #6b7280;
        font-size: 12px;
    }

    .online-dot {
        width: 8px;
        height: 8px;
        border-radius: 50%;
        background: #35b86f;
    }

    .call-button {
        width: 42px;
        height: 42px;
        border: none;
        border-radius: 50%;
        background: #f2f3f8;
        color: #667eea;
        font-size: 18px;
        cursor: pointer;
        transition: all 0.2s ease;
    }

    .call-button:hover {
        background: linear-gradient(135deg, #667eea, #764ba2);
        color: #ffffff;
        transform: scale(1.05);
    }

    /* =========================
       CHAT AREA
       ========================= */

    .chat-area {
        position: relative;
        flex: 1;
        overflow-y: auto;
        overflow-x: hidden;
        padding: 26px;
        background: #fafbfe;
        scroll-behavior: smooth;
    }

    .chat-area::-webkit-scrollbar {
        width: 7px;
    }

    .chat-area::-webkit-scrollbar-track {
        background: transparent;
    }

    .chat-area::-webkit-scrollbar-thumb {
        background: #d7dbe5;
        border-radius: 10px;
    }

    .chat-area::before {
        content: "";
        position: absolute;
        inset: 0;
        background-image: url('Images/company-logo.png');
        background-repeat: no-repeat;
        background-position: center;
        background-size: 280px;
        opacity: 0.035;
        pointer-events: none;
    }

    .chat-content {
        position: relative;
        z-index: 1;
    }

    /* =========================
       MESSAGES
       ========================= */

    .message-row {
        width: 100%;
        display: flex;
        margin-bottom: 18px;
    }

    .message-row.bot-row {
        justify-content: flex-start;
    }

    .message-row.user-row {
        justify-content: flex-end;
    }

    .message {
        max-width: 78%;
        padding: 13px 16px;
        border-radius: 16px;
        font-size: 14px;
        line-height: 1.55;
    }

    .message.bot {
        background: #ffffff;
        color: #374151;
        border: 1px solid #e5e8ee;
        border-top-left-radius: 5px;
        box-shadow: 0 4px 12px rgba(31, 41, 55, 0.04);
    }

    .message.user {
        background: linear-gradient(135deg, #667eea, #764ba2);
        color: #ffffff;
        border-top-right-radius: 5px;
    }

    .bot-title {
        font-size: 12px;
        font-weight: 700;
        color: #667eea;
        margin-bottom: 5px;
    }

    /* =========================
       AVAILABLE DOMAIN BUTTON
       ========================= */

    .available-domain-button {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 12px 22px;
        margin-top: 4px;
        background: #ffffff;
        border: 1px solid #dfe3ea;
        border-radius: 13px;
        color: #4b5563;
        font-size: 13px;
        font-weight: 700;
        cursor: pointer;
        transition: all 0.2s ease;
    }

    .available-domain-button:hover {
        animation: buttonBlink 0.85s ease-in-out infinite;
        border-color: #667eea;
    }

    .available-domain-button.selected {
        background: linear-gradient(135deg, #667eea, #764ba2);
        border-color: transparent;
        color: #ffffff;
        cursor: default;
        box-shadow: 0 6px 16px rgba(102, 126, 234, 0.22);
    }

    .available-domain-button.selected:hover {
        animation: none;
    }

    /* =========================
       DOMAIN SECTION
       ========================= */

    .domain-container {
        margin-top: 18px;
        margin-bottom: 20px;
    }

    .domain-heading {
        font-size: 14px;
        font-weight: 700;
        color: #263248;
        margin-bottom: 12px;
    }

    .domain-buttons {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
    }

    .domain-button {
        padding: 11px 18px;
        background: #ffffff;
        border: 1px solid #dfe3ea;
        border-radius: 13px;
        color: #4b5563;
        font-size: 13px;
        font-weight: 700;
        cursor: pointer;
        transition: all 0.2s ease;
    }

    .domain-button:hover {
        animation: buttonBlink 0.85s ease-in-out infinite;
        border-color: #667eea;
    }

    .domain-button.selected {
        background: linear-gradient(135deg, #667eea, #764ba2);
        border-color: transparent;
        color: #ffffff;
        cursor: default;
        box-shadow: 0 6px 16px rgba(102, 126, 234, 0.22);
    }

    .domain-button.selected:hover {
        animation: none;
    }

    /* =========================
       COURSE SECTION
       ========================= */

    .course-container {
        margin-top: 22px;
        margin-bottom: 25px;
    }

    .course-heading {
        font-size: 17px;
        font-weight: 700;
        color: #172033;
        margin-bottom: 14px;
    }

    .course-grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 18px;
    }

    /* =========================
       COURSE CARD
       ========================= */

    .course-card {
        background: #ffffff;
        border: 1px solid #e1e5eb;
        border-radius: 18px;
        padding: 20px;
        box-shadow: 0 5px 16px rgba(31, 41, 55, 0.05);
        transition:
            transform 0.2s ease,
            box-shadow 0.2s ease,
            border-color 0.2s ease;
    }

    .course-card:hover {
        transform: translateY(-3px);
        border-color: #667eea;
        box-shadow: 0 10px 24px rgba(102, 126, 234, 0.13);
    }

    .course-card-title {
        font-size: 17px;
        font-weight: 700;
        color: #172033;
        margin-bottom: 7px;
    }

    .course-card-domain {
        display: inline-block;
        padding: 4px 10px;
        border-radius: 12px;
        background: #f0f2ff;
        color: #667eea;
        font-size: 12px;
        font-weight: 700;
        margin-bottom: 12px;
    }

    .course-card-description {
        color: #53657d;
        font-size: 13px;
        line-height: 1.55;
        min-height: 82px;
        margin-bottom: 16px;
    }

    /* =========================
       COURSE META
       ========================= */

    .course-card-meta {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 10px;
        padding-top: 12px;
        margin-bottom: 16px;
        border-top: 1px solid #edf0f4;
    }

    .course-meta-box {
        background: #f8f9fc;
        border: 1px solid #edf0f4;
        border-radius: 10px;
        padding: 9px 10px;
    }

    .course-meta-label {
        display: block;
        color: #8a94a6;
        font-size: 10px;
        font-weight: 600;
        margin-bottom: 3px;
        text-transform: uppercase;
        letter-spacing: 0.3px;
    }

    .course-meta-value {
        display: block;
        color: #364152;
        font-size: 12px;
        font-weight: 700;
    }

    /* =========================
       VIEW DETAILS BUTTON
       ========================= */

    .course-details-button {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 100%;
        padding: 10px 16px;
        border-radius: 12px;
        background: #ffffff;
        border: 1px solid #dbe2ea;
        color: #53657d;
        font-size: 13px;
        font-weight: 700;
        text-decoration: none;
        transition: all 0.2s ease;
    }

    .course-details-button:hover {
        background: linear-gradient(135deg, #667eea, #764ba2);
        border-color: transparent;
        color: #ffffff;
    }

    /* =========================
       NO COURSE
       ========================= */

    .course-info {
        background: #ffffff;
        border: 1px solid #e4e7ee;
        border-radius: 15px;
        padding: 18px;
        color: #687386;
        font-size: 13px;
    }

    /* =========================
       BLINK ANIMATION
       ========================= */

    @keyframes buttonBlink {

        0% {
            opacity: 1;
            box-shadow: 0 0 0 rgba(102, 126, 234, 0);
        }

        50% {
            opacity: 0.60;
            box-shadow: 0 0 0 6px rgba(102, 126, 234, 0.10);
        }

        100% {
            opacity: 1;
            box-shadow: 0 0 0 rgba(102, 126, 234, 0);
        }

    }

    /* =========================
       RESPONSIVE
       ========================= */

    @media (max-width: 900px) {

        .chat-wrapper {
            height: calc(100vh - 125px);
        }

        .course-grid {
            grid-template-columns: 1fr;
        }

    }

    @media (max-width: 600px) {

        .company-logo-section {
            height: 70px;
        }

        .assistant-main {
            padding: 10px;
        }

        .chat-wrapper {
            height: calc(100vh - 90px);
            min-height: 500px;
            border-radius: 18px;
        }

        .chat-area {
            padding: 17px;
        }

        .message {
            max-width: 90%;
        }

        .chat-header {
            padding: 12px 14px;
        }

        .course-card {
            padding: 17px;
        }

    }

</style>


<div class="assistant-page">

    <!-- COMPANY LOGO -->

    <div class="company-logo-section">
    </div>


    <!-- MAIN ASSISTANT -->

    <div class="assistant-main">

        <div class="chat-wrapper">

            <!-- CHAT HEADER -->

            <div class="chat-header">

                <div class="header-left">

                    <div class="ai-avatar">
                        AI
                    </div>

                    <div class="header-info">

                        <div class="header-title">
                            AI Learning Assistant
                        </div>

                        <div class="online-status">

                            <span class="online-dot"></span>

                            Online

                        </div>

                    </div>

                </div>


                <button type="button"
                        class="call-button"
                        onclick="makeCall()"
                        title="Voice Assistance">

                    ☎

                </button>

            </div>


            <!-- CHAT AREA -->

            <div id="chatArea"
                 class="chat-area">

                <div id="chatContent"
                     class="chat-content">

                </div>

            </div>

        </div>

    </div>

</div>


<script>

    /* ==========================================
       CHAT VARIABLES
       ========================================== */

    var chatArea = document.getElementById("chatArea");
    var chatContent = document.getElementById("chatContent");


    /* ==========================================
       IT COURSE DATA
       ========================================== */

    var domainCourses = {

        "IT": [

            {
                name: "Full Stack Web Development",
                domain: "IT",
                description:
                    "Advanced full-stack web development program covering frontend, backend, databases, asynchronous JavaScript, Django frameworks, API integration and deployment.",
                duration: "6 Months",
                level: "Advanced",
                link:
                    "https://unitedsofttech.co.in/CourseDetails.aspx?id=web-development-advanced&category=it"
            },

            {
                name: "Android Application Development",
                domain: "IT",
                description:
                    "Advanced Android development course covering application components, UI design, threading, data storage, device features and real-time applications.",
                duration: "4 Months",
                level: "Advanced",
                link:
                    "https://unitedsofttech.co.in/CourseDetails.aspx?id=android-advanced&category=it"
            },

            {
                name: "Diploma in Computer Application",
                domain: "IT",
                description:
                    "An end-to-end DCA program that covers computer fundamentals, MS Office suite, internet productivity, digital safety and introductory programming to make students workplace-ready.",
                duration: "3 Months",
                level: "Advanced",
                link:
                    "https://unitedsofttech.co.in/CourseDetails.aspx?id=Diploma%20in%20Computer%20Application%20-Advanced&category=it"
            },

            {
                name: "Artificial Intelligence with Machine Learning",
                domain: "IT",
                description:
                    "A focused advanced AI & ML program teaching classical AI algorithms, machine learning pipelines, deep learning, and deployment-ready systems.",
                duration: "6 Months",
                level: "Advanced",
                link:
                    "https://unitedsofttech.co.in/CourseDetails.aspx?id=Artificial%20Intelligence%20with%20Machine%20Learning%20-%20Advanced&category=it"
            },

            {
                name: "C++ Programming",
                domain: "IT",
                description:
                    "An industry-ready advanced C++ program covering modern C++ features, templates, concurrency, networking, tooling, and high-performance system design.",
                duration: "3 Months",
                level: "Advanced",
                link:
                    "https://unitedsofttech.co.in/CourseDetails.aspx?id=cpp-programming-Advanced&category=it"
            },

            {
                name: "Java Programming",
                domain: "IT",
                description:
                    "Comprehensive advanced Java program covering JVM internals, concurrency, streams, performance, testing and production practices for building scalable Java applications.",
                duration: "3 Months",
                level: "Advanced",
                link:
                    "https://unitedsofttech.co.in/CourseDetails.aspx?id=Java%20Programming-Advanced&category=it"
            },

            {
                name: "C Programming",
                domain: "IT",
                description:
                    "An advanced systems-level C course that covers memory optimization, toolchains, build automation, advanced debugging, and systems programming practices for production-quality C software.",
                duration: "2.5 Months",
                level: "Advanced",
                link:
                    "https://unitedsofttech.co.in/CourseDetails.aspx?id=c-programming-Advanced&category=it"
            },

            {
                name: "Python Programming",
                domain: "IT",
                description:
                    "An advanced, production-oriented Python program covering concurrency, data engineering basics, web & GUI, testing, packaging and deployment for real projects.",
                duration: "4 Months",
                level: "Advanced",
                link:
                    "https://unitedsofttech.co.in/CourseDetails.aspx?id=python-programming-Advanced&category=it"
            },

            {
                name: "PHP",
                domain: "IT",
                description:
                    "Advanced PHP course covering OOP, exception handling, advanced database operations, AJAX, and MVC concepts.",
                duration: "3 Months",
                level: "Advanced",
                link:
                    "https://unitedsofttech.co.in/CourseDetails.aspx?id=php-advanced&category=it"
            },

            {
                name: "Power BI",
                domain: "IT",
                description:
                    "A production-ready Power BI program covering ETL, data modelling, DAX, advanced visualization, Power BI service and real-world dashboard deployment.",
                duration: "2.5 Months",
                level: "Advanced",
                link:
                    "https://unitedsofttech.co.in/CourseDetails.aspx?id=Power%20BI-Advanced&category=it"
            },

            {
                name: "J2EE",
                domain: "IT",
                description:
                    "Advanced J2EE course covering Servlets, JSP, JDBC, MVC architecture, EJB, Web Services and enterprise Java technologies.",
                duration: "4 Months",
                level: "Advanced",
                link:
                    "https://unitedsofttech.co.in/CourseDetails.aspx?id=j2ee-advanced&category=it"
            },

            {
                name: "DOTNET",
                domain: "IT",
                description:
                    "Advanced .NET course covering C#, Windows applications, ASP.NET web applications, ADO.NET, web services and enterprise development.",
                duration: "3 Months",
                level: "Advanced",
                link:
                    "https://unitedsofttech.co.in/CourseDetails.aspx?id=dotnet-advanced&category=it"
            }

        ]

    };


    /* ==========================================
       INITIAL BOT MESSAGE
       ========================================== */

    window.onload = function () {

        addBotMessage(
            "Hi! 👋 Do you know about the available courses?"
        );

        showAvailableDomains();

    };


    /* ==========================================
       ADD BOT MESSAGE
       ========================================== */

    function addBotMessage(message) {

        var row = document.createElement("div");

        row.className = "message-row bot-row";


        var messageBox = document.createElement("div");

        messageBox.className = "message bot";


        messageBox.innerHTML =

            "<div class='bot-title'>AI Assistant</div>" +

            "<div>" + message + "</div>";


        row.appendChild(messageBox);

        chatContent.appendChild(row);

        scrollToBottom();

    }


    /* ==========================================
       ADD USER MESSAGE
       ========================================== */

    function addUserMessage(message) {

        var row = document.createElement("div");

        row.className = "message-row user-row";


        var messageBox = document.createElement("div");

        messageBox.className = "message user";

        messageBox.textContent = message;


        row.appendChild(messageBox);

        chatContent.appendChild(row);

        scrollToBottom();

    }


    /* ==========================================
       AVAILABLE DOMAINS BUTTON
       ========================================== */

    function showAvailableDomains() {

        var row = document.createElement("div");

        row.className = "message-row bot-row";


        var messageBox = document.createElement("div");

        messageBox.className = "message bot";


        var button = document.createElement("button");

        button.type = "button";

        button.className = "available-domain-button";

        button.textContent = "Available Domains";


        button.onclick = function () {

            if (button.classList.contains("selected")) {
                return;
            }


            button.classList.add("selected");

            button.disabled = true;


            addBotMessage(
                "Sure! 😊 Please select a domain to explore the available courses."
            );


            showDomains();

        };


        messageBox.appendChild(button);

        row.appendChild(messageBox);

        chatContent.appendChild(row);

        scrollToBottom();

    }


    /* ==========================================
       SHOW DOMAINS
       ========================================== */

    function showDomains() {

        var container = document.createElement("div");

        container.className = "domain-container";


        var heading = document.createElement("div");

        heading.className = "domain-heading";

        heading.textContent = "Available Domains";

        container.appendChild(heading);


        var buttonsContainer = document.createElement("div");

        buttonsContainer.className = "domain-buttons";


        var domains = [

            "IT",
            "IT Infrastructure",
            "Circuit",
            "Mechanical",
            "Civil"

        ];


        for (var i = 0; i < domains.length; i++) {

            createDomainButton(
                domains[i],
                buttonsContainer
            );

        }


        container.appendChild(buttonsContainer);

        chatContent.appendChild(container);

        scrollToBottom();

    }


    /* ==========================================
       CREATE DOMAIN BUTTON
       ========================================== */

    function createDomainButton(
        domainName,
        buttonsContainer
    ) {

        var button = document.createElement("button");

        button.type = "button";

        button.className = "domain-button";

        button.textContent = domainName;


        button.onclick = function () {

            if (button.classList.contains("selected")) {
                return;
            }


            /*
             * Selected domain becomes purple
             */

            button.classList.add("selected");

            button.disabled = true;


            /*
             * Add bot response
             */

            addBotMessage(

                "Great choice! 😊 Here are the available courses under <b>" +

                escapeHtml(domainName) +

                "</b>."

            );


            /*
             * Display courses
             */

            showCourses(domainName);

        };


        buttonsContainer.appendChild(button);

    }


    /* ==========================================
       SHOW COURSES
       ========================================== */

    function showCourses(domainName) {

        var container = document.createElement("div");

        container.className = "course-container";


        var heading = document.createElement("div");

        heading.className = "course-heading";

        heading.textContent =
            domainName + " Courses";


        container.appendChild(heading);


        var courses = domainCourses[domainName];


        /*
         * If courses are not added yet
         */

        if (!courses || courses.length === 0) {

            var noCourse = document.createElement("div");

            noCourse.className = "course-info";

            noCourse.textContent =
                "Courses for this domain will be available soon.";

            container.appendChild(noCourse);

            chatContent.appendChild(container);

            scrollToBottom();

            return;

        }


        /*
         * Course grid
         */

        var courseGrid = document.createElement("div");

        courseGrid.className = "course-grid";


        /*
         * Create each course card
         */

        for (var i = 0; i < courses.length; i++) {

            var course = courses[i];


            var card = document.createElement("div");

            card.className = "course-card";


            card.innerHTML =

                "<div class='course-card-title'>" +

                    escapeHtml(course.name) +

                "</div>" +


                "<div class='course-card-domain'>" +

                    escapeHtml(course.domain) +

                "</div>" +


                "<div class='course-card-description'>" +

                    escapeHtml(course.description) +

                "</div>" +


                "<div class='course-card-meta'>" +

                    "<div class='course-meta-box'>" +

                        "<span class='course-meta-label'>" +

                            "Duration" +

                        "</span>" +

                        "<span class='course-meta-value'>" +

                            "⏱ " +

                            escapeHtml(course.duration) +

                        "</span>" +

                    "</div>" +


                    "<div class='course-meta-box'>" +

                        "<span class='course-meta-label'>" +

                            "Level" +

                        "</span>" +

                        "<span class='course-meta-value'>" +

                            "📊 " +

                            escapeHtml(course.level) +

                        "</span>" +

                    "</div>" +

                "</div>" +


                "<a class='course-details-button' " +

                    "href='" +

                    course.link +

                    "' " +

                    "target='_blank' " +

                    "rel='noopener noreferrer'>" +

                    "View Details" +

                "</a>";


            courseGrid.appendChild(card);

        }


        container.appendChild(courseGrid);

        chatContent.appendChild(container);

        scrollToBottom();

    }


    /* ==========================================
       ESCAPE HTML
       ========================================== */

    function escapeHtml(value) {

        return String(value)

            .replace(/&/g, "&amp;")

            .replace(/</g, "&lt;")

            .replace(/>/g, "&gt;")

            .replace(/"/g, "&quot;")

            .replace(/'/g, "&#039;");

    }


    /* ==========================================
       SCROLL TO BOTTOM
       ========================================== */

    function scrollToBottom() {

        setTimeout(function () {

            chatArea.scrollTop =
                chatArea.scrollHeight;

        }, 50);

    }


    /* ==========================================
       CALL BUTTON
       ========================================== */

    function makeCall() {

        addBotMessage(
            "Voice assistance is currently available as a visual option. 😊"
        );

    }

</script>

</asp:Content>