/* =========================================================
   UNITED SOFT TECH
   AI Learning Assistant - conversation engine
   ========================================================= */

(function () {
    "use strict";

    /* =====================================================
       COURSE DATA
       ===================================================== */

    var COURSES = {

        python: {
            key: "python",
            name: "Python Programming",
            short: "Python",
            icon: "Py",
            duration: "3 Months",
            hours: "About 90 hours of instructor led training plus practice",
            mode: "Classroom / Online (live) + hands-on lab",
            overview:
                "Python is a clean, readable and beginner friendly programming language. " +
                "It is the practical entry point into software development, data handling, " +
                "automation and artificial intelligence.",
            highlights: [
                "Strong foundation in programming logic and problem solving",
                "Real industry style mini projects in every module",
                "Preparation for Python developer interview rounds"
            ],
            levels: {
                Beginner: {
                    duration: "4 Weeks",
                    focus: "Programming fundamentals, variables, data types, conditions, loops, functions and basic problem solving."
                },
                Intermediate: {
                    duration: "6 Weeks",
                    focus: "OOP, file handling, exception handling, modules, working with databases and API calls."
                },
                Advanced: {
                    duration: "6 Weeks",
                    focus: "Data structures, decorators, generators, automation pipelines, testing and optimisation."
                }
            },
            syllabus: [
                "Module 1 - Getting started with Python, setup and syntax",
                "Module 2 - Variables, data types and operators",
                "Module 3 - Conditional statements and loops",
                "Module 4 - Strings, lists, tuples and dictionaries",
                "Module 5 - Functions, modules and packages",
                "Module 6 - File handling and error handling",
                "Module 7 - Object Oriented Programming",
                "Module 8 - Working with databases (SQLite / MySQL)",
                "Module 9 - Consuming REST APIs with requests",
                "Module 10 - Automation, testing and final project"
            ],
            tools: [
                "Python 3.x",
                "VS Code",
                "Jupyter Notebook",
                "Git and GitHub",
                "SQLite / MySQL",
                "Postman"
            ],
            projects: [
                "Student result management system (beginner)",
                "Expense tracker with charts and CSV export",
                "Web scraping and data cleaning report",
                "REST API service with database backend",
                "Capstone - automation tool for repetitive office tasks"
            ],
            careers: [
                "Python Developer",
                "Backend Developer",
                "Automation Engineer",
                "Data Analyst (with SQL)",
                "QA / Test Automation Engineer"
            ],
            hiring: [
                "TCS, Infosys, Wipro, Cognizant",
                "Accenture, Capgemini, Tech Mahindra",
                "Zoho, Freshworks, product startups",
                "Consulting and automation service firms"
            ]
        },

        java: {
            key: "java",
            name: "Java Programming",
            short: "Java",
            icon: "Jv",
            duration: "3 Months",
            hours: "About 90 hours of instructor led training plus practice",
            mode: "Classroom / Online (live) + lab exercises",
            overview:
                "Java is the standard choice for enterprise, banking and backend systems. " +
                "It is used to build large, reliable, long running applications and remains " +
                "one of the highest volume hiring skills in the market.",
            highlights: [
                "Strong Object Oriented Programming foundation",
                "Core Java plus JDBC and enterprise ready patterns",
                "Live coding practice aligned to interview rounds"
            ],
            levels: {
                Beginner: {
                    duration: "4 Weeks",
                    focus: "Syntax, data types, control flow, arrays, methods and basic OOP concepts."
                },
                Intermediate: {
                    duration: "6 Weeks",
                    focus: "OOP in depth, collections, exception handling, I/O and multithreading basics."
                },
                Advanced: {
                    duration: "6 Weeks",
                    focus: "Generics, JDBC with databases, REST services, testing and design patterns."
                }
            },
            syllabus: [
                "Module 1 - Introduction to Java, JDK and program structure",
                "Module 2 - Variables, data types and operators",
                "Module 3 - Control statements, loops and arrays",
                "Module 4 - Methods, parameter passing and recursion",
                "Module 5 - Object Oriented Programming (classes, objects, inheritance)",
                "Module 6 - Interfaces, polymorphism and encapsulation",
                "Module 7 - Collections and generic types",
                "Module 8 - Exception handling and file I/O",
                "Module 9 - Database programming with JDBC",
                "Module 10 - REST services, testing and final project"
            ],
            tools: [
                "JDK 11 / 17",
                "IntelliJ IDEA",
                "Eclipse",
                "Maven",
                "Git and GitHub",
                "MySQL / Oracle",
                "Postman"
            ],
            projects: [
                "Bank account management console application",
                "Employee management system with database",
                "Library management system (CRUD + login)",
                "REST API service for a small business workflow",
                "Capstone - console based billing application"
            ],
            careers: [
                "Java Developer",
                "Backend Developer",
                "Enterprise Application Developer",
                "Android Developer",
                "Software Engineer ( banking / insurance domain)"
            ],
            hiring: [
                "TCS, Infosys, Wipro, Cognizant, HCLTech",
                "Accenture, Capgemini, Tech Mahindra, IBM",
                "Banking and insurance service providers",
                "Product and middleware development teams"
            ]
        },

        web: {
            key: "web",
            name: "Web Development",
            short: "Web Development",
            icon: "Wd",
            duration: "4 Months",
            hours: "About 120 hours of instructor led training plus practice",
            mode: "Classroom / Online (live) + live project reviews",
            overview:
                "A full stack web development track covering front-end interface building, " +
                "responsive layouts, client side logic and server side application development " +
                "with databases.",
            highlights: [
                "HTML5, CSS3 and JavaScript fundamentals to professional level",
                "Responsive, mobile first interface development",
                "Server side APIs, database design and deployment"
            ],
            levels: {
                Beginner: {
                    duration: "5 Weeks",
                    focus: "HTML5 structure, CSS3 styling, layout, box model and responsive basics."
                },
                Intermediate: {
                    duration: "6 Weeks",
                    focus: "JavaScript language core, DOM manipulation, forms and Git workflow."
                },
                Advanced: {
                    duration: "8 Weeks",
                    focus: "Front-end framework, REST API integration, back-end server and deployment."
                }
            },
            syllabus: [
                "Module 1 - How the web works: domains, hosting, HTTP",
                "Module 2 - HTML5 semantics and accessibility",
                "Module 3 - CSS3 styling, flexbox and grid",
                "Module 4 - Responsive and mobile first design",
                "Module 5 - JavaScript language fundamentals",
                "Module 6 - DOM events and form validation",
                "Module 7 - Version control with Git and GitHub",
                "Module 8 - Front-end framework (React) essentials",
                "Module 9 - Server side development, REST APIs and databases",
                "Module 10 - Deployment, performance and final full stack project"
            ],
            tools: [
                "HTML5 and CSS3",
                "JavaScript (ES6+)",
                "VS Code",
                "React",
                "Node.js and Express",
                "MySQL",
                "Git and GitHub",
                "Chrome DevTools"
            ],
            projects: [
                "Responsive business landing page",
                "Dynamic product catalogue with filtering",
                "Notes application with local storage and API sync",
                "Full stack enquiry and admin dashboard application",
                "Capstone - deploy a complete web application"
            ],
            careers: [
                "Front-end Developer",
                "Back-end Developer",
                "Full Stack Developer",
                "UI / Web Designer",
                "Freelance Web Developer"
            ],
            hiring: [
                "TCS, Infosys, Wipro, Cognizant",
                "Accenture, Capgemini, Tech Mahindra",
                "Zoho, Freshworks, product startups",
                "Digital agencies and freelance marketplaces"
            ]
        },

        ai: {
            key: "ai",
            name: "AI & Machine Learning",
            short: "AI & ML",
            icon: "Ai",
            duration: "4 Months",
            hours: "About 120 hours of instructor led training plus lab work",
            mode: "Classroom / Online (live) + model lab",
            overview:
                "A practical Artificial Intelligence and Machine Learning programme covering " +
                "Python for data, supervised and unsupervised learning, model evaluation and " +
                "a deployable end-to-end project.",
            highlights: [
                "Mathematics focused only as much as needed to build models",
                "Every algorithm demonstrated on real datasets",
                "Capstone model documented and presented for interview"
            ],
            levels: {
                Beginner: {
                    duration: "5 Weeks",
                    focus: "Python refresher, NumPy, Pandas, data cleaning and visualisation."
                },
                Intermediate: {
                    duration: "6 Weeks",
                    focus: "Supervised learning, regression, classification, trees and model evaluation."
                },
                Advanced: {
                    duration: "8 Weeks",
                    focus: "Unsupervised learning, NLP and computer vision basics, deployment."
                }
            },
            syllabus: [
                "Module 1 - AI, ML and DL landscape and job roles",
                "Module 2 - Python for data with NumPy and Pandas",
                "Module 3 - Data cleaning, preprocessing and visualisation",
                "Module 4 - Supervised learning: linear and logistic regression",
                "Module 5 - Decision trees, random forests and ensemble methods",
                "Module 6 - K-NN, SVM and Naive Bayes classification",
                "Module 7 - Model evaluation, cross validation and overfitting",
                "Module 8 - Unsupervised learning: clustering with K-Means and DBSCAN",
                "Module 9 - Introduction to deep learning and neural networks",
                "Module 10 - Model deployment and final capstone project"
            ],
            tools: [
                "Python",
                "Jupyter Notebook / JupyterLab",
                "NumPy, Pandas, Matplotlib, Seaborn",
                "scikit-learn",
                "TensorFlow / Keras",
                "VS Code",
                "Git and GitHub"
            ],
            projects: [
                "Customer churn prediction model",
                "House price prediction system",
                "Spam / sentiment classification on text data",
                "Product recommendation engine",
                "Capstone - train, evaluate and deploy an end-to-end ML model"
            ],
            careers: [
                "Machine Learning Engineer",
                "Data Scientist",
                "Data Analyst",
                "AI / NLP Engineer (entry level)",
                "Business Intelligence Analyst"
            ],
            hiring: [
                "TCS, Infosys, Wipro, Cognizant (analytics roles)",
                "Accenture, Capgemini, Tech Mahindra",
                "Product startups and R&D product teams",
                "BFSI, healthcare and retail analytics teams"
            ]
        }

    };

    var COURSE_ORDER = ["python", "java", "web", "ai"];

    var LEVELS = ["Beginner", "Intermediate", "Advanced"];


    /* =====================================================
       STATE / DOM
       ===================================================== */

    var chatArea = null;
    var messageInput = null;
    var activeCourse = null;
    var enquiryCount = 0;


    /* =====================================================
       UTILITIES
       ===================================================== */

    function escapeHtml(value) {
        return String(value)
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#039;");
    }

    function timeLabel() {
        var now = new Date();
        var hours = now.getHours();
        var minutes = now.getMinutes();
        var suffix = hours >= 12 ? "PM" : "AM";
        var hour12 = hours % 12;
        if (hour12 === 0) {
            hour12 = 12;
        }
        return hour12 + ":" + (minutes < 10 ? "0" : "") + minutes + " " + suffix;
    }

    function scrollToBottom() {
        window.setTimeout(function () {
            if (chatArea) {
                chatArea.scrollTop = chatArea.scrollHeight;
            }
        }, 40);
    }

    function list(items) {
        var html = "";
        for (var i = 0; i < items.length; i++) {
            html += "<li>" + escapeHtml(items[i]) + "</li>";
        }
        return html;
    }

    function chips(actions) {
        var html = '<div class="ai-chips">';
        for (var i = 0; i < actions.length; i++) {
            html += '<button type="button" class="ai-chip' +
                (actions[i].primary ? " ai-chip--solid" : "") +
                '" data-ask="' + escapeHtml(actions[i].ask) + '">' +
                escapeHtml(actions[i].label) +
                "</button>";
        }
        return html + "</div>";
    }

    function courseChips(includeOverview) {
        var actions = [];
        for (var i = 0; i < COURSE_ORDER.length; i++) {
            actions.push({
                label: COURSES[COURSE_ORDER[i]].short,
                ask: "Tell me about " + COURSES[COURSE_ORDER[i]].short
            });
        }
        if (includeOverview) {
            actions.push({ label: "Enquiry", ask: "I want to enrol", primary: true });
        }
        return chips(actions);
    }


    /* =====================================================
       MESSAGE RENDERING
       ===================================================== */

    function addUserMessage(text) {
        var row = document.createElement("div");
        row.className = "ai-row ai-row--user";

        row.innerHTML =
            '<div class="ai-row__bubble">' +
            "<p>" + escapeHtml(text) + "</p>" +
            '<span class="ai-row__time">' + timeLabel() + "</span>" +
            "</div>" +
            '<div class="ai-row__avatar">You</div>';

        chatArea.appendChild(row);
        scrollToBottom();
    }

    function addBotMessage(html) {
        var row = document.createElement("div");
        row.className = "ai-row";

        row.innerHTML =
            '<div class="ai-row__avatar">AI</div>' +
            '<div class="ai-row__bubble">' + html +
            '<span class="ai-row__time">' + timeLabel() + "</span></div>";

        chatArea.appendChild(row);
        scrollToBottom();
        return row;
    }

    function showTyping() {
        var row = document.createElement("div");
        row.className = "ai-row";
        row.setAttribute("data-typing", "1");

        row.innerHTML =
            '<div class="ai-row__avatar">AI</div>' +
            '<div class="ai-row__bubble"><span class="ai-typing">' +
            "<span></span><span></span><span></span></span></div>";

        chatArea.appendChild(row);
        scrollToBottom();
        return row;
    }

    function removeTyping(node) {
        if (node && node.parentNode) {
            node.parentNode.removeChild(node);
        }
    }


    /* =====================================================
       INTENT DETECTION
       ===================================================== */

    function detectCourse(text) {
        var t = " " + text + " ";

        if (/(\bai\s*(and|&)\s*ml\b)|(\bartificial intelligence\b)|(\bmachine learning\b)|(\bdeep learning\b)|(\bdata science\b)|(\bml\b)|(\bai\b)/.test(t)) {
            return "ai";
        }

        if (/(\bweb development\b)|(\bweb dev\b)|(\bweb designer\b)|(\bfrontend\b)|(\bfront-end\b)|(\bfull stack\b)|(\bfullstack\b)|(\bhtml\b)|(\bbootstrap\b)|(\breact\b)/.test(t)) {
            return "web";
        }

        if (/(\bpython\b)|(\bpy\b)/.test(t)) {
            return "python";
        }

        if (/(\bjava\b)|(\bj2ee\b)|(\bjdbc\b)/.test(t)) {
            return "java";
        }

        return null;
    }

    function detectLevel(text) {
        if (/\badvanced\b|\bexpert\b|\bpro\b|\blevel 3\b/.test(text)) {
            return "Advanced";
        }
        if (/\bintermediate\b|\bmedium\b|\blevel 2\b/.test(text)) {
            return "Intermediate";
        }
        if (/\bbeginner\b|\bbasic\b|\bfresher\b|\blevel 1\b|\bstarting\b/.test(text)) {
            return "Beginner";
        }
        return null;
    }

    function resolveCourse(text) {
        var found = detectCourse(text);
        if (found) {
            activeCourse = found;
        }
        return found || activeCourse;
    }


    /* =====================================================
       VIEWS
       ===================================================== */

    function viewGreeting() {
        addBotMessage(
            "<p><strong>Hi! \ud83d\udc4b</strong></p>" +
            "<p>I'm your AI Learning Assistant.</p>" +
            "<p>How can I help you today?</p>" +
            courseChips(false)
        );
    }

    function viewThanks() {
        addBotMessage(
            "<p>You're most welcome! \ud83d\ude0a</p>" +
            "<p>Ask me anything else about courses, duration, syllabus, projects or admissions.</p>"
        );
    }

    function viewCourseList() {
        var html = "<p>Sure \ud83d\udcd6 Here are the courses available at UNITED SOFT TECH:</p><div class=\"ai-card\">";

        for (var i = 0; i < COURSE_ORDER.length; i++) {
            var c = COURSES[COURSE_ORDER[i]];
            html +=
                '<div class="ai-card__title" style="margin-top:' + (i === 0 ? "0" : "14px") + '">' +
                escapeHtml(c.name) + "</div>" +
                '<div class="ai-card__meta">' +
                '<span class="ai-card__chip">' + escapeHtml(c.duration) + "</span>" +
                '<span class="ai-card__chip">Beginner to Advanced</span>' +
                '<span class="ai-card__chip">' + escapeHtml(c.hours.split(" of ")[0]) + "</span>" +
                "</div>";
        }

        html += "</div>";
        addBotMessage(html + courseChips(true));
    }

    function viewCourseOverview(key) {
        var c = COURSES[key];

        var html =
            '<div class="ai-card">' +
            '<div class="ai-card__title">' + escapeHtml(c.name) + "</div>" +
            '<div class="ai-card__meta">' +
            '<span class="ai-card__chip">' + escapeHtml(c.duration) + "</span>" +
            '<span class="ai-card__chip">3 Levels</span>' +
            '<span class="ai-card__chip">' + escapeHtml(c.mode.split(" + ")[0]) + "</span>" +
            "</div>" +
            "<p>" + escapeHtml(c.overview) + "</p>" +
            '<div class="ai-section__label">Course highlights</div>' +
            '<ul class="ai-list">' + list(c.highlights) + "</ul>" +
            '<div class="ai-section__label">Available levels</div>' +
            '<ul class="ai-list">' + list(LEVELS) + "</ul>" +
            "</div>";

        var actions = [
            { label: "Duration", ask: "What is the duration of " + c.short + "?" },
            { label: "Syllabus", ask: "Show " + c.short + " syllabus" },
            { label: "Tools", ask: "What tools are used in " + c.short + "?" },
            { label: "Projects", ask: "What projects can I do in " + c.short + "?" },
            { label: "Placement", ask: "Is there placement for " + c.short + "?" },
            { label: "Beginner level", ask: c.short + " beginner level" },
            { label: "Enrol", ask: "I want to enrol in " + c.short, primary: true }
        ];

        addBotMessage(html + chips(actions));
    }

    function viewLevel(key, level) {
        var c = COURSES[key];
        var info = c.levels[level];

        var html =
            '<div class="ai-card">' +
            '<div class="ai-card__title">' + escapeHtml(c.name) + " - " + level + "</div>" +
            '<div class="ai-card__meta">' +
            '<span class="ai-card__chip">' + escapeHtml(info.duration) + " for this level</span>" +
            '<span class="ai-card__chip">Full course: ' + escapeHtml(c.duration) + "</span>" +
            "</div>" +
            "<p><strong>What you learn:</strong> " + escapeHtml(info.focus) + "</p>" +
            '<div class="ai-section__label">What is covered in the full course</div>' +
            '<ul class="ai-list">' + list(c.syllabus.slice(0, 4)) + "</ul>" +
            "</div>";

        var other = [];
        for (var i = 0; i < LEVELS.length; i++) {
            if (LEVELS[i] !== level) {
                other.push({ label: LEVELS[i], ask: c.short + " " + LEVELS[i] + " level" });
            }
        }

        other.push({ label: "Full syllabus", ask: "Show " + c.short + " syllabus" });
        other.push({ label: "Enquire", ask: "I want to enrol in " + c.short, primary: true });

        addBotMessage(html + chips(other));
    }

    function viewDuration(key) {
        var c = COURSES[key];

        var html =
            '<div class="ai-card">' +
            '<div class="ai-card__title">' + escapeHtml(c.name) + " - Duration</div>" +
            '<div class="ai-card__meta">' +
            '<span class="ai-card__chip">Total: ' + escapeHtml(c.duration) + "</span>" +
            '<span class="ai-card__chip">Beginner: ' + escapeHtml(c.levels.Beginner.duration) + "</span>" +
            '<span class="ai-card__chip">Intermediate: ' + escapeHtml(c.levels.Intermediate.duration) + "</span>" +
            '<span class="ai-card__chip">Advanced: ' + escapeHtml(c.levels.Advanced.duration) + "</span>" +
            "</div>" +
            "<p>" + escapeHtml(c.hours) + ".</p>" +
            "<p>Classes are scheduled in batches so that working professionals and students " +
            "can attend consistently.</p>" +
            "</div>";

        addBotMessage(html + chips([
            { label: "Syllabus", ask: "Show " + c.short + " syllabus" },
            { label: "Levels", ask: c.short + " beginner level" },
            { label: "Placement", ask: "Is there placement for " + c.short + "?" },
            { label: "Enquire", ask: "I want to enrol in " + c.short, primary: true }
        ]));
    }

    function viewSyllabus(key) {
        var c = COURSES[key];

        var html =
            '<div class="ai-card">' +
            '<div class="ai-card__title">' + escapeHtml(c.name) + " - Syllabus</div>" +
            '<div class="ai-card__meta">' +
            '<span class="ai-card__chip">' + c.syllabus.length + " modules</span>" +
            '<span class="ai-card__chip">' + escapeHtml(c.duration) + "</span>" +
            "</div>" +
            '<ul class="ai-list">' + list(c.syllabus) + "</ul>" +
            "</div>";

        addBotMessage(html + chips([
            { label: "Tools used", ask: "What tools are used in " + c.short + "?" },
            { label: "Projects", ask: "What projects can I do in " + c.short + "?" },
            { label: "Placement", ask: "Is there placement for " + c.short + "?" },
            { label: "Enquire", ask: "I want to enrol in " + c.short, primary: true }
        ]));
    }

    function viewTools(key) {
        var c = COURSES[key];

        addBotMessage(
            '<div class="ai-card">' +
            '<div class="ai-card__title">' + escapeHtml(c.name) + " - Tools and Technologies</div>" +
            '<ul class="ai-list">' + list(c.tools) + "</ul>" +
            "<p>Every tool is installed and demonstrated during the live session, and you get " +
            "guided practice on each one.</p>" +
            "</div>" +
            chips([
                { label: "Syllabus", ask: "Show " + c.short + " syllabus" },
                { label: "Projects", ask: "What projects can I do in " + c.short + "?" },
                { label: "Enquire", ask: "I want to enrol in " + c.short, primary: true }
            ])
        );
    }

    function viewProjects(key) {
        var c = COURSES[key];

        addBotMessage(
            '<div class="ai-card">' +
            '<div class="ai-card__title">' + escapeHtml(c.name) + " - Sample Projects</div>" +
            '<div class="ai-section__label">Build during the course</div>' +
            '<ul class="ai-list">' + list(c.projects) + "</ul>" +
            "<p>Each project is reviewed by the trainer, and the capstone project is added to " +
            "your portfolio for interviews.</p>" +
            "</div>" +
            chips([
                { label: "Tools used", ask: "What tools are used in " + c.short + "?" },
                { label: "Placement", ask: "Is there placement for " + c.short + "?" },
                { label: "Enquire", ask: "I want to enrol in " + c.short, primary: true }
            ])
        );
    }

    function viewPlacement(key) {
        var actions = [];

        if (!key) {
            addBotMessage(
                "<p>Yes \ud83d\ude80 Career support is part of every programme:</p>" +
                '<div class="ai-card">' +
                '<div class="ai-card__title">Career and placement support</div>' +
                '<ul class="ai-list">' +
                "<li>Resume preparation and profile review</li>" +
                "<li>Mock technical and HR interview rounds</li>" +
                "<li>Referral support with hiring partners</li>" +
                "<li>Company specific preparation guidance</li>" +
                "</ul>" +
                "<p>Placement is never guaranteed, but completing the capstone project and " +
                "appearing consistently for mock interviews gives you the best preparation.</p>" +
                "</div>"
            );
            addBotMessage("<p>Which course would you like placement details for?</p>" + courseChips(false));
            return;
        }

        var c = COURSES[key];

        var html =
            '<div class="ai-card">' +
            '<div class="ai-card__title">' + escapeHtml(c.name) + " - Career Paths</div>" +
            '<ul class="ai-list">' + list(c.careers) + "</ul>" +
            '<div class="ai-section__label">Typical hiring companies</div>' +
            '<ul class="ai-list">' + list(c.hiring) + "</ul>" +
            "</div>";

        actions.push({ label: "Projects", ask: "What projects can I do in " + c.short + "?" });
        actions.push({ label: "Duration", ask: "What is the duration of " + c.short + "?" });
        actions.push({ label: "Enquire", ask: "I want to enrol in " + c.short, primary: true });

        addBotMessage(html + chips(actions));
    }

    function viewCompare(text) {
        var found = [];
        var lower = text;

        if (/python/.test(lower)) { found.push("python"); }
        if (/java/.test(lower)) { found.push("java"); }
        if (/web|html|css|react/.test(lower)) { found.push("web"); }
        if (/ai|ml|machine|data/.test(lower)) { found.push("ai"); }

        if (found.length < 2) {
            addBotMessage(
                "<p>Happy to compare \u2014 which two would you like me to compare?</p>" +
                courseChips(false)
            );
            return;
        }

        var html = '<div class="ai-card"><div class="ai-card__title">Course comparison</div>';

        for (var i = 0; i < found.length; i++) {
            var c = COURSES[found[i]];
            html +=
                '<div class="ai-section__label">' + escapeHtml(c.name) + "</div>" +
                "<p>" + escapeHtml(c.duration) + " \u00b7 Beginner to Advanced</p>" +
                "<p>" + escapeHtml(c.overview) + "</p>";
        }

        html += "</div>";

        var actions = [];
        for (var j = 0; j < found.length; j++) {
            actions.push({
                label: COURSES[found[j]].short,
                ask: "Tell me about " + COURSES[found[j]].short
            });
        }
        actions.push({ label: "Enquiry", ask: "I want to enrol", primary: true });

        addBotMessage(html + chips(actions));
    }

    function viewCertificate() {
        addBotMessage(
            '<div class="ai-card">' +
            '<div class="ai-card__title">Certification</div>' +
            "<p>Every programme ends with an assessment and a completion certificate from " +
            "UNITED SOFT TECH, issued after you submit the capstone project.</p>" +
            "<p>The certificate is valued for fresher and junior roles, and the capstone " +
            "project forms the first item in your portfolio.</p>" +
            "</div>" + courseChips(false)
        );
    }

    function viewFees() {
        addBotMessage(
            '<div class="ai-card">' +
            '<div class="ai-card__title">Course fees</div>' +
            "<p>Fees depend on the level you join and the batch you select, and early enrolment " +
            "usually gets a concession.</p>" +
            "<p>Share an enquiry below and the team will send you the current fee structure " +
            "along with batch start dates.</p>" +
            "</div>" +
            chips([
                { label: "Enquire now", ask: "I want to enrol", primary: true },
                { label: "View courses", ask: "What are the courses available?" }
            ])
        );
    }

    function viewHelp() {
        addBotMessage(
            "<p>I can help you with any of the following \u2014 just type naturally:</p>" +
            '<div class="ai-card">' +
            '<ul class="ai-list">' +
            "<li>What are the courses available?</li>" +
            "<li>Tell me about Python</li>" +
            "<li>What is the duration?</li>" +
            "<li>Show Python syllabus</li>" +
            "<li>What tools are used?</li>" +
            "<li>What projects can I do?</li>" +
            "<li>Is there placement?</li>" +
            "<li>I want to enrol</li>" +
            "</ul></div>"
        );
    }

    function viewPhd() {
        addBotMessage(
            '<div class="ai-card">' +
            '<div class="ai-card__title">PhD Assistance</div>' +
            "<p>We support research scholars with topic finalisation, literature review, " +
            "methodology, data analysis and publication support.</p>" +
            "<p>Use the <strong>PhD Assistance</strong> section in the top navigation for " +
            "the full service details.</p>" +
            "</div>" +
            chips([
                { label: "Courses", ask: "What are the courses available?" },
                { label: "Enquire", ask: "I want to enrol", primary: true }
            ])
        );
    }

    function viewCamera() {
        addBotMessage(
            '<div class="ai-camera">' +
            '<div class="ai-camera__label">Camera Panel</div>' +
            '<div class="ai-camera__preview">\ud83d\udcf7</div>' +
            "<p class=\"ai-camera__hint\">Camera panel is available for your session.</p>" +
            "</div>" +
            chips([
                { label: "Courses", ask: "What are the courses available?" },
                { label: "Enquire", ask: "I want to enrol", primary: true }
            ])
        );
    }

    function viewCall() {
        addBotMessage(
            '<div class="ai-card">' +
            '<div class="ai-card__title">Speak to a counsellor</div>' +
            "<p>Our counsellors can walk you through the syllabus, batch timings and fee " +
            "structure with you directly.</p>" +
            "<p>Send an enquiry below and the team will call you back at your convenient time.</p>" +
            "</div>" +
            chips([
                { label: "Enquire now", ask: "I want to enrol", primary: true },
                { label: "View courses", ask: "What are the courses available?" }
            ])
        );
    }

    function viewVoice() {
        addBotMessage(
            '<div class="ai-card">' +
            '<div class="ai-card__title">Voice assistance</div>' +
            "<p>Voice input is displayed for this release. Please type your question below and " +
            "I will answer right away.</p>" +
            "</div>"
        );
    }

    function viewFallback() {
        addBotMessage(
            "<p>Sorry \ud83d\ude05 I did not quite catch that.</p>" +
            "<p>Here is what I can help you with right now:</p>" +
            chips([
                { label: "Courses", ask: "What are the courses available?" },
                { label: "Python", ask: "Tell me about Python" },
                { label: "Java", ask: "Tell me about Java" },
                { label: "Web Development", ask: "Tell me about Web Development" },
                { label: "AI & ML", ask: "Tell me about AI and ML" },
                { label: "Placement", ask: "Is there placement?" },
                { label: "Enquiry", ask: "I want to enrol", primary: true }
            ])
        );
    }

    function viewNeedCourse(topic) {
        addBotMessage(
            "<p>Which course would you like the <strong>" + escapeHtml(topic) +
            "</strong> for?</p>" +
            courseChips(false)
        );
    }


    /* =====================================================
       ENQUIRY
       ===================================================== */

    function viewEnquiry(text) {
        var key = resolveCourse(text);
        var preselect = key ? COURSES[key].name : "";

        var options = '<option value="">Select a course</option>';
        for (var i = 0; i < COURSE_ORDER.length; i++) {
            var name = COURSES[COURSE_ORDER[i]].name;
            options += '<option value="' + escapeHtml(name) + '"' +
                (name === preselect ? " selected" : "") + ">" + escapeHtml(name) + "</option>";
        }

        enquiryCount += 1;

        var html =
            '<div class="ai-card">' +
            '<div class="ai-card__title">Enquiry form' +
            (preselect ? " - " + escapeHtml(preselect) : "") + "</div>" +
            '<div class="ai-form" data-role="enquiry">' +
            '<div class="ai-form__field">' +
            '<label class="ai-form__label" for="aiEnqName' + enquiryCount + '">Name</label>' +
            '<input id="aiEnqName' + enquiryCount + '" type="text" class="ai-form__control" ' +
            'data-field="name" placeholder="Your full name" autocomplete="name" />' +
            "</div>" +
            '<div class="ai-form__field">' +
            '<label class="ai-form__label" for="aiEnqPhone' + enquiryCount + '">Phone Number</label>' +
            '<input id="aiEnqPhone' + enquiryCount + '" type="tel" class="ai-form__control" ' +
            'data-field="phone" placeholder="10 digit mobile number" autocomplete="tel" />' +
            "</div>" +
            '<div class="ai-form__field">' +
            '<label class="ai-form__label" for="aiEnqCourse' + enquiryCount + '">Course</label>' +
            '<select id="aiEnqCourse' + enquiryCount + '" class="ai-form__control" data-field="course">' +
            options +
            "</select>" +
            "</div>" +
            '<button type="button" class="ai-form__submit" data-role="enquiry-submit">' +
            "Submit Enquiry</button>" +
            '<p class="ai-form__note">Your details stay within UNITED SOFT TECH and are used ' +
            "only to contact you about this enquiry.</p>" +
            "</div></div>";

        addBotMessage(html);
    }

    function submitEnquiry(form) {
        if (!form || form.getAttribute("data-submitted") === "1") {
            return;
        }

        var nameField = form.querySelector('[data-field="name"]');
        var phoneField = form.querySelector('[data-field="phone"]');
        var courseField = form.querySelector('[data-field="course"]');

        var name = nameField ? nameField.value.trim() : "";
        var phone = phoneField ? phoneField.value.trim() : "";
        var course = courseField ? courseField.value.trim() : "";

        function complain(title, message) {
            addBotMessage(
                '<div class="ai-card">' +
                '<div class="ai-card__title">' + escapeHtml(title) + "</div>" +
                '<p class="ai-form__error">' + escapeHtml(message) + "</p>" +
                "</div>"
            );
        }

        if (name === "" || phone === "") {
            complain("Almost done", "Please enter both your name and phone number.");
            return;
        }

        var digits = phone.replace(/[^0-9]/g, "");

        if (digits.length < 10) {
            complain(
                "Check the phone number",
                "Please enter a valid 10 digit phone number so we can call you back."
            );
            return;
        }

        if (course === "") {
            complain("Select a course", "Please choose the course you are interested in.");
            return;
        }

        form.setAttribute("data-submitted", "1");

        form.innerHTML =
            '<p class="ai-form__error">Enquiry submitted</p>' +
            '<p class="ai-form__note">Thank you ' + escapeHtml(name) + ". We have recorded your " +
            "interest in <strong>" + escapeHtml(course) + "</strong> and a counsellor will " +
            "call you on " + escapeHtml(phone) + " shortly.</p>";

        addBotMessage(
            '<div class="ai-card">' +
            '<div class="ai-card__title">Thank you, ' + escapeHtml(name) + "</div>" +
            "<p>Your enquiry for <strong>" + escapeHtml(course) + "</strong> has been received.</p>" +
            "<p>Our team will contact you soon to confirm your batch and schedule.</p>" +
            "</div>" +
            chips([
                { label: "View syllabus", ask: "Tell me about " + course },
                { label: "Placement", ask: "Is there placement for " + course + "?" },
                { label: "Browse courses", ask: "What are the courses available?" }
            ])
        );
    }


    /* =====================================================
       INTENT PROCESSOR
       ===================================================== */

    function processMessage(rawText) {
        var text = rawText.toLowerCase().replace(/\s+/g, " ").trim();
        var key;
        var level;

        /* Greeting */
        if (/^(hi|hello|hey|hola|namaste|good (morning|afternoon|evening|night))\b/.test(text) ||
            /^(hi|hello|hey) (there|all)\b/.test(text)) {
            viewGreeting();
            return;
        }

        /* Thanks */
        if (/\b(thanks|thank you|thx|thank u)\b/.test(text)) {
            viewThanks();
            return;
        }

        /* Help */
        if (/\b(help|what can you do|how do you work|options)\b/.test(text)) {
            viewHelp();
            return;
        }

        /* PhD */
        if (/\b(phd|ph\.d|research|scholarship)\b/.test(text)) {
            viewPhd();
            return;
        }

        /* Camera */
        if (/\b(camera|scan|webcam|photo|screenshot)\b/.test(text)) {
            viewCamera();
            return;
        }

        /* Enquiry / enrol */
        if (/\b(enquir|enrol|enroll|admission|admit|register|registration|apply|join|signup|sign up|i want to start|book a seat|book my seat)\b/.test(text)) {
            viewEnquiry(text);
            return;
        }

        /* Comparison */
        if (/\b(compare|comparison|difference between|different from|better than| vs )\b/.test(text)) {
            viewCompare(text);
            return;
        }

        /* Certificate */
        if (/\b(certificate|certification|certified|completion)\b/.test(text)) {
            viewCertificate();
            return;
        }

        /* Fees */
        if (/\b(fee|fees|price|cost|affordable|payment|emi|installment)\b/.test(text)) {
            viewFees();
            return;
        }

        /* Course list */
        if (/\b(courses?|list of|available|programmes?|programs?|training)\b/.test(text) &&
            (/\b(available|list|offer|which|what|all)\b/.test(text) || text === "courses" || text === "course")) {
            viewCourseList();
            return;
        }

        key = resolveCourse(text);
        level = detectLevel(text);

        /* Level details */
        if (level && key) {
            viewLevel(key, level);
            return;
        }

        /* Duration */
        if (/\b(duration|how long|length|weeks|months|hours|timing|batch start|schedule)\b/.test(text)) {
            if (key) {
                viewDuration(key);
            } else {
                viewNeedCourse("duration");
            }
            return;
        }

        /* Syllabus */
        if (/\b(syllabus|syllabi|curriculum|topics|modules|agenda|outline|content)\b/.test(text)) {
            if (key) {
                viewSyllabus(key);
            } else {
                viewNeedCourse("syllabus");
            }
            return;
        }

        /* Tools */
        if (/\b(tool|tools|technolog|software|framework|platform|environment|stack|ide)\b/.test(text)) {
            if (key) {
                viewTools(key);
            } else {
                viewNeedCourse("tools and technologies");
            }
            return;
        }

        /* Projects */
        if (/\b(project|projects|portfolio|practical|assignment|lab work|capstone)\b/.test(text)) {
            if (key) {
                viewProjects(key);
            } else {
                viewNeedCourse("projects");
            }
            return;
        }

        /* Placement / careers */
        if (/\b(placement|placements|job|jobs|career|hiring|hire|salary|package|recruit|interview|company|companies|resume|cv)\b/.test(text)) {
            viewPlacement(key || null);
            return;
        }

        /* Fees inside a course context still wins above. */

        /* Levels overview without a specific level */
        if (/\b(levels?|beginner|intermediate|advanced)\b/.test(text) && key) {
            viewCourseOverview(key);
            return;
        }

        /* Course overview */
        if (key) {
            viewCourseOverview(key);
            return;
        }

        viewFallback();
    }


    /* =====================================================
       ACTIONS
       ===================================================== */

    function send(text) {
        var value = String(text === undefined ? "" : text).replace(/\s+/g, " ").trim();

        if (value === "" || !chatArea) {
            return;
        }

        addUserMessage(value);

        if (messageInput) {
            messageInput.value = "";
        }

        var typing = showTyping();

        window.setTimeout(function () {
            removeTyping(typing);
            processMessage(value);
        }, 420);
    }


    /* =====================================================
       INIT
       ===================================================== */

    function init() {
        chatArea = document.getElementById("aiChat");
        messageInput = document.getElementById("aiMessageInput");

        if (!chatArea) {
            return;
        }

        chatArea.addEventListener("click", function (event) {
            var target = event.target;
            var enquiryForm = null;

            while (target && target !== chatArea) {
                if (target.getAttribute && target.getAttribute("data-ask")) {
                    send(target.getAttribute("data-ask"));
                    return;
                }

                if (!enquiryForm && target.getAttribute &&
                    target.getAttribute("data-role") === "enquiry") {
                    enquiryForm = target;
                }

                if (target.getAttribute && target.getAttribute("data-role") === "enquiry-submit") {
                    event.preventDefault();
                    submitEnquiry(enquiryForm);
                    return;
                }

                target = target.parentNode;
            }
        });

        if (messageInput) {
            messageInput.addEventListener("keydown", function (event) {
                if (event.key === "Enter" && !event.shiftKey) {
                    event.preventDefault();
                    send(messageInput.value);
                }
            });
        }

        scrollToBottom();
    }

    window.ustAssistantSend = send;
    window.ustAssistantCall = viewCall;
    window.ustAssistantVoice = viewVoice;

    if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", init);
    } else {
        init();
    }

})();