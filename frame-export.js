let GET = {};
let query = window.location.search.substring(1).split("&");

for (let i = 0; i < query.length; i++) {
    if (query[i] === "") // check for trailing & with no param
        continue;
    var param = query[i].split("=");
    GET[param[0]] = param[1];
}

let exporting = (GET["exporting"] && GET["exporting"] == "true") ? true : false;

function frameExport() {
    var formattedFrameCount = "" + frameCount;
    while (formattedFrameCount.length < 5) {
        formattedFrameCount = "0" + formattedFrameCount;
    }
    var dataUrl = cnvs.toDataURL();
    var data = {
        dataUrl: dataUrl,
        name: fileName + "-" + formattedFrameCount
    }
    socket.emit('image', data);
}