var fs = require('fs');

var isOn = false;
var count = 0;
var maxCount = 10;

fs.writeFileSync('/sys/class/leds/led0/trigger', 'none');

var blink = setInterval(function() {

  if(count == maxCount) {
    fs.writeFileSync('/sys/class/leds/led0/trigger', 'cpu0');
    clearInterval(blink);
    return;
  }

  if(isOn) {
    fs.writeFileSync('/sys/class/leds/led0/brightness', '0');
    isOn = false;
  } else {
    fs.writeFileSync('/sys/class/leds/led0/brightness', '1');
    isOn = true;
    count++;
  }

}, 1000);

