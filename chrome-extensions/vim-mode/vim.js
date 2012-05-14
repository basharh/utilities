
var vi_normal_mode = false;

document.body.addEventListener("keydown", keyrelease, false);

function keyrelease(evt){

  /*console.log("key pressed: " + evt.keyCode + ", ctrlkey: " + evt.ctrlKey);*/

  /* k: 75, h: 72, l: 76, j: 74, u: 85, d: 68 */
  switch(evt.keyCode){
    case 74: /* j */
    case 75: /* k */
    case 85: /* u */
    case 68: /* d */
      if ( vi_normal_mode ){ /* Only handle movement keys in normal mode */
        add_evt( evt.keyCode );
        evt.preventDefault();
      }
      else
      {
        if ( evt.keyCode == 75 && evt.ctrlKey ){
          chrome.extension.sendRequest({ source: "content", keyCode: evt.keyCode }, function(response) {
            //console.log("Recieved response from extension: " + response.farewell);
          });
        }

      }
      /*add_evt_log( evt.keyCode );*/
      break;
    /*case 67: [> c <]*/
    case 73: /* i */
      /*console.log("i was pressed. vi_normal_mode: " + vi_normal_mode );*/
      if ( vi_normal_mode )
      {
        chrome.extension.sendRequest({source: "content", keyCode: evt.keyCode }, function(response) {
          //console.log("Recieved response from extension: " + response.farewell);
        });
        evt.preventDefault();
      }
      break;
    default:
      break;
  }
}

var add_evt_log = (function(){

  var prev_key_ts = 0;
  function add_evt_log(keyCode){
    if ( prev_key_ts == 0 )
    {
      prev_key_ts = Date.now();
    }
    else
    {
      var time = Date.now();
      /*console.log("key pressed: " + keyCode + ", time from prev key: " +
        ( time - prev_key_ts ) );*/
      prev_key_ts = time;
    }
  }

  return add_evt_log;
})()



var prev_key_ts = 0;

var move_q = new Array();

function add_evt( evt ){

  move_q.push( evt );

  switch ( evt ){
    case 74: /* j */
    case 68: /* d */
      var move_q_temp = new Array();
      for( var key in move_q ){
        if ( move_q[key] == 74 || move_q[key] == 68 )
          move_q_temp.push( move_q[key] );
      }
      move_q = move_q_temp;
      break;
    case 75: /* k */
    case 85: /* u */
      var move_q_temp = new Array();
      for( var key in move_q ){
        if ( move_q[key] == 75 || move_q[key] == 85 )
          move_q_temp.push( move_q[key] );
      }
      move_q = move_q_temp;
      break;
    default:
      break;
  }

  if ( !loop_running )
    handle_next();
}

var loop_running = false;

function handle_next(){

  loop_running = true;

  if ( move_q.length > 0 ){
    var evt = move_q.shift();
    handle_move_req( evt );
  }
  else
  {
    loop_running = false;
  }
}

function handle_move_req(req){
  switch(req){
    case 74: /* j */
      slowScroll( 50 );
      break;
    case 75: /* k */
      slowScroll( -50 );
      break;
    case 85: /* u */
      slowScroll( - ( (window.innerHeight) / 2 ) );
      break;
    case 68: /* d */
      slowScroll(( (window.innerHeight) / 2 ));
      break;
    default:
      break;
  }

  //handle_next();
}

function slowScroll( amt ){
  var step = 10;
  var stepWait = 15;
  var scrolled = 0;

  function scrollStep(){
    if ( ( scrolled + step ) > Math.abs(amt) ) {
      handle_next();
      return;
    }
    else
    { //scroll more
      window.scrollBy( 0, ( amt > 0 ? step : -(step) ) );
      scrolled += step;
      window.setTimeout( scrollStep, stepWait);
    }
  }
  scrollStep();
}

chrome.extension.onRequest.addListener(
  function(reqObj, senderObj, sendResponseFunc) {
    /*console.log("Message recieved in Content script. source: " +
     reqObj.source + ", reqObj.vi_normal_mode: " +
      reqObj.vi_normal_mode );*/
    if ( reqObj.source != "background" )
      return;

    vi_normal_mode = reqObj.vi_normal_mode;
});
