
var vi_normal_mode = false;

if ( vi_normal_mode )
  chrome.browserAction.setBadgeText({text: "N"});
else
  chrome.browserAction.setBadgeText({text: "I"});

/* Extension listens to mode change events from content script */
chrome.extension.onRequest.addListener(
  function(reqObj, senderObj, sendResponseFunc) {

    /*console.log("Extension recieved a request");*/

    if ( reqObj.source != "content" )
      return;

    var keyCode = reqObj.keyCode;
    switch(keyCode){
      /*case 67: [> c <]*/
      case 75: /* k */
        chrome.browserAction.setBadgeText({text: "N"});
        vi_normal_mode = true;
        //chrome.extension.sendRequest( { source: "background", vi_normal_mode: true } );
        sendMsgToAllTabs( {source: "background", vi_normal_mode: true } );
        break;
      case 73: /* i */
        chrome.browserAction.setBadgeText({text: "I"});
        vi_normal_mode = false;
        //chrome.extension.sendRequest( { source: "background", vi_normal_mode: false } );
        sendMsgToAllTabs( {source: "background", vi_normal_mode: false } );
        break;
      default:
        break;
    }
});

function sendMsgToAllTabs( obj ){
  /*console.log("Sending message to all tabs");*/
  chrome.tabs.query({}, function(tabs){
    for ( key in tabs )
    {
      var tabId = tabs[key].id;
      /*console.log("Sending message to tabId: " + tabId );*/
      chrome.tabs.sendRequest(tabId, obj);
    }
  });
}

