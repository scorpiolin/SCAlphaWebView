function initWebView() {
    var alphaframe = document.createElement("iframe");
    alphaframe.name = "showframe";
    alphaframe.width = "1";
    alphaframe.id = "alphaframe";
    alphaframe.height = "1";
    alphaframe.marginwidth = "0";
    alphaframe.marginheight = "0";
    alphaframe.hspace = "0";
    alphaframe.vspace = "0";
    alphaframe.frameborder = "0";
    alphaframe.scrolling = "no";
    document.getElementsByTagName("body")[0].appendChild(alphaframe);
}

function closeWebView() {
    var alphaframe = document.getElementById("alphaframe");
    alphaframe.src = "alphaframe://close";
}

initWebView();
