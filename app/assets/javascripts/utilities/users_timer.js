document.addEventListener('turbolinks:load', function() {
  var control= document.querySelector('.user-timer');
 
  if (control) {
    var timeToPass = control.dataset.time;
    var testCreatedAt = control.dataset.test_created;
    var resultLink = control.dataset.result_link;
    turnOnTimer();
  }

  function turnOnTimer() {
    var timeNow = (Date.now() / 1000).toFixed(); // show current time in seconds not milisec
    var timePassed = timeNow - testCreatedAt;
    
    if (timePassed > timeToPass) {
      alert('There is no time left to finish the test :(');
      var button = document.getElementById('btnnext');
      button.click();
      return;
    }
    secondsToHM(timeToPass - timePassed);
    setTimeout(turnOnTimer, 1000);
  }

  function secondsToHM(timeLeft) {
    h = pad((timeLeft / 60 / 60) % 60);
    m = pad((timeLeft / 60) % 60);
    s = pad(timeLeft % 60);
    control.textContent = h + ":" + m + ":" + s;
  }
})

function pad(num) {
  return ("0" + parseInt(num)).substr(-2);
}