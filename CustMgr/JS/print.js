//列印網頁區段
//使用方法
//<input id="btnPrint" type="button" value="列印豋打內容" onclick="printScreen(printlist)"/> 
//        <div id="printlist">  

function printScreen(printlist) {
    var value = printlist.innerHTML;
    var printPage = window.open("", "printPage", "");
    printPage.document.open();
    printPage.document.write("<HTML><head><link href=\"Site.css\" rel=\"stylesheet\" type=\"text/css\" /></head><BODY onload='window.print();window.close()'>");
    printPage.document.write("<PRE>");
    printPage.document.write(value);
    printPage.document.write("</PRE>");
    printPage.document.close("</BODY></HTML>");
}
