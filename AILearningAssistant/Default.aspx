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
        transform: scale(1.05);
    }

    .enquiry-header-btn {
        height: 42px;
        padding: 0 18px;
        border: none;
        border-radius: 12px;
        background: #667eea;
        color: #ffffff;
        font-size: 14px;
        font-weight: 700;
        cursor: pointer;
        transition: all 0.2s ease;
        font-family: inherit;
    }

    .enquiry-header-btn:hover {
        opacity: 0.95;
        transform: scale(1.02);
    }

    /* =========================
       ENQUIRY POPUP
       ========================= */

    .enquiry-popup-overlay {
        position: fixed;
        inset: 0;
        background: rgba(0, 0, 0, 0.5);
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 10000;
        padding: 16px;
    }

    .enquiry-popup {
        width: 100%;
        max-width: 420px;
        background: #ffffff;
        border-radius: 16px;
        box-shadow: 0 16px 45px rgba(31, 41, 55, 0.25);
        max-height: 90vh;
        display: flex;
        flex-direction: column;
        overflow: hidden;
    }

    .enquiry-popup-header {
        height: 56px;
        padding: 0 16px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        background: #667eea;
        border-bottom: 1px solid #5a6fd8;
    }

    .enquiry-popup-title {
        color: #ffffff;
        font-size: 16px;
        font-weight: 700;
    }

    .enquiry-popup-close {
        background: transparent;
        border: none;
        color: #ffffff;
        font-size: 28px;
        line-height: 1;
        cursor: pointer;
        padding: 0 8px;
    }

    .enquiry-popup-body {
        padding: 16px;
        overflow-y: auto;
        flex: 1;
    }

    .enquiry-popup-body::-webkit-scrollbar {
        width: 6px;
    }

    .enquiry-popup-body::-webkit-scrollbar-track {
        background: transparent;
    }

    .enquiry-popup-body::-webkit-scrollbar-thumb {
        background: #d7dbe5;
        border-radius: 10px;
    }

    .enquiry-form {
        display: flex;
        flex-direction: column;
        gap: 12px;
    }

    .enquiry-field {
        display: flex;
        flex-direction: column;
        gap: 6px;
    }

    .enquiry-label {
        color: #172033;
        font-size: 13px;
        font-weight: 600;
    }

    .enquiry-input,
    .enquiry-select,
    .enquiry-textarea {
        padding: 10px 12px;
        border: 1px solid #dfe3ea;
        border-radius: 10px;
        font-size: 13px;
        font-family: inherit;
        background: #ffffff;
        color: #374151;
        width: 100%;
    }

    .enquiry-input:focus,
    .enquiry-select:focus,
    .enquiry-textarea:focus {
        outline: none;
        border-color: #667eea;
    }

    .enquiry-textarea {
        resize: vertical;
        min-height: 80px;
    }

    .enquiry-error {
        color: #dc2626;
        font-size: 11px;
        font-weight: 600;
    }

    .enquiry-success {
        color: #059669;
        font-size: 12px;
        font-weight: 600;
        text-align: center;
        padding: 8px;
    }

    .enquiry-send-btn {
        width: 100%;
        padding: 11px 16px;
        border: none;
        border-radius: 12px;
        background: linear-gradient(135deg, #667eea, #764ba2);
        color: #ffffff;
        font-size: 14px;
        font-weight: 700;
        cursor: pointer;
        transition: all 0.2s ease;
        margin-top: 4px;
    }

    .enquiry-send-btn:hover {
        opacity: 0.95;
    }

    /* =========================
       ENROLLMENT POPUP
       ========================= */

    .enroll-popup-overlay {
        position: fixed;
        inset: 0;
        background: rgba(0, 0, 0, 0.5);
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 10000;
        padding: 16px;
    }

    .enroll-popup {
        width: 100%;
        max-width: 460px;
        background: #ffffff;
        border-radius: 16px;
        box-shadow: 0 16px 45px rgba(31, 41, 55, 0.25);
        max-height: 92vh;
        display: flex;
        flex-direction: column;
        overflow: hidden;
    }

    .enroll-popup-header {
        height: 56px;
        padding: 0 16px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        background: #667eea;
        border-bottom: 1px solid #5a6fd8;
        flex-shrink: 0;
    }

    .enroll-popup-title {
        color: #ffffff;
        font-size: 16px;
        font-weight: 700;
    }

    .enroll-popup-close {
        background: transparent;
        border: none;
        color: #ffffff;
        font-size: 28px;
        line-height: 1;
        cursor: pointer;
        padding: 0 8px;
    }

    .enroll-progress {
        display: flex;
        align-items: center;
        gap: 6px;
        padding: 12px 16px;
        background: #f7f9ff;
        border-bottom: 1px solid #edf0f8;
        flex-shrink: 0;
    }

    .enroll-progress-item {
        flex: 1;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 4px;
        text-align: center;
    }

    .enroll-progress-dot {
        width: 24px;
        height: 24px;
        border-radius: 50%;
        background: #e2e7f2;
        color: #8a94a6;
        font-size: 11px;
        font-weight: 700;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .enroll-progress-label {
        font-size: 9.5px;
        font-weight: 600;
        color: #8a94a6;
        line-height: 1.2;
    }

    .enroll-progress-item.done .enroll-progress-dot {
        background: #35b86f;
        color: #ffffff;
    }

    .enroll-progress-item.active .enroll-progress-dot {
        background: #667eea;
        color: #ffffff;
        box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.2);
    }

    .enroll-progress-item.active .enroll-progress-label {
        color: #667eea;
    }

    .enroll-popup-body {
        padding: 16px;
        overflow-y: auto;
        overflow-x: hidden;
        flex: 1;
    }

    .enroll-popup-body::-webkit-scrollbar {
        width: 6px;
    }

    .enroll-popup-body::-webkit-scrollbar-track {
        background: transparent;
    }

    .enroll-popup-body::-webkit-scrollbar-thumb {
        background: #d7dbe5;
        border-radius: 10px;
    }

    .enroll-section-title {
        font-size: 15px;
        font-weight: 700;
        color: #172033;
        margin-bottom: 12px;
    }

    .enroll-summary-card {
        background: #f7f9ff;
        border: 1px solid #e6ebf7;
        border-radius: 12px;
        padding: 14px;
        margin-bottom: 14px;
    }

    .enroll-summary-row {
        display: flex;
        justify-content: space-between;
        gap: 12px;
        font-size: 13px;
        padding: 5px 0;
    }

    .enroll-summary-row .enroll-summary-key {
        color: #8a94a6;
        font-weight: 600;
        flex-shrink: 0;
    }

    .enroll-summary-row .enroll-summary-value {
        color: #364152;
        font-weight: 700;
        text-align: right;
        overflow-wrap: anywhere;
    }

    .enroll-field {
        display: flex;
        flex-direction: column;
        gap: 6px;
        margin-bottom: 12px;
    }

    .enroll-label {
        color: #172033;
        font-size: 13px;
        font-weight: 600;
    }

    .enroll-input,
    .enroll-select,
    .enroll-textarea {
        padding: 10px 12px;
        border: 1px solid #dfe3ea;
        border-radius: 10px;
        font-size: 13px;
        font-family: inherit;
        background: #ffffff;
        color: #374151;
        width: 100%;
    }

    .enroll-input:focus,
    .enroll-select:focus,
    .enroll-textarea:focus {
        outline: none;
        border-color: #667eea;
    }

    .enroll-textarea {
        resize: vertical;
        min-height: 70px;
    }

    .enroll-error {
        color: #dc2626;
        font-size: 11px;
        font-weight: 600;
    }

    .enroll-actions {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        margin-top: 6px;
    }

    .enroll-btn {
        flex: 1 1 120px;
        padding: 11px 16px;
        border-radius: 12px;
        font-size: 13px;
        font-weight: 700;
        cursor: pointer;
        transition: all 0.2s ease;
        font-family: inherit;
    }

    .enroll-btn-primary {
        border: 1px solid transparent;
        background: linear-gradient(135deg, #667eea, #764ba2);
        color: #ffffff;
    }

    .enroll-btn-secondary {
        border: 1px solid #dbe2ea;
        background: #ffffff;
        color: #53657d;
    }

    .enroll-btn:disabled {
        opacity: 0.6;
        cursor: not-allowed;
    }

    .enroll-payment-options {
        display: flex;
        flex-direction: column;
        gap: 8px;
        margin-bottom: 14px;
    }

    .enroll-payment-option {
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 11px 12px;
        border: 1px solid #dfe3ea;
        border-radius: 10px;
        font-size: 13px;
        font-weight: 600;
        color: #374151;
        cursor: pointer;
        transition: all 0.2s ease;
    }

    .enroll-payment-option.selected {
        border-color: #667eea;
        background: #f2f4ff;
        color: #172033;
    }

    .enroll-payment-option input {
        accent-color: #667eea;
    }

    .enroll-note {
        background: #fff8e6;
        border: 1px solid #f3e2b3;
        border-radius: 10px;
        padding: 10px 12px;
        color: #8a6d1a;
        font-size: 12px;
        line-height: 1.5;
        margin-bottom: 14px;
    }

    .enroll-processing {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 14px;
        padding: 30px 10px;
    }

    .enroll-spinner {
        width: 40px;
        height: 40px;
        border: 4px solid #e2e7f2;
        border-top-color: #667eea;
        border-radius: 50%;
        animation: enrollSpin 0.8s linear infinite;
    }

    @keyframes enrollSpin {
        to {
            transform: rotate(360deg);
        }
    }

    .enroll-result {
        text-align: center;
        padding: 8px 0;
    }

    .enroll-result-icon {
        width: 58px;
        height: 58px;
        margin: 0 auto 14px;
        border-radius: 50%;
        background: #e7f7ee;
        color: #35b86f;
        font-size: 30px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .enroll-result-title {
        font-size: 18px;
        font-weight: 700;
        color: #172033;
        margin-bottom: 8px;
    }

    .enroll-badge {
        display: inline-block;
        padding: 4px 12px;
        border-radius: 20px;
        background: #fdecec;
        color: #c0392b;
        font-size: 11px;
        font-weight: 700;
        margin-bottom: 16px;
    }

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

    /* =========================
       SELECTED BUTTON STATE
       ========================= */

    .available-domain-button.selected,
    .domain-button.selected,
    .level-button.selected,
    .it-course-button.selected,
    .it-back-button.selected {
        background: linear-gradient(135deg, #667eea, #764ba2);
        border-color: transparent;
        color: #ffffff;
        cursor: default;
        box-shadow: 0 6px 16px rgba(102, 126, 234, 0.22);
    }

    .available-domain-button.selected:hover,
    .domain-button.selected:hover,
    .level-button.selected:hover,
    .it-course-button.selected:hover,
    .it-back-button.selected:hover {
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

    .enroll-now-button {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 100%;
        padding: 10px 16px;
        border-radius: 12px;
        border: 1px solid transparent;
        background: linear-gradient(135deg, #667eea, #764ba2);
        color: #ffffff;
        font-size: 13px;
        font-weight: 700;
        cursor: pointer;
        transition: all 0.2s ease;
    }

    .detail-actions-primary {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        width: 100%;
    }

    .detail-actions-primary .course-details-button,
    .detail-actions-primary .enroll-now-button {
        flex: 1 1 160px;
        width: auto;
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
       LEVEL SELECTION
       ========================= */

    .level-panel {
        max-width: 520px;
        margin: 18px auto;
        padding: 22px;
        background: #ffffff;
        border: 1px solid #e4e7ee;
        border-radius: 16px;
        text-align: center;
    }

    .level-panel-title {
        font-size: 15px;
        font-weight: 700;
        color: #172033;
        margin-bottom: 16px;
    }

    .level-buttons {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 10px;
    }

    .level-button {
        padding: 11px 22px;
        background: #ffffff;
        border: 1px solid #dfe3ea;
        border-radius: 13px;
        color: #4b5563;
        font-size: 13px;
        font-weight: 700;
        cursor: pointer;
        transition: all 0.2s ease;
    }

    /* =========================
       IT COURSE LIST
       ========================= */

    .it-course-list {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
    }

    .it-course-button {
        max-width: 100%;
        padding: 11px 18px;
        background: #ffffff;
        border: 1px solid #dfe3ea;
        border-radius: 13px;
        color: #4b5563;
        font-size: 13px;
        font-weight: 700;
        line-height: 1.35;
        text-align: left;
        white-space: normal;
        overflow-wrap: anywhere;
        cursor: pointer;
        transition: all 0.2s ease;
    }

    /* =========================
       COURSE DETAILS
       ========================= */

    .course-detail-box {
        max-width: 620px;
        margin-top: 18px;
        padding: 18px;
        background: #ffffff;
        border: 1px solid #e4e7ee;
        border-radius: 15px;
    }

    .course-detail-title {
        font-size: 16px;
        font-weight: 700;
        color: #172033;
        margin-bottom: 12px;
    }

    .course-detail-list {
        margin: 0 0 16px;
        padding: 0;
        list-style: none;
    }

    .course-detail-list li {
        font-size: 13.5px;
        line-height: 1.55;
        color: #53657d;
        margin-bottom: 6px;
    }

    .course-detail-list li strong {
        color: #364152;
    }

    .it-back-button {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 10px 16px;
        background: #ffffff;
        border: 1px solid #dbe2ea;
        border-radius: 12px;
        color: #53657d;
        font-size: 13px;
        font-weight: 700;
        cursor: pointer;
        transition: all 0.2s ease;
    }

    .detail-actions {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        margin-top: 14px;
    }

    /* =========================
       GLOBAL BUTTON INTERACTION
       INNER BACKGROUND GLOW
       ========================= */

    .available-domain-button,
    .domain-button,
    .level-button,
    .it-course-button,
    .it-back-button,
    .course-details-button,
    .enroll-now-button,
    .call-button {
        position: relative;
        z-index: 0;
        overflow: hidden;
    }

    .available-domain-button::before,
    .domain-button::before,
    .level-button::before,
    .it-course-button::before,
    .it-back-button::before,
    .course-details-button::before,
    .enroll-now-button::before,
    .call-button::before {
        content: "";
        position: absolute;
        inset: 0;
        z-index: -1;
        opacity: 0;
        pointer-events: none;
        background: radial-gradient(
            circle at 50% 50%,
            rgba(102, 126, 234, 0.38),
            rgba(102, 126, 234, 0) 70%
        );
        transition: opacity 0.25s ease;
    }

    .available-domain-button:hover::before,
    .domain-button:hover::before,
    .level-button:hover::before,
    .it-course-button:hover::before,
    .it-back-button:hover::before,
    .course-details-button:hover::before,
    .enroll-now-button:hover::before,
    .call-button:hover::before {
        animation: buttonGlow 1.6s ease-in-out infinite;
    }

    .available-domain-button.selected:hover::before,
    .domain-button.selected:hover::before,
    .level-button.selected:hover::before,
    .it-course-button.selected:hover::before,
    .it-back-button.selected:hover::before {
        animation: none;
    }

    @keyframes buttonGlow {

        0% {
            opacity: 0;
        }

        50% {
            opacity: 1;
        }

        100% {
            opacity: 0;
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

        .enquiry-popup {
            max-width: 100%;
            max-height: 95vh;
        }

        .enroll-popup {
            max-width: 100%;
            max-height: 96vh;
        }

        .enroll-progress-label {
            font-size: 8.5px;
        }

        .enroll-actions {
            flex-direction: column;
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


                <div style="display: flex; align-items: center; gap: 10px;">
                    <button type="button"
                            id="enquiryBtn"
                            class="enquiry-header-btn"
                            onclick="openEnquiryPopup(event); return false;"
                            title="Enquiry">
                        Enquiry
                    </button>

                    <button type="button"
                            class="call-button"
                            onclick="makeCall()"
                            title="Voice Assistance">

                        ☎

                    </button>
                </div>

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

    <!-- ENQUIRY POPUP -->
    <div id="enquiryPopup" class="enquiry-popup-overlay" style="display:none;">
        <div class="enquiry-popup">
            <div class="enquiry-popup-header">
                <div class="enquiry-popup-title">Enquiry</div>
                <button type="button" class="enquiry-popup-close" onclick="closeEnquiryPopup()" title="Close">×</button>
            </div>
            <div class="enquiry-popup-body">
                <div class="enquiry-form">
                    <div class="enquiry-field">
                        <label class="enquiry-label">Your Name</label>
                        <input type="text" id="enqName" class="enquiry-input" placeholder="Enter your name" />
                        <div class="enquiry-error" id="enqNameError"></div>
                    </div>

                    <div class="enquiry-field">
                        <label class="enquiry-label">Email Address</label>
                        <input type="email" id="enqEmail" class="enquiry-input" placeholder="Enter your email" />
                        <div class="enquiry-error" id="enqEmailError"></div>
                    </div>

                    <div class="enquiry-field">
                        <label class="enquiry-label">Phone Number</label>
                        <input type="tel" id="enqPhone" class="enquiry-input" placeholder="Enter your phone number" />
                        <div class="enquiry-error" id="enqPhoneError"></div>
                    </div>

                    <div class="enquiry-field">
                        <label class="enquiry-label">Select Category</label>
                        <select id="enqCategory" class="enquiry-select">
                            <option value="">-- Select Category --</option>
                            <option value="Courses and Training">Courses and Training</option>
                            <option value="PhD">PhD</option>
                            <option value="College Project">College Project</option>
                            <option value="Journal">Journal</option>
                            <option value="Products and Kits">Products and Kits</option>
                            <option value="Others">Others</option>
                        </select>
                        <div class="enquiry-error" id="enqCategoryError"></div>
                    </div>

                    <div class="enquiry-field">
                        <label class="enquiry-label">Tell Your Enquiry Message</label>
                        <textarea id="enqMessage" class="enquiry-textarea" placeholder="Enter your enquiry message here..." rows="4"></textarea>
                        <div class="enquiry-error" id="enqMessageError"></div>
                    </div>

                    <button type="button" class="enquiry-send-btn" onclick="submitEnquiryForm()">Send Enquiry</button>
                    <div class="enquiry-success" id="enqSuccessMsg" style="display:none;"></div>
                </div>
            </div>
        </div>
    </div>

    <!-- ENROLLMENT POPUP -->
    <div id="enrollmentPopup" class="enroll-popup-overlay" style="display:none;">
        <div class="enroll-popup">
            <div class="enroll-popup-header">
                <div class="enroll-popup-title">Enroll in Your Future</div>
                <button type="button" class="enroll-popup-close" onclick="closeEnrollmentPopup()" title="Close">&times;</button>
            </div>
            <div class="enroll-progress" id="enrollProgress"></div>
            <div class="enroll-popup-body" id="enrollBody"></div>
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
       LAST RENDERED NAVIGATION TARGETS
       ========================================== */

    var lastLevelPanel = null;
    var lastCourseContainer = null;


    /* ==========================================
       COURSE DATA (DOMAIN -> LEVEL -> COURSES)
       ========================================== */

    var LEVELS = ["Beginner", "Moderate", "Advanced"];

    var courseData = {

        "IT": {

            "Beginner": [

                {
                    name: "Cyber Security with Ethical Hacking",
                    domain: "IT",
                    level: "Beginner",
                    duration: "2 Months",
                    description:
                        "An introductory cybersecurity course that gives learners basic awareness of threats, safe computing, network fundamentals and an introduction to ethical hacking concepts.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=cyber-security-Beginner&category=it"
                },

                {
                    name: "C++ Programming",
                    domain: "IT",
                    level: "Beginner",
                    duration: "1 Month",
                    description:
                        "Introductory C++ course covering program structure, basic syntax, primitive types, control flow, simple functions and standard strings to start building object-oriented skills.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=cpp-programming-beginner&category=it"
                },

                {
                    name: "Java Programming",
                    domain: "IT",
                    level: "Beginner",
                    duration: "1 Month",
                    description:
                        "Beginner Java course introducing syntax, basic object-oriented ideas, arrays, methods and simple console applications to start real-world Java development.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=java-Programming-Beginner&category=it"
                },

                {
                    name: "C Programming",
                    domain: "IT",
                    level: "Beginner",
                    duration: "1 Month",
                    description:
                        "A practical introduction to C covering program structure, data types, control flow, functions, arrays and basic input/output so learners can write working command-line programs.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=c-programming-Beginner&category=it"
                },

                {
                    name: "Python Programming",
                    domain: "IT",
                    level: "Beginner",
                    duration: "2 Months",
                    description:
                        "A beginner-friendly Python course teaching syntax, basic data types, lists, dictionaries and simple file operations to build small command-line applications.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=python-programming-Beginner&category=it"
                }

            ],

            "Moderate": [

                {
                    name: "Cyber Security with Ethical Hacking",
                    domain: "IT",
                    level: "Intermediate",
                    duration: "3 Months",
                    description:
                        "A hands-on intermediate ethical hacking course covering footprinting, scanning, phishing, network analysis and web server basics for real-world security testing.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=cyber-security-Intermediate&category=it"
                },

                {
                    name: "C++ Programming",
                    domain: "IT",
                    level: "Intermediate",
                    duration: "2 Months",
                    description:
                        "A focused C++ intermediate course that teaches object-oriented programming, templates, the Standard Template Library and file & exception handling for robust applications.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=cpp-programming-Intermediate&category=it"
                },

                {
                    name: "Java Programming",
                    domain: "IT",
                    level: "Intermediate",
                    duration: "2 Months",
                    description:
                        "Intermediate Java prepares learners to build modular, object-oriented applications using collections, file I/O, exceptions and basic data structures.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=Java%20Programming-Intermediate&category=it"
                },

                {
                    name: "C Programming",
                    domain: "IT",
                    level: "Intermediate",
                    duration: "1.5 Months",
                    description:
                        "Intermediate C course focused on pointers, dynamic memory allocation, modular programming and core data-structure implementations to build more capable and efficient console applications.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=c-programming-Intermediate&category=it"
                },

                {
                    name: "Python Programming",
                    domain: "IT",
                    level: "Intermediate",
                    duration: "2 Months",
                    description:
                        "Intermediate Python covers OOP, modules, generators, decorators, file & binary handling, and testing to build maintainable Python packages and utilities.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=Python%20Programming%20-%20Intermediate&category=it"
                },

                {
                    name: "PHP",
                    domain: "IT",
                    level: "Intermediate",
                    duration: "2 Months",
                    description:
                        "Intermediate PHP course focusing on core PHP programming, form handling, file management, sessions, and database connectivity.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=php-intermediate&category=it"
                }

            ],

            "Advanced": [

                {
                    name: "Full Stack Web Development",
                    domain: "IT",
                    level: "Advanced",
                    duration: "6 Months",
                    description:
                        "Advanced full-stack web development program covering frontend, backend, databases, asynchronous JavaScript, Django frameworks, API integration and deployment.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=web-development-advanced&category=it"
                },

                {
                    name: "Android Application Development",
                    domain: "IT",
                    level: "Advanced",
                    duration: "4 Months",
                    description:
                        "Advanced Android development course covering application components, UI design, threading, data storage, device features and real-time applications.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=android-advanced&category=it"
                },

                {
                    name: "Diploma in Computer Application",
                    domain: "IT",
                    level: "Advanced",
                    duration: "3 Months",
                    description:
                        "An end-to-end DCA program that covers computer fundamentals, MS Office suite, internet productivity, digital safety and introductory programming to make students workplace-ready.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=Diploma%20in%20Computer%20Application%20-Advanced&category=it"
                },

                {
                    name: "Artificial Intelligence with Machine Learning",
                    domain: "IT",
                    level: "Advanced",
                    duration: "6 Months",
                    description:
                        "A focused advanced AI & ML program teaching classical AI algorithms, machine learning pipelines, deep learning, and deployment-ready systems.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=Artificial%20Intelligence%20with%20Machine%20Learning%20-%20Advanced&category=it"
                },

                {
                    name: "C++ Programming",
                    domain: "IT",
                    level: "Advanced",
                    duration: "3 Months",
                    description:
                        "An industry-ready advanced C++ program covering modern C++ features, templates, concurrency, networking, tooling, and high-performance system design.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=cpp-programming-Advanced&category=it"
                },

                {
                    name: "Java Programming",
                    domain: "IT",
                    level: "Advanced",
                    duration: "3 Months",
                    description:
                        "Comprehensive advanced Java program covering JVM internals, concurrency, streams, performance, testing and production practices for building scalable Java applications.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=Java%20Programming-Advanced&category=it"
                },

                {
                    name: "C Programming",
                    domain: "IT",
                    level: "Advanced",
                    duration: "2.5 Months",
                    description:
                        "An advanced systems-level C course that covers memory optimization, toolchains, build automation, advanced debugging, and systems programming practices for production-quality C software.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=c-programming-Advanced&category=it"
                },

                {
                    name: "Python Programming",
                    domain: "IT",
                    level: "Advanced",
                    duration: "4 Months",
                    description:
                        "An advanced, production-oriented Python program covering concurrency, data engineering basics, web & GUI, testing, packaging and deployment for real projects.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=python-programming-Advanced&category=it"
                },

                {
                    name: "PHP",
                    domain: "IT",
                    level: "Advanced",
                    duration: "3 Months",
                    description:
                        "Advanced PHP course covering OOP, exception handling, advanced database operations, AJAX, and MVC concepts.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=php-advanced&category=it"
                },

                {
                    name: "Power BI",
                    domain: "IT",
                    level: "Advanced",
                    duration: "2.5 Months",
                    description:
                        "A production-ready Power BI program covering ETL, data modelling, DAX, advanced visualization, Power BI service and real-world dashboard deployment.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=Power%20BI-Advanced&category=it"
                },

                {
                    name: "J2EE",
                    domain: "IT",
                    level: "Advanced",
                    duration: "4 Months",
                    description:
                        "Advanced J2EE course covering Servlets, JSP, JDBC, MVC architecture, EJB, Web Services and enterprise Java technologies.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=j2ee-advanced&category=it"
                },

                {
                    name: "DOTNET",
                    domain: "IT",
                    level: "Advanced",
                    duration: "3 Months",
                    description:
                        "Advanced .NET course covering C#, Windows applications, ASP.NET web applications, ADO.NET, web services and enterprise development.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=dotnet-advanced&category=it"
                }

            ]

        },

        "IT Infrastructure": {

            "Beginner": [],

            "Moderate": [],

            "Advanced": [

                {
                    name: "Adobe Photoshop",
                    domain: "IT Infrastructure",
                    level: "Advanced",
                    duration: "3 Months",
                    description:
                        "Advanced Adobe Photoshop course focused on professional image editing, creative design, photo retouching, and real-world visual projects.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=adobe-photoshop&category=it-infrastructure"
                },

                {
                    name: "RHCE \u2013 Red Hat Certified Engineer",
                    domain: "IT Infrastructure",
                    level: "Advanced",
                    duration: "4 Months",
                    description:
                        "Advanced Linux system administration course based on Red Hat technologies, focusing on server management, security, automation, and enterprise deployment.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=rhce&category=it-infrastructure"
                },

                {
                    name: "NS-2 \u2013 Network Security",
                    domain: "IT Infrastructure",
                    level: "Advanced",
                    duration: "3 Months",
                    description:
                        "Advanced network security course covering cyber threats, firewall technologies, secure communication, and enterprise security practices.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=ns2-network-security&category=it-infrastructure"
                },

                {
                    name: "MCSE \u2013 Microsoft Certified System Engineer",
                    domain: "IT Infrastructure",
                    level: "Advanced",
                    duration: "4 Months",
                    description:
                        "Advanced Windows Server administration course covering Active Directory, networking services, security, virtualization, and enterprise server management.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=mcse&category=it-infrastructure"
                },

                {
                    name: "Hardware & Networking",
                    domain: "IT Infrastructure",
                    level: "Advanced",
                    duration: "4 Months",
                    description:
                        "Comprehensive hardware and networking course covering computer assembly, operating systems, networking fundamentals, security, and real-world troubleshooting.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=hardware-networking&category=it-infrastructure"
                }

            ]

        },

        "Circuit": {

            "Beginner": [

                {
                    name: "Embedded Systems",
                    domain: "CIRCUIT",
                    level: "Beginner",
                    duration: "3 Months",
                    description:
                        "Embedded systems course covering microcontrollers, embedded C programming, and hardware interfacing.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=embedded-systems&category=circuit"
                },

                {
                    name: "PCB Workshop \u2013 Real Time Techniques",
                    domain: "CIRCUIT",
                    level: "Beginner",
                    duration: "1 Month",
                    description:
                        "Hands-on PCB workshop covering real-time PCB design, etching, schematic and layout techniques.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=pcb-workshop&category=circuit"
                }

            ],

            "Moderate": [

                {
                    name: "PCB & Circuit Design",
                    domain: "CIRCUIT",
                    level: "Intermediate",
                    duration: "3 Months",
                    description:
                        "Intermediate PCB and circuit design course focusing on circuit understanding, schematic design, basic PCB layout and simulation.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=pcb-circuit-design-intermediate&category=circuit"
                }

            ],

            "Advanced": [

                {
                    name: "PCB & Circuit Design",
                    domain: "CIRCUIT",
                    level: "Advanced",
                    duration: "3 Months",
                    description:
                        "Professional PCB and circuit design course covering schematic creation, PCB layout, simulation, and industry tools.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=pcb-circuit-design&category=circuit"
                },

                {
                    name: "PLC & SCADA",
                    domain: "CIRCUIT",
                    level: "Advanced",
                    duration: "3 Months",
                    description:
                        "Industrial automation course covering PLC programming, SCADA systems, and real-time control.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=plc-scada&category=circuit"
                },

                {
                    name: "LabVIEW",
                    domain: "CIRCUIT",
                    level: "Advanced",
                    duration: "3 Months",
                    description:
                        "LabVIEW programming course focusing on graphical programming, DAQ systems, and hardware interfacing.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=labview&category=circuit"
                },

                {
                    name: "Embedded Systems",
                    domain: "CIRCUIT",
                    level: "Advanced",
                    duration: "6 Months",
                    description:
                        "Advanced embedded systems program focusing on embedded C, protocols, RTOS, and real-time Linux.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=advanced-embedded-systems&category=circuit"
                },

                {
                    name: "VLSI Design",
                    domain: "CIRCUIT",
                    level: "Advanced",
                    duration: "3 Months",
                    description:
                        "VLSI design course covering MOS devices, digital systems, and logic design.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=vlsi-design&category=circuit"
                },

                {
                    name: "MATLAB",
                    domain: "CIRCUIT",
                    level: "Advanced",
                    duration: "4 Months",
                    description:
                        "Comprehensive MATLAB course covering programming, simulation, signal processing, image processing and Simulink."
                }

            ]

        },

        "Mechanical": {

            "Beginner": [

                {
                    name: "ANSYS",
                    domain: "MECHANICAL",
                    level: "Beginner",
                    duration: "2 Months",
                    description:
                        "Beginner-level ANSYS course covering fundamentals of structural, thermal and CFD analysis using APDL and Workbench.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=ansys-basics&category=mechanical"
                },

                {
                    name: "SOLIDWORKS",
                    domain: "MECHANICAL",
                    level: "Beginner",
                    duration: "2 Months",
                    description:
                        "Beginner SOLIDWORKS course covering sketching, basic part modeling, assemblies, sheet metal and drafting.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=solidworks-basic&category=mechanical"
                }

            ],

            "Moderate": [

                {
                    name: "SOLIDWORKS",
                    domain: "MECHANICAL",
                    level: "Intermediate",
                    duration: "3 Months",
                    description:
                        "Intermediate SOLIDWORKS course covering solid modeling, assemblies, surface modeling, sheet metal, drafting and basic simulation.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=solidworks-intermediate&category=mechanical"
                }

            ],

            "Advanced": [

                {
                    name: "ANSYS",
                    domain: "MECHANICAL",
                    level: "Advanced",
                    duration: "3 Months",
                    description:
                        "Advanced ANSYS course covering structural, thermal, CFD, dynamic analysis and Workbench with real-world engineering applications.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=ansys-advanced&category=mechanical"
                },

                {
                    name: "CATIA",
                    domain: "MECHANICAL",
                    level: "Advanced",
                    duration: "4 Months",
                    description:
                        "Advanced CATIA course covering complex part modeling, assemblies, surface design, sheet metal and industrial applications.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=catia-advanced&category=mechanical"
                },

                {
                    name: "CREO Parametric",
                    domain: "MECHANICAL",
                    level: "Advanced",
                    duration: "4 Months",
                    description:
                        "Advanced CREO Parametric course covering complex part modeling, surface design, sheet metal, assemblies, mechanisms and drafting.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=creo-parametric-advanced&category=mechanical"
                },

                {
                    name: "NX CAD",
                    domain: "MECHANICAL",
                    level: "Advanced",
                    duration: "3 Months",
                    description:
                        "Advanced NX CAD course covering parametric modeling, synchronous modeling, surface design, sheet metal, assemblies and drafting.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=nx-cad-advanced&category=mechanical"
                },

                {
                    name: "SOLIDWORKS",
                    domain: "MECHANICAL",
                    level: "Advanced",
                    duration: "4 Months",
                    description:
                        "Advanced SOLIDWORKS course covering complex part modeling, surface modeling, assemblies, simulation and CAM basics."
                }

            ]

        },

        "Civil": {

            notice:
                "No courses available for this level in Civil. Please select Advanced to explore available courses.",

            "Beginner": [],

            "Moderate": [],

            "Advanced": [

                {
                    name: "SketchUp \u2013 3D Modeling & Rendering",
                    domain: "Civil",
                    level: "Advanced",
                    duration: "2 Months",
                    description:
                        "Professional SketchUp course covering 3D modeling, interior and architectural design, layouts, rendering, and V-Ray workflow.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=sketchup-design&category=civil"
                },

                {
                    name: "STAAD.Pro",
                    domain: "Civil",
                    level: "Advanced",
                    duration: "3 Months",
                    description:
                        "Professional STAAD.Pro course covering structural analysis and design of beams, trusses, buildings, tanks, and advanced load conditions.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=staad-pro&category=civil"
                },

                {
                    name: "Revit Architecture",
                    domain: "Civil",
                    level: "Advanced",
                    duration: "3 Months",
                    description:
                        "Professional Revit Architecture course covering BIM concepts, architectural modeling, documentation, massing, and site design.",
                    url:
                        "https://unitedsofttech.co.in/CourseDetails.aspx?id=revit-architecture&category=civil"
                },

                {
                    name: "AutoCAD Civil",
                    domain: "Civil",
                    level: "Advanced",
                    duration: "3 Months",
                    description:
                        "Professional AutoCAD Civil course covering 2D drafting, 3D modeling, layout preparation, rendering, and construction drawings."
                }

            ]

        }

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


            markSelected(button);


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
       MARK SELECTED BUTTON (SINGLE GROUP)
       ========================================== */

    function markSelected(button) {

        var parent = button.parentNode;

        if (parent) {

            var selectedButtons =
                parent.getElementsByClassName("selected");

            for (var i = selectedButtons.length - 1; i >= 0; i--) {

                selectedButtons[i].classList.remove("selected");

            }

        }

        button.classList.add("selected");

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
             * Selected domain stays highlighted
             */

            markSelected(button);


            /*
             * Add bot response
             */

            addBotMessage(

                "Great choice! 😊 Please select your learning level for <b>" +

                escapeHtml(domainName) +

                "</b>."

            );


            /*
             * Display level selection
             */

            showLevelPanel(domainName);

        };


        buttonsContainer.appendChild(button);

    }


    /* ==========================================
       SHOW LEVEL PANEL
       ========================================== */

    function showLevelPanel(domainName) {

        /*
         * Reuse an existing level panel for the same domain
         * so level options are never duplicated.
         */

        var existingPanel =
            chatContent.querySelector(
                ".level-panel[data-domain='" + domainName + "']"
            );

        if (existingPanel) {

            existingPanel.scrollIntoView({
                behavior: "smooth",
                block: "start"
            });

            return;

        }


        var panel = document.createElement("div");

        panel.className = "level-panel";

        panel.setAttribute("data-domain", domainName);


        var title = document.createElement("div");

        title.className = "level-panel-title";

        title.textContent = "Select Your Learning Level";

        panel.appendChild(title);


        var buttonRow = document.createElement("div");

        buttonRow.className = "level-buttons";


        for (var i = 0; i < LEVELS.length; i++) {

            createLevelButton(
                domainName,
                LEVELS[i],
                buttonRow
            );

        }


        panel.appendChild(buttonRow);

        chatContent.appendChild(panel);

        lastLevelPanel = panel;

        scrollToBottom();

    }


    /* ==========================================
       CREATE LEVEL BUTTON
       ========================================== */

    function createLevelButton(
        domainName,
        level,
        buttonRow
    ) {

        var button = document.createElement("button");

        button.type = "button";

        button.className = "level-button";

        button.textContent = level;


        button.onclick = function () {

            if (button.classList.contains("selected")) {
                return;
            }


            markSelected(button);


            addBotMessage(

                "Showing <b>" +

                escapeHtml(level) +

                "</b> courses in <b>" +

                escapeHtml(domainName) +

                "</b>."

            );


            showLevelCourses(domainName, level);

        };


        buttonRow.appendChild(button);

    }


    /* ==========================================
       SHOW COURSES FOR A LEVEL
       ========================================== */

    function showLevelCourses(domainName, level) {

        /*
         * Reuse an existing section for the same domain + level
         * so course lists are never duplicated.
         */

        var existingSection =
            findSection(domainName, level);

        if (existingSection) {

            existingSection.scrollIntoView({
                behavior: "smooth",
                block: "start"
            });

            return;

        }


        var domainCourses = courseData[domainName];


        /*
         * If the domain has no courses at all
         */

        if (!hasAnyCourse(domainCourses)) {

            showNotice(
                "Courses for " +
                domainName +
                " will be available soon.",
                domainName,
                level
            );

            return;

        }


        var courses = domainCourses[level];


        /*
         * If this level has no courses
         */

        if (!courses || courses.length === 0) {

            var noCourseMessage =
                domainCourses.notice ||
                ("No courses are currently available for " +
                    level +
                    " level in " +
                    domainName +
                    ".");

            showNotice(
                noCourseMessage,
                domainName,
                level
            );

            return;

        }


        var container = document.createElement("div");

        container.className = "course-container";

        container.setAttribute("data-domain", domainName);

        container.setAttribute("data-level", level);


        var heading = document.createElement("div");

        heading.className = "course-heading";

        heading.textContent =
            level + " Level \u2013 Available Courses";


        container.appendChild(heading);


        var list = document.createElement("div");

        list.className = "it-course-list";


        for (var i = 0; i < courses.length; i++) {

            createCourseButton(
                courses[i],
                domainName,
                level,
                list
            );

        }


        container.appendChild(list);

        chatContent.appendChild(container);

        lastCourseContainer = container;

        scrollToBottom();

    }


    /* ==========================================
       SHOW NOTICE
       ========================================== */

    function showNotice(message, domainName, level) {

        var notice = document.createElement("div");

        notice.className = "course-info";

        notice.textContent = message;

        if (domainName) {
            notice.setAttribute("data-domain", domainName);
        }

        if (level) {
            notice.setAttribute("data-level", level);
        }

        chatContent.appendChild(notice);

        scrollToBottom();

    }


    /* ==========================================
       FIND EXISTING SECTION
       ========================================== */

    function findSection(domainName, level) {

        var sections =
            chatContent.querySelectorAll(
                ".course-container, .course-info"
            );

        for (var i = 0; i < sections.length; i++) {

            if (
                sections[i].getAttribute("data-domain") === domainName &&
                sections[i].getAttribute("data-level") === level
            ) {

                return sections[i];

            }

        }

        return null;

    }


    /* ==========================================
       HAS ANY COURSE
       ========================================== */

    function hasAnyCourse(domainCourses) {

        if (!domainCourses) {
            return false;
        }


        for (var i = 0; i < LEVELS.length; i++) {

            var list = domainCourses[LEVELS[i]];

            if (list && list.length > 0) {
                return true;
            }

        }


        return false;

    }


    /* ==========================================
       CREATE COURSE BUTTON
       ========================================== */

    function createCourseButton(
        course,
        domainName,
        level,
        list
    ) {

        var button = document.createElement("button");

        button.type = "button";

        button.className = "it-course-button";

        button.textContent = course.name;


        button.onclick = function () {

            if (button.classList.contains("selected")) {
                return;
            }


            markSelected(button);


            showCourseDetails(
                course,
                domainName,
                level
            );

        };


        list.appendChild(button);

    }


    /* ==========================================
       SHOW COURSE DETAILS
       ========================================== */

    function showCourseDetails(course, domainName, level) {

        var detail = document.createElement("div");

        detail.className = "course-detail-box";


        /*
         * Only show the View Details link when a verified URL exists
         */

        var detailsLink = "";

        if (course.url) {

            detailsLink =

                "<a class='course-details-button' " +

                    "href='" +

                    course.url +

                    "' " +

                    "target='_blank' " +

                    "rel='noopener noreferrer'>" +

                    "View Details" +

                "</a>";

        }


        detail.innerHTML =

            "<div class='course-detail-title'>" +

                escapeHtml(course.name) +

            "</div>" +

            "<ul class='course-detail-list'>" +

                "<li><strong>Domain:</strong> " +

                    escapeHtml(course.domain) +

                "</li>" +

                "<li><strong>Duration:</strong> " +

                    escapeHtml(course.duration) +

                "</li>" +

                "<li><strong>Level:</strong> " +

                    escapeHtml(course.level) +

                "</li>" +

                "<li><strong>Description:</strong> " +

                    escapeHtml(course.description) +

                "</li>" +

            "</ul>" +

            "<div class='detail-actions'>" +

                "<div class='detail-actions-primary'>" +

                    detailsLink +

                    "<button type='button' class='enroll-now-button'>" +

                        "Enroll Now" +

                    "</button>" +

                "</div>" +

                "<button type='button' class='it-back-button'>" +

                    "Back to Courses" +

                "</button>" +

                "<button type='button' class='it-back-button'>" +

                    "Change Level" +

                "</button>" +

            "</div>";


        var actionButtons =
            detail.querySelectorAll(".it-back-button");


        if (actionButtons.length === 2) {

            actionButtons[0].onclick = function () {

                if (
                    lastCourseContainer &&
                    lastCourseContainer.parentNode
                ) {

                    lastCourseContainer.scrollIntoView({
                        behavior: "smooth",
                        block: "start"
                    });

                } else {

                    showLevelCourses(domainName, level);

                }

            };


            actionButtons[1].onclick = function () {

                if (lastLevelPanel && lastLevelPanel.parentNode) {

                    lastLevelPanel.scrollIntoView({
                        behavior: "smooth",
                        block: "start"
                    });

                } else {

                    showLevelPanel(domainName);

                }

            };

        }


        var enrollButton =
            detail.querySelector(".enroll-now-button");

        if (enrollButton) {

            enrollButton.onclick = function () {

                openEnrollmentPopup(
                    course,
                    domainName,
                    level
                );

            };

        }


        chatContent.appendChild(detail);

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


    /* ==========================================
       ENQUIRY POPUP
       ========================================== */

    var isEnquirySubmitting = false;

    function openEnquiryPopup(e) {
        if (typeof e !== 'undefined' && e && e.preventDefault) {
            e.preventDefault();
            e.stopPropagation();
        }
        var popup = document.getElementById('enquiryPopup');
        if (popup) {
            clearEnquiryForm();
            popup.style.display = 'flex';
            popup.style.alignItems = 'center';
            popup.style.justifyContent = 'center';
            document.body.style.overflow = 'hidden';
        }
    }

    function closeEnquiryPopup() {
        var popup = document.getElementById('enquiryPopup');
        if (popup) {
            popup.style.display = 'none';
            document.body.style.overflow = '';
        }
    }

    function clearEnquiryForm() {
        document.getElementById('enqName').value = '';
        document.getElementById('enqEmail').value = '';
        document.getElementById('enqPhone').value = '';
        document.getElementById('enqCategory').value = '';
        document.getElementById('enqMessage').value = '';

        document.getElementById('enqNameError').textContent = '';
        document.getElementById('enqEmailError').textContent = '';
        document.getElementById('enqPhoneError').textContent = '';
        document.getElementById('enqCategoryError').textContent = '';
        document.getElementById('enqMessageError').textContent = '';
        document.getElementById('enqSuccessMsg').style.display = 'none';
        isEnquirySubmitting = false;
    }

    function validateEmail(email) {
        var re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(email);
    }

    function validateIndianPhone(phone) {
        var digits = phone.replace(/\D/g, '');
        if (digits.length < 10 || digits.length > 15) {
            return false;
        }
        if (digits.length === 11 && digits.charAt(0) === '0') {
            return true;
        }
        if (digits.length === 12 && digits.charAt(0) === '9' && digits.charAt(1) === '1') {
            return true;
        }
        if (digits.length === 13 && digits.substring(0, 2) === '91') {
            return true;
        }
        if (digits.length === 10) {
            return true;
        }
        return false;
    }

    function submitEnquiryForm() {
        if (isEnquirySubmitting) {
            return;
        }

        var name = document.getElementById('enqName').value.trim();
        var email = document.getElementById('enqEmail').value.trim();
        var phone = document.getElementById('enqPhone').value.trim();
        var category = document.getElementById('enqCategory').value;
        var message = document.getElementById('enqMessage').value.trim();

        var valid = true;

        document.getElementById('enqNameError').textContent = '';
        document.getElementById('enqEmailError').textContent = '';
        document.getElementById('enqPhoneError').textContent = '';
        document.getElementById('enqCategoryError').textContent = '';
        document.getElementById('enqMessageError').textContent = '';

        if (name === '') {
            document.getElementById('enqNameError').textContent = 'Name is required';
            valid = false;
        }

        if (email === '') {
            document.getElementById('enqEmailError').textContent = 'Email is required';
            valid = false;
        } else if (!validateEmail(email)) {
            document.getElementById('enqEmailError').textContent = 'Please enter a valid email address';
            valid = false;
        }

        if (phone === '') {
            document.getElementById('enqPhoneError').textContent = 'Phone number is required';
            valid = false;
        } else if (!validateIndianPhone(phone)) {
            document.getElementById('enqPhoneError').textContent = 'Please enter a valid phone number';
            valid = false;
        }

        if (category === '') {
            document.getElementById('enqCategoryError').textContent = 'Category is required';
            valid = false;
        }

        if (message === '') {
            document.getElementById('enqMessageError').textContent = 'Message is required';
            valid = false;
        }

        if (!valid) {
            return;
        }

        isEnquirySubmitting = true;

        var successMsg = document.getElementById('enqSuccessMsg');
        successMsg.textContent = 'Your enquiry has been submitted successfully!';
        successMsg.style.display = 'block';

        setTimeout(function () {
            clearEnquiryForm();
            closeEnquiryPopup();
            addBotMessage("Your enquiry has been submitted successfully!");
        }, 1500);
    }

    window.addEventListener('click', function (e) {
        var popup = document.getElementById('enquiryPopup');
        var popupBox = document.querySelector('.enquiry-popup');
        if (popup && popup.style.display === 'flex' && popupBox && !popupBox.contains(e.target)) {
            closeEnquiryPopup();
        }
    });


    /* ==========================================
       COURSE ENROLLMENT (FRONTEND DEMO ONLY)
       No backend, no real payment.
       ========================================== */

    var ENROLL_STEPS = [
        { key: 1, label: "Course" },
        { key: 2, label: "Details" },
        { key: 3, label: "Review" },
        { key: 4, label: "Payment" },
        { key: 5, label: "Done" }
    ];

    var enrollmentState = null;


    /* ------------------------------------------
       STATE
       ------------------------------------------ */

    function createEmptyEnrollmentState() {

        return {

            step: 1,

            course: null,

            domain: "",

            level: "",

            details: {
                fullName: "",
                email: "",
                mobile: "",
                college: "",
                department: "",
                year: "",
                studentId: "",
                message: ""
            },

            paymentMethod: "",

            paymentError: "",

            reference: "",

            busy: false

        };

    }

    function getCourseFee(course) {

        /*
         * Only use a fee that already exists in the frontend
         * course data. None is invented here.
         */

        if (
            course &&
            typeof course.fee !== "undefined" &&
            course.fee !== null &&
            String(course.fee).trim() !== ""
        ) {

            return String(course.fee);

        }

        return null;

    }

    function generateEnrollmentReference() {

        return (
            "DEMO-" +
            Date.now().toString(36).toUpperCase() +
            "-" +
            Math.floor(Math.random() * 9000 + 1000)
        );

    }


    /* ------------------------------------------
       OPEN / CLOSE
       ------------------------------------------ */

    function openEnrollmentPopup(course, domainName, level) {

        enrollmentState = createEmptyEnrollmentState();

        enrollmentState.course = course;

        enrollmentState.domain =
            (course && course.domain)
                ? course.domain
                : (domainName || "");

        enrollmentState.level =
            (course && course.level)
                ? course.level
                : (level || "");

        enrollmentState.step = 1;

        var popup = document.getElementById("enrollmentPopup");

        if (popup) {

            popup.style.display = "flex";

            popup.style.alignItems = "center";

            popup.style.justifyContent = "center";

            document.body.style.overflow = "hidden";

        }

        renderEnrollment();

    }

    function closeEnrollmentPopup() {

        var popup = document.getElementById("enrollmentPopup");

        if (popup) {
            popup.style.display = "none";
        }

        document.body.style.overflow = "";

        enrollmentState = null;

    }

    function cancelEnrollment() {

        closeEnrollmentPopup();

    }


    /* ------------------------------------------
       RENDER
       ------------------------------------------ */

    function renderEnrollment() {

        if (!enrollmentState) {
            return;
        }

        renderEnrollmentProgress();

        var body = document.getElementById("enrollBody");

        if (!body) {
            return;
        }

        var html = "";

        switch (enrollmentState.step) {

            case 1:
                html = buildEnrollmentStep1();
                break;

            case 2:
                html = buildEnrollmentStep2();
                break;

            case 3:
                html = buildEnrollmentStep3();
                break;

            case 4:
                html = buildEnrollmentStep4();
                break;

            case 5:
                html = buildEnrollmentStep5();
                break;

            default:
                html = buildEnrollmentStep1();

        }

        body.innerHTML = html;

        body.scrollTop = 0;

    }

    function renderEnrollmentProgress() {

        var container = document.getElementById("enrollProgress");

        if (!container) {
            return;
        }

        var html = "";

        for (var i = 0; i < ENROLL_STEPS.length; i++) {

            var step = ENROLL_STEPS[i];

            var cls = "enroll-progress-item";

            var mark = String(step.key);

            if (step.key < enrollmentState.step) {

                cls += " done";

                mark = "\u2713";

            } else if (step.key === enrollmentState.step) {

                cls += " active";

            }

            html +=

                "<div class='" + cls + "'>" +

                    "<div class='enroll-progress-dot'>" +
                        mark +
                    "</div>" +

                    "<div class='enroll-progress-label'>" +
                        escapeHtml(step.label) +
                    "</div>" +

                "</div>";

        }

        container.innerHTML = html;

    }

    function enrollSummaryRow(key, value) {

        return "<div class='enroll-summary-row'>" +
                    "<span class='enroll-summary-key'>" +
                        escapeHtml(key) +
                    "</span>" +
                    "<span class='enroll-summary-value'>" +
                        value +
                    "</span>" +
                "</div>";

    }

    function enrollField(label, id, type, value, placeholder) {

        return "<div class='enroll-field'>" +
                    "<label class='enroll-label'>" +
                        escapeHtml(label) +
                    "</label>" +
                    "<input type='" + type + "' id='" + id + "' " +
                        "class='enroll-input' " +
                        "value='" + escapeHtml(value || "") + "' " +
                        "placeholder='" + escapeHtml(placeholder || "") + "' />" +
                    "<div class='enroll-error' id='" + id + "Error'></div>" +
                "</div>";

    }


    /* ------------------------------------------
       STEP 1 - CONFIRM COURSE
       ------------------------------------------ */

    function buildEnrollmentStep1() {

        var course = enrollmentState.course || {};

        var fee = getCourseFee(course);

        var feeText = fee
            ? escapeHtml(fee)
            : "Fee to be announced";

        return "<div class='enroll-section-title'>Confirm Course</div>" +

            "<div class='enroll-summary-card'>" +

                enrollSummaryRow(
                    "Course",
                    escapeHtml(course.name || "")
                ) +

                enrollSummaryRow(
                    "Domain",
                    escapeHtml(enrollmentState.domain || "")
                ) +

                enrollSummaryRow(
                    "Duration",
                    escapeHtml(course.duration || "")
                ) +

                enrollSummaryRow(
                    "Learning Level",
                    escapeHtml(enrollmentState.level || "")
                ) +

                enrollSummaryRow(
                    "Course Fee",
                    feeText
                ) +

            "</div>" +

            "<div class='enroll-actions'>" +

                "<button type='button' class='enroll-btn enroll-btn-secondary' " +
                    "onclick='cancelEnrollment()'>" +
                    "Cancel" +
                "</button>" +

                "<button type='button' class='enroll-btn enroll-btn-primary' " +
                    "onclick='goToEnrollmentStep(2)'>" +
                    "Continue to Enrollment" +
                "</button>" +

            "</div>";

    }


    /* ------------------------------------------
       STEP 2 - STUDENT DETAILS
       ------------------------------------------ */

    function buildEnrollmentStep2() {

        var d = enrollmentState.details;

        var years = [
            "1st Year",
            "2nd Year",
            "3rd Year",
            "4th Year",
            "Other"
        ];

        var yearOptions =
            "<option value=''>-- Select Year --</option>";

        for (var i = 0; i < years.length; i++) {

            yearOptions +=
                "<option value='" + escapeHtml(years[i]) + "'" +
                    (d.year === years[i] ? " selected" : "") +
                    ">" +
                    escapeHtml(years[i]) +
                "</option>";

        }

        return "<div class='enroll-section-title'>Student Details</div>" +

            enrollField("Full Name *", "enrollFullName", "text",
                d.fullName, "Enter your full name") +

            enrollField("Email Address *", "enrollEmail", "email",
                d.email, "Enter your email address") +

            enrollField("Mobile Number *", "enrollMobile", "tel",
                d.mobile, "10 digit mobile number") +

            enrollField("College / Institution Name *", "enrollCollege", "text",
                d.college, "Enter your college or institution") +

            enrollField("Department / Branch *", "enrollDepartment", "text",
                d.department, "Enter your department or branch") +

            "<div class='enroll-field'>" +
                "<label class='enroll-label'>Current Year of Study *</label>" +
                "<select id='enrollYear' class='enroll-select'>" +
                    yearOptions +
                "</select>" +
                "<div class='enroll-error' id='enrollYearError'></div>" +
            "</div>" +

            enrollField("Student ID / Register Number (optional)",
                "enrollStudentId", "text",
                d.studentId, "Enter your student ID or register number") +

            "<div class='enroll-field'>" +
                "<label class='enroll-label'>Additional Message (optional)</label>" +
                "<textarea id='enrollMessage' class='enroll-textarea' " +
                    "placeholder='Anything you would like to add...'>" +
                    escapeHtml(d.message || "") +
                "</textarea>" +
            "</div>" +

            "<div class='enroll-actions'>" +

                "<button type='button' class='enroll-btn enroll-btn-secondary' " +
                    "onclick='goToEnrollmentStep(1)'>" +
                    "Back" +
                "</button>" +

                "<button type='button' class='enroll-btn enroll-btn-primary' " +
                    "onclick='goToEnrollmentStep(3)'>" +
                    "Continue" +
                "</button>" +

            "</div>";

    }

    function saveStep2Inputs() {

        if (!enrollmentState) {
            return;
        }

        function val(id) {
            var el = document.getElementById(id);
            return el ? el.value.trim() : "";
        }

        var d = enrollmentState.details;

        d.fullName = val("enrollFullName");
        d.email = val("enrollEmail");
        d.mobile = val("enrollMobile");
        d.college = val("enrollCollege");
        d.department = val("enrollDepartment");
        d.year = val("enrollYear");
        d.studentId = val("enrollStudentId");

        var msg = document.getElementById("enrollMessage");
        d.message = msg ? msg.value.trim() : "";

    }

    function clearEnrollError(id) {
        var el = document.getElementById(id);
        if (el) {
            el.textContent = "";
        }
    }

    function setEnrollError(id, message) {
        var el = document.getElementById(id);
        if (el) {
            el.textContent = message;
        }
    }

    function validateStep2() {

        var d = enrollmentState.details;

        var ok = true;

        clearEnrollError("enrollFullNameError");
        clearEnrollError("enrollEmailError");
        clearEnrollError("enrollMobileError");
        clearEnrollError("enrollCollegeError");
        clearEnrollError("enrollDepartmentError");
        clearEnrollError("enrollYearError");

        if (d.fullName === "") {
            setEnrollError("enrollFullNameError", "Full name is required");
            ok = false;
        }

        if (d.email === "") {
            setEnrollError("enrollEmailError", "Email address is required");
            ok = false;
        } else if (!validateEmail(d.email)) {
            setEnrollError("enrollEmailError", "Please enter a valid email address");
            ok = false;
        }

        if (d.mobile === "") {
            setEnrollError("enrollMobileError", "Mobile number is required");
            ok = false;
        } else if (!validateIndianPhone(d.mobile)) {
            setEnrollError("enrollMobileError", "Please enter a valid mobile number");
            ok = false;
        }

        if (d.college === "") {
            setEnrollError("enrollCollegeError", "College / institution name is required");
            ok = false;
        }

        if (d.department === "") {
            setEnrollError("enrollDepartmentError", "Department / branch is required");
            ok = false;
        }

        if (d.year === "") {
            setEnrollError("enrollYearError", "Year of study is required");
            ok = false;
        }

        return ok;

    }


    /* ------------------------------------------
       STEP 3 - REVIEW
       ------------------------------------------ */

    function buildEnrollmentStep3() {

        var course = enrollmentState.course || {};

        var d = enrollmentState.details;

        var fee = getCourseFee(course);

        var studentRows =
            enrollSummaryRow("Full Name", escapeHtml(d.fullName)) +
            enrollSummaryRow("Email", escapeHtml(d.email)) +
            enrollSummaryRow("Mobile", escapeHtml(d.mobile)) +
            enrollSummaryRow("College", escapeHtml(d.college)) +
            enrollSummaryRow("Department", escapeHtml(d.department)) +
            enrollSummaryRow("Year of Study", escapeHtml(d.year));

        if (d.studentId !== "") {
            studentRows += enrollSummaryRow("Student ID", escapeHtml(d.studentId));
        }

        if (d.message !== "") {
            studentRows += enrollSummaryRow("Message", escapeHtml(d.message));
        }

        return "<div class='enroll-section-title'>Review Enrollment</div>" +

            "<div class='enroll-summary-card'>" +

                enrollSummaryRow("Course", escapeHtml(course.name || "")) +

                enrollSummaryRow("Domain", escapeHtml(enrollmentState.domain || "")) +

                enrollSummaryRow("Duration", escapeHtml(course.duration || "")) +

                enrollSummaryRow("Learning Level", escapeHtml(enrollmentState.level || "")) +

                enrollSummaryRow(
                    "Course Fee",
                    fee ? escapeHtml(fee) : "Fee to be announced"
                ) +

            "</div>" +

            "<div class='enroll-section-title'>Student Details</div>" +

            "<div class='enroll-summary-card'>" +
                studentRows +
            "</div>" +

            "<div class='enroll-actions'>" +

                "<button type='button' class='enroll-btn enroll-btn-secondary' " +
                    "onclick='goToEnrollmentStep(2)'>" +
                    "Edit Details" +
                "</button>" +

                "<button type='button' class='enroll-btn enroll-btn-primary' " +
                    "onclick='goToEnrollmentStep(4)'>" +
                    "Proceed to Payment" +
                "</button>" +

            "</div>";

    }


    /* ------------------------------------------
       STEP 4 - DEMO PAYMENT
       ------------------------------------------ */

    function buildEnrollmentStep4() {

        var course = enrollmentState.course || {};

        var fee = getCourseFee(course);

        var header =
            "<div class='enroll-section-title'>Demo Payment</div>" +

            "<div class='enroll-summary-card'>" +

                enrollSummaryRow("Course", escapeHtml(course.name || "")) +

                enrollSummaryRow(
                    "Amount",
                    fee ? escapeHtml(fee) : "Fee to be announced"
                ) +

            "</div>";

        /*
         * When no fee exists in the frontend data we must NOT invent
         * an amount or simulate a successful payment.
         */

        if (!fee) {

            return header +

                "<div class='enroll-note'>" +
                    "<strong>Fee confirmation required.</strong> " +
                    "The course fee is not available in the frontend data, " +
                    "so this demo cannot show an amount or simulate a payment. " +
                    "Please return to the enrollment summary." +
                "</div>" +

                "<div class='enroll-actions'>" +

                    "<button type='button' class='enroll-btn enroll-btn-secondary' " +
                        "onclick='goToEnrollmentStep(3)'>" +
                        "Back to Summary" +
                    "</button>" +

                "</div>";

        }

        var methods = [
            "UPI",
            "Credit / Debit Card",
            "Net Banking"
        ];

        var optionsHtml = "";

        for (var i = 0; i < methods.length; i++) {

            var selected =
                enrollmentState.paymentMethod === methods[i]
                    ? " selected"
                    : "";

            optionsHtml +=
                "<label class='enroll-payment-option" + selected + "'>" +
                    "<input type='radio' name='enrollPayment' " +
                        (enrollmentState.paymentMethod === methods[i]
                            ? "checked "
                            : "") +
                        "onclick='selectPaymentMethod(\"" +
                            escapeHtml(methods[i]) +
                        "\")' />" +
                    escapeHtml(methods[i]) +
                "</label>";

        }

        var errorHtml = enrollmentState.paymentError
            ? "<div class='enroll-error' style='margin-bottom:12px;'>" +
                escapeHtml(enrollmentState.paymentError) +
              "</div>"
            : "";

        return header +

            "<div class='enroll-note'>" +
                "This is a <strong>demo payment screen</strong>. No real payment " +
                "gateway is connected. Do not enter real card numbers, CVV, UPI PIN " +
                "or banking passwords. No credentials are collected or stored." +
            "</div>" +

            "<div class='enroll-payment-options'>" +
                optionsHtml +
            "</div>" +

            errorHtml +

            "<div class='enroll-actions'>" +

                "<button type='button' class='enroll-btn enroll-btn-secondary' " +
                    "onclick='goToEnrollmentStep(3)'>" +
                    "Back" +
                "</button>" +

                "<button type='button' class='enroll-btn enroll-btn-primary' " +
                    "onclick='simulatePayment()'>" +
                    "Simulate Payment" +
                "</button>" +

            "</div>";

    }

    function selectPaymentMethod(method) {

        if (!enrollmentState || enrollmentState.busy) {
            return;
        }

        enrollmentState.paymentMethod = method;

        enrollmentState.paymentError = "";

        renderEnrollment();

    }

    function simulatePayment() {

        if (!enrollmentState || enrollmentState.busy) {
            return;
        }

        var fee = getCourseFee(enrollmentState.course);

        /*
         * Never simulate a successful paid transaction without a known fee.
         */

        if (!fee) {
            return;
        }

        if (enrollmentState.paymentMethod === "") {

            enrollmentState.paymentError =
                "Please select a payment method to continue.";

            renderEnrollment();

            return;

        }

        enrollmentState.paymentError = "";

        enrollmentState.busy = true;

        var body = document.getElementById("enrollBody");

        if (body) {

            body.innerHTML =
                "<div class='enroll-processing'>" +
                    "<div class='enroll-spinner'></div>" +
                    "<div>Processing your demo payment...</div>" +
                    "<div class='enroll-note' style='margin-bottom:0;'>" +
                        "Demo only \u2014 no real money is transferred." +
                    "</div>" +
                "</div>";

        }

        setTimeout(function () {

            if (!enrollmentState) {
                return;
            }

            enrollmentState.busy = false;

            enrollmentState.reference =
                generateEnrollmentReference();

            enrollmentState.step = 5;

            renderEnrollment();

        }, 1800);

    }


    /* ------------------------------------------
       STEP 5 - DEMO CONFIRMATION
       ------------------------------------------ */

    function buildEnrollmentStep5() {

        var course = enrollmentState.course || {};

        var d = enrollmentState.details;

        var fee = getCourseFee(course);

        var rows =
            enrollSummaryRow("Student Name", escapeHtml(d.fullName)) +
            enrollSummaryRow("Course", escapeHtml(course.name || "")) +
            enrollSummaryRow("Domain", escapeHtml(enrollmentState.domain || "")) +
            enrollSummaryRow("Learning Level", escapeHtml(enrollmentState.level || "")) +
            enrollSummaryRow("Duration", escapeHtml(course.duration || "")) +
            enrollSummaryRow(
                "Course Fee",
                fee ? escapeHtml(fee) : "Fee to be announced"
            ) +
            enrollSummaryRow(
                "Enrollment Reference",
                escapeHtml(enrollmentState.reference)
            );

        return "<div class='enroll-result'>" +

            "<div class='enroll-result-icon'>\u2713</div>" +

            "<div class='enroll-result-title'>Demo Enrollment Completed!</div>" +

            "<div class='enroll-badge'>Demo Only \u2014 No Real Payment</div>" +

            "<div class='enroll-summary-card' style='text-align:left;'>" +
                rows +
            "</div>" +

            "<div class='enroll-note' style='text-align:left;'>" +
                "This is a frontend demonstration only. You have not been " +
                "officially enrolled, no data was saved to a server, and no " +
                "payment was received." +
            "</div>" +

            "<div class='enroll-actions'>" +

                "<button type='button' class='enroll-btn enroll-btn-primary' " +
                    "onclick='enrollBackToChatbot()'>" +
                    "Back to Chatbot" +
                "</button>" +

            "</div>" +

        "</div>";

    }

    function enrollBackToChatbot() {

        closeEnrollmentPopup();

    }


    /* ------------------------------------------
       NAVIGATION
       ------------------------------------------ */

    function goToEnrollmentStep(stepNumber) {

        if (!enrollmentState || enrollmentState.busy) {
            return;
        }

        /*
         * Preserve entered details when moving between steps.
         */

        if (enrollmentState.step === 2 && stepNumber !== 2) {

            saveStep2Inputs();

            var movingForward = stepNumber > 2;

            if (movingForward && !validateStep2()) {
                return;
            }

        }

        enrollmentState.step = stepNumber;

        renderEnrollment();

    }


    /* ------------------------------------------
       OVERLAY BACKDROP CLOSE
       ------------------------------------------ */

    (function () {

        var overlay = document.getElementById("enrollmentPopup");

        if (overlay) {

            overlay.addEventListener("click", function (e) {

                if (e.target === overlay) {
                    closeEnrollmentPopup();
                }

            });

        }

    })();

</script>

</asp:Content>