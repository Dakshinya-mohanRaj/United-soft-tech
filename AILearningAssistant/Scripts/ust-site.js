/* =========================================================
   UNITED SOFT TECH
   Site chrome behaviour
   ========================================================= */

(function () {
    "use strict";

    function initHeader() {

        var toggle = document.querySelector(".ust-navtoggle");
        var nav = document.getElementById("ustNav");

        if (!toggle || !nav) {
            return;
        }

        function close() {
            nav.classList.remove("is-open");
            toggle.setAttribute("aria-expanded", "false");
        }

        toggle.addEventListener("click", function () {
            var open = nav.classList.toggle("is-open");
            toggle.setAttribute("aria-expanded", open ? "true" : "false");
        });

        nav.addEventListener("click", function (event) {
            if (event.target && event.target.tagName === "A") {
                close();
            }
        });

        document.addEventListener("keydown", function (event) {
            if (event.key === "Escape") {
                close();
            }
        });

        window.addEventListener("resize", function () {
            if (window.innerWidth > 991) {
                close();
            }
        });
    }

    function initInputFocus() {

        var box = document.querySelector(".ai-input__box");
        var field = document.getElementById("aiMessageInput");

        if (!box || !field) {
            return;
        }

        field.addEventListener("focus", function () {
            box.classList.add("is-focused");
        });

        field.addEventListener("blur", function () {
            box.classList.remove("is-focused");
        });
    }

    if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", function () {
            initHeader();
            initInputFocus();
        });
    } else {
        initHeader();
        initInputFocus();
    }

})();