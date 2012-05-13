
document.body.addEventListener("keydown", keyrelease, false);

function keyrelease(evt){

  //console.log("User pressed: " + evt.keyCode );

  /* k: 75, h: 72, l: 76, j: 74, u: 85, d: 68 */
  switch(evt.keyCode){
    case 72: /* h */
      break;
    case 74: /* j */
      window.scrollBy(0, 50);
      break;
    case 75: /* k */
      window.scrollBy(0, -50);
      break;
    case 76: /* l */
      break;
    case 85: /* u */
      window.scrollBy(0, -(window.innerHeight/2));
      break;
    case 68: /* d */
      window.scrollBy(0, window.innerHeight/2);
      break;
    default:
      break;
  }
}
