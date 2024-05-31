/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
var __webpack_exports__ = {};

;// CONCATENATED MODULE: ./src/vault/fido2/enums/fido2-content-script.enum.ts
const Fido2ContentScript = {
    PageScript: "content/fido2/page-script.js",
    PageScriptAppend: "content/fido2/page-script-append-mv2.js",
    ContentScript: "content/fido2/content-script.js",
};
const Fido2ContentScriptId = {
    PageScript: "fido2-page-script-registration",
    ContentScript: "fido2-content-script-registration",
};

;// CONCATENATED MODULE: ./src/vault/fido2/content/page-script-append.mv2.ts
/**
 * This script handles injection of the FIDO2 override page script into the document.
 * This is required for manifest v2, but will be removed when we migrate fully to manifest v3.
 */

(function (globalContext) {
    if (globalContext.document.contentType !== "text/html") {
        return;
    }
    const script = globalContext.document.createElement("script");
    script.src = chrome.runtime.getURL(Fido2ContentScript.PageScript);
    script.addEventListener("load", () => script.remove());
    const scriptInsertionPoint = globalContext.document.head || globalContext.document.documentElement;
    scriptInsertionPoint.insertBefore(script, scriptInsertionPoint.firstChild);
})(globalThis);

/******/ })()
;