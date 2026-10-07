<%@ Page Title="AI Learning Assistant"
    Language="C#"
    MasterPageFile="~/Site.Master" %>
<asp:Content ID="BodyContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

<style>

    /* =========================================
       PAGE
    ========================================= */

    html,
    body {
        margin: 0;
        padding: 0;
    }

    .assistant-page {
        width: 100%;
        height: calc(100vh - 0px);

        display: flex;
        flex-direction: column;

        background: #f4f6f9;

        overflow: hidden;
    }


    /* =========================================
       COMPANY LOGO
    ========================================= */

    .company-logo-section {
        width: 100%;
        height: 70px;

        flex-shrink: 0;

        background-color: #ffffff;

        background-image: url('Images/company-logo.png');

        background-repeat: no-repeat;

        background-position: center;

        background-size: contain;

        border-bottom: 1px solid #e5e8ee;
    }


    /* =========================================
       MAIN AREA
    ========================================= */

    .assistant-main {

        flex: 1;

        min-height: 0;

        display: flex;

        justify-content: center;

        align-items: center;

        padding: 24px 20px;

        box-sizing: border-box;

        overflow: hidden;
    }


    /* =========================================
       CHAT WRAPPER
    ========================================= */

    .chat-wrapper {

        width: 100%;

        max-width: 1100px;

        height: 100%;

        max-height: 820px;

        display: flex;

        flex-direction: column;

        background: #ffffff;

        border: 1px solid #e1e5eb;

        border-radius: 22px;

        overflow: hidden;

        box-shadow:
            0 12px 35px rgba(31, 41, 55, 0.08);
    }


    /* =========================================
       HEADER
    ========================================= */

    .chat-header {

        height: 96px;

        flex-shrink: 0;

        display: flex;

        align-items: center;

        padding: 0 28px;

        background: #ffffff;

        border-bottom: 1px solid #e5e8ee;
    }


    .ai-avatar {

        width: 58px;
        height: 58px;

        flex-shrink: 0;

        display: flex;

        align-items: center;

        justify-content: center;

        margin-right: 16px;

        border-radius: 50%;

        background:
            linear-gradient(
                135deg,
                #667eea,
                #764ba2
            );

        color: #ffffff;

        font-size: 23px;

        font-weight: 700;

        box-shadow:
            0 8px 20px rgba(102, 126, 234, 0.25);
    }


    .header-info {

        display: flex;

        flex-direction: column;

        gap: 5px;
    }


    .header-title {

        font-size: 23px;

        font-weight: 700;

        color: #172033;
    }


    .online-status {

        display: flex;

        align-items: center;

        gap: 8px;

        font-size: 14px;

        color: #16a34a;
    }


    .online-dot {

        width: 9px;
        height: 9px;

        border-radius: 50%;

        background: #22c55e;
    }


    /* =========================================
       CALL BUTTON
    ========================================= */

    .call-button {

        width: 46px;
        height: 46px;

        margin-left: auto;

        border: none;

        border-radius: 50%;

        background: #f1f3f8;

        color: #667eea;

        font-size: 20px;

        cursor: pointer;

        transition: 0.2s ease;
    }


    .call-button:hover {

        background: #667eea;

        color: #ffffff;

        transform: scale(1.05);
    }


    /* =========================================
       CHAT AREA
    ========================================= */

    .chat-area {

        position: relative;

        flex: 1;

        min-height: 0;

        overflow-y: auto;

        overflow-x: hidden;

        padding: 36px;

        box-sizing: border-box;

        background: #fbfcfe;
    }


    /* =========================================
       SCROLLBAR
    ========================================= */

    .chat-area::-webkit-scrollbar {

        width: 7px;
    }


    .chat-area::-webkit-scrollbar-track {

        background: transparent;
    }


    .chat-area::-webkit-scrollbar-thumb {

        background: #d5d9e2;

        border-radius: 10px;
    }


    /* =========================================
       WATERMARK
    ========================================= */

    .chat-area::before {

        content: "";

        position: absolute;

        right: 35px;

        bottom: 30px;

        width: 230px;

        height: 100px;

        background-image:
            url('Images/company-logo.png');

        background-repeat: no-repeat;

        background-position: center;

        background-size: contain;

        opacity: 0.035;

        pointer-events: none;
    }


    /* =========================================
       MESSAGE
    ========================================= */

    .message-row {

        display: flex;

        width: 100%;

        margin-bottom: 24px;

        position: relative;

        z-index: 1;
    }


    .message-row.bot {

        justify-content: flex-start;
    }


    .message {

        max-width: 680px;

        padding: 22px 24px;

        border-radius: 18px;

        font-size: 16px;

        line-height: 1.65;

        color: #172033;

        box-sizing: border-box;
    }


    .message.bot {

        background: #ffffff;

        border: 1px solid #dfe5ee;

        box-shadow:
            0 5px 15px rgba(31, 41, 55, 0.05);
    }


    .bot-title {

        margin-bottom: 8px;

        font-size: 18px;

        font-weight: 700;

        color: #29466d;
    }


    /* =========================================
       AVAILABLE DOMAINS
    ========================================= */

    .available-domain-button {

        margin-top: 16px;

        padding: 12px 24px;

        border: 1px solid #dbe2ea;

        border-radius: 24px;

        background: #ffffff;

        color: #53657d;

        font-size: 14px;

        font-weight: 700;

        cursor: pointer;

        transition:
            background 0.2s ease,
            color 0.2s ease,
            border 0.2s ease,
            box-shadow 0.2s ease;
    }


    /* =========================================
       AVAILABLE DOMAIN HOVER BLINK
    ========================================= */

    .available-domain-button:hover {

        animation:
            buttonBlink
            0.85s
            ease-in-out
            infinite;

        border-color: #667eea;
    }


    /* =========================================
       AVAILABLE DOMAIN SELECTED
    ========================================= */

    .available-domain-button.selected {

        background:
            linear-gradient(
                135deg,
                #667eea,
                #764ba2
            );

        border-color: transparent;

        color: #ffffff;

        cursor: default;

        box-shadow:
            0 6px 16px
            rgba(102, 126, 234, 0.22);
    }


    .available-domain-button.selected:hover {

        animation: none;

        background:
            linear-gradient(
                135deg,
                #667eea,
                #764ba2
            );

        color: #ffffff;
    }


    /* =========================================
       BLINK ANIMATION
    ========================================= */

    @keyframes buttonBlink {

        0% {

            opacity: 1;

            box-shadow:
                0 0 0
                rgba(102, 126, 234, 0);
        }

        50% {

            opacity: 0.60;

            box-shadow:
                0 0 0 6px
                rgba(102, 126, 234, 0.10);
        }

        100% {

            opacity: 1;

            box-shadow:
                0 0 0
                rgba(102, 126, 234, 0);
        }
    }


    /* =========================================
       DOMAIN CONTAINER
    ========================================= */

    .domain-container {

        position: relative;

        z-index: 1;

        margin-top: 4px;

        margin-bottom: 30px;
    }


    .domain-heading {

        margin-bottom: 12px;

        font-size: 17px;

        font-weight: 600;

        color: #172033;
    }


    .domain-buttons {

        display: flex;

        flex-wrap: wrap;

        align-items: center;

        gap: 10px;
    }


    /* =========================================
       DOMAIN + COURSE BUTTON
    ========================================= */

    .domain-button,
    .course-button {

        padding: 11px 22px;

        border: 1px solid #dbe2ea;

        border-radius: 25px;

        background: #ffffff;

        color: #53657d;

        font-size: 14px;

        font-weight: 700;

        cursor: pointer;

        white-space: nowrap;

        transition:
            background 0.2s ease,
            color 0.2s ease,
            border 0.2s ease,
            box-shadow 0.2s ease;
    }


    /* =========================================
       DOMAIN HOVER BLINK
    ========================================= */

    .domain-button:hover {

        animation:
            buttonBlink
            0.85s
            ease-in-out
            infinite;

        border-color: #667eea;
    }


    /* =========================================
       COURSE HOVER BLINK
    ========================================= */

    .course-button:hover {

        animation:
            buttonBlink
            0.85s
            ease-in-out
            infinite;

        border-color: #667eea;
    }


    /* =========================================
       SELECTED
    ========================================= */

    .domain-button.selected,
    .course-button.selected {

        background:
            linear-gradient(
                135deg,
                #667eea,
                #764ba2
            );

        border-color: transparent;

        color: #ffffff;

        cursor: default;

        box-shadow:
            0 6px 16px
            rgba(102, 126, 234, 0.22);
    }


    .domain-button.selected:hover,
    .course-button.selected:hover {

        animation: none;

        background:
            linear-gradient(
                135deg,
                #667eea,
                #764ba2
            );

        color: #ffffff;
    }


    /* =========================================
       COURSE CONTAINER
    ========================================= */

    .course-container {

        position: relative;

        z-index: 1;

        margin-top: 8px;

        margin-bottom: 30px;
    }


    .course-heading {

        margin-bottom: 12px;

        font-size: 17px;

        font-weight: 600;

        color: #172033;
    }


    .course-buttons {

        display: flex;

        flex-wrap: wrap;

        align-items: center;

        gap: 10px;
    }


    /* =========================================
       COURSE INFORMATION
    ========================================= */

    .course-info {

        position: relative;

        z-index: 1;

        max-width: 680px;

        margin-top: 12px;

        margin-bottom: 24px;

        padding: 20px 22px;

        border-radius: 16px;

        background: #ffffff;

        border: 1px solid #dfe5ee;

        box-shadow:
            0 5px 15px
            rgba(31, 41, 55, 0.05);

        color: #3c4a60;

        font-size: 14px;

        line-height: 1.65;
    }


    .course-info-title {

        margin-bottom: 8px;

        font-size: 17px;

        font-weight: 700;

        color: #29466d;
    }


    /* =========================================
       CALL MESSAGE
    ========================================= */

    .call-message {

        position: relative;

        z-index: 1;

        max-width: 650px;

        padding: 18px 20px;

        margin-bottom: 20px;

        border-radius: 15px;

        background: #ffffff;

        border: 1px solid #e1e5eb;

        color: #53657d;
    }


    /* =========================================
       RESPONSIVE
    ========================================= */

    @media (max-width: 768px) {

        .company-logo-section {

            height: 60px;
        }


        .assistant-main {

            padding: 12px;
        }


        .chat-wrapper {

            border-radius: 16px;
        }


        .chat-header {

            height: 82px;

            padding: 0 18px;
        }


        .ai-avatar {

            width: 48px;
            height: 48px;

            margin-right: 12px;

            font-size: 19px;
        }


        .header-title {

            font-size: 18px;
        }


        .online-status {

            font-size: 12px;
        }


        .call-button {

            width: 40px;
            height: 40px;
        }


        .chat-area {

            padding: 22px 18px;
        }


        .message {

            max-width: 100%;

            padding: 18px;

            font-size: 15px;
        }


        .domain-buttons,
        .course-buttons {

            gap: 8px;
        }


        .domain-button,
        .course-button {

            padding: 10px 17px;

            font-size: 13px;
        }
    }


    @media (max-width: 480px) {

        .assistant-main {

            padding: 0;
        }


        .chat-wrapper {

            width: 100%;

            height: 100%;

            max-height: none;

            border-radius: 0;

            border-left: none;

            border-right: none;
        }


        .chat-header {

            padding: 0 15px;
        }


        .chat-area {

            padding: 18px 14px;
        }


        .message {

            padding: 16px;
        }


        .domain-button,
        .course-button {

            padding: 9px 15px;
        }
    }

</style>


<div class="assistant-page">


    <!-- =========================================
         COMPANY LOGO
    ========================================== -->

    <div class="company-logo-section">
    </div>


    <!-- =========================================
         MAIN
    ========================================== -->

    <div class="assistant-main">

        <div class="chat-wrapper">


            <!-- =====================================
                 HEADER
            ====================================== -->

            <div class="chat-header">

                <div class="ai-avatar">
                    AI
                </div>


                <div class="header-info">

                    <div class="header-title">
                        AI Learning Assistant
                    </div>


                    <div class="online-status">

                        <span class="online-dot">
                        </span>

                        <span>
                            Online
                        </span>

                    </div>

                </div>


                <button
                    type="button"
                    class="call-button"
                    onclick="makeCall()"
                    title="Call Assistance">

                    ☎

                </button>

            </div>


            <!-- =====================================
                 CHAT AREA
            ====================================== -->

            <div
                id="chatArea"
                class="chat-area">


                <!-- INITIAL MESSAGE -->

                <div class="message-row bot">

                    <div class="message bot">

                        <div class="bot-title">
                            AI Learning Assistant
                        </div>


                        Hi! 👋

                        <br />

                        Do you know about the available courses?


                        <br />


                        <button
                            type="button"
                            class="available-domain-button"
                            onclick="showAvailableDomains()">

                            Available Domains

                        </button>

                    </div>

                </div>


            </div>

        </div>

    </div>

</div>


<script>

    /* =========================================
       DOMAIN DATA
    ========================================== */

    var domainData = {

        "IT": [
            "Python",
            "Java",
            "Data Analytics",
            "Software Development"
        ],

        "IT Infrastructure": [
            "Networking",
            "Cloud Computing",
            "Cyber Security",
            "System Administration"
        ],

        "Circuit": [
            "Digital Electronics",
            "Embedded Systems",
            "VLSI",
            "Microcontrollers"
        ],

        "Mechanical": [
            "CAD",
            "CNC",
            "Robotics",
            "Manufacturing"
        ],

        "Civil": [
            "AutoCAD Civil",
            "Structural Engineering",
            "Quantity Surveying",
            "Construction Management"
        ]

    };


    /* =========================================
       CHAT AREA
    ========================================== */

    var chatArea =
        document.getElementById("chatArea");


    /* =========================================
       AVAILABLE DOMAINS
    ========================================== */

    function showAvailableDomains() {

        var availableButton =
            document.querySelector(
                ".available-domain-button"
            );


        if (
            availableButton.classList.contains(
                "selected"
            )
        ) {

            return;
        }


        /* Purple + lock */

        availableButton.classList.add(
            "selected"
        );

        availableButton.disabled = true;


        /* Bot reply */

        addBotMessage(
            "Sure! 😊<br>" +
            "Please select the domain you are interested in."
        );


        /* Container */

        var container =
            document.createElement(
                "div"
            );

        container.className =
            "domain-container";


        /* Heading */

        var heading =
            document.createElement(
                "div"
            );

        heading.className =
            "domain-heading";

        heading.textContent =
            "Available Domains";


        container.appendChild(
            heading
        );


        /* Button container */

        var buttons =
            document.createElement(
                "div"
            );

        buttons.className =
            "domain-buttons";


        /* Domains */

        var domains = [

            "IT",
            "IT Infrastructure",
            "Circuit",
            "Mechanical",
            "Civil"

        ];


        for (
            var i = 0;
            i < domains.length;
            i++
        ) {

            var button =
                document.createElement(
                    "button"
                );


            button.type =
                "button";


            button.className =
                "domain-button";


            button.textContent =
                domains[i];


            button.setAttribute(
                "data-domain",
                domains[i]
            );


            button.onclick =
                function () {


                    if (
                        this.classList.contains(
                            "selected"
                        )
                    ) {

                        return;
                    }


                    /* Purple */

                    this.classList.add(
                        "selected"
                    );


                    /* Lock */

                    this.disabled =
                        true;


                    var selectedDomain =
                        this.getAttribute(
                            "data-domain"
                        );


                    selectDomain(
                        selectedDomain
                    );

                };


            buttons.appendChild(
                button
            );
        }


        container.appendChild(
            buttons
        );


        chatArea.appendChild(
            container
        );


        scrollToBottom();

    }


    /* =========================================
       SELECT DOMAIN
    ========================================== */

    function selectDomain(
        domainName
    ) {

        addBotMessage(

            "<b>" +
            escapeHtml(domainName) +
            "</b> selected. 👍<br><br>" +

            "Which course would you like to know about?"

        );


        showCourses(
            domainName
        );

    }


    /* =========================================
       SHOW COURSES
    ========================================== */

    function showCourses(
        domainName
    ) {

        var container =
            document.createElement(
                "div"
            );


        container.className =
            "course-container";


        var heading =
            document.createElement(
                "div"
            );


        heading.className =
            "course-heading";


        heading.textContent =
            "Available Courses";


        container.appendChild(
            heading
        );


        var buttons =
            document.createElement(
                "div"
            );


        buttons.className =
            "course-buttons";


        var courses =
            domainData[domainName];


        if (
            courses &&
            courses.length > 0
        ) {

            for (
                var i = 0;
                i < courses.length;
                i++
            ) {

                var button =
                    document.createElement(
                        "button"
                    );


                button.type =
                    "button";


                button.className =
                    "course-button";


                button.textContent =
                    courses[i];


                button.setAttribute(
                    "data-course",
                    courses[i]
                );


                button.setAttribute(
                    "data-domain",
                    domainName
                );


                button.onclick =
                    function () {


                        if (
                            this.classList.contains(
                                "selected"
                            )
                        ) {

                            return;
                        }


                        /* Purple */

                        this.classList.add(
                            "selected"
                        );


                        /* Lock */

                        this.disabled =
                            true;


                        var selectedCourse =
                            this.getAttribute(
                                "data-course"
                            );


                        var selectedDomain =
                            this.getAttribute(
                                "data-domain"
                            );


                        showCourseInformation(

                            selectedCourse,
                            selectedDomain

                        );

                    };


                buttons.appendChild(
                    button
                );
            }

        }


        container.appendChild(
            buttons
        );


        chatArea.appendChild(
            container
        );


        scrollToBottom();

    }


    /* =========================================
       COURSE INFORMATION
    ========================================== */

    function showCourseInformation(
        courseName,
        domainName
    ) {

        addBotMessage(

            "<b>" +
            escapeHtml(courseName) +
            "</b> is available under the " +

            "<b>" +
            escapeHtml(domainName) +
            "</b> domain. 😊"

        );


        var info =
            document.createElement(
                "div"
            );


        info.className =
            "course-info";


        info.innerHTML =

            "<div class='course-info-title'>" +

            escapeHtml(courseName) +

            "</div>" +

            "This course helps learners build " +

            "practical knowledge and skills related " +

            "to " +

            escapeHtml(courseName) +

            ". You can explore the course " +

            "details and learning opportunities " +

            "through the AI Learning Assistant.";


        chatArea.appendChild(
            info
        );


        scrollToBottom();

    }


    /* =========================================
       ADD BOT MESSAGE
    ========================================== */

    function addBotMessage(
        text
    ) {

        var row =
            document.createElement(
                "div"
            );


        row.className =
            "message-row bot";


        var message =
            document.createElement(
                "div"
            );


        message.className =
            "message bot";


        message.innerHTML =
            text;


        row.appendChild(
            message
        );


        chatArea.appendChild(
            row
        );


        scrollToBottom();

    }


    /* =========================================
       CALL
    ========================================== */

    function makeCall() {

        addBotMessage(

            "📞 Call assistance is available. " +
            "Our support team can help you " +
            "with your learning enquiry."

        );

    }


    /* =========================================
       ESCAPE HTML
    ========================================== */

    function escapeHtml(
        value
    ) {

        return String(value)

            .replace(
                /&/g,
                "&amp;"
            )

            .replace(
                /</g,
                "&lt;"
            )

            .replace(
                />/g,
                "&gt;"
            )

            .replace(
                /"/g,
                "&quot;"
            )

            .replace(
                /'/g,
                "&#039;"
            );
    }


    /* =========================================
       SCROLL
    ========================================== */

    function scrollToBottom() {

        setTimeout(
            function () {

                chatArea.scrollTop =
                    chatArea.scrollHeight;

            },
            50
        );

    }


    /* =========================================
       PAGE LOAD
    ========================================== */

    window.onload =
        function () {

            scrollToBottom();

        };

</script>

</asp:Content>