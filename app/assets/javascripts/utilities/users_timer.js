 var timer;
document.addEventListener('turbolinks:load', function() {
  var control= document.querySelector('.user-timer')
  var backBtn = document.getElementById('back_to_tests');
 
  if (control) {
    backBtn.addEventListener('click', turnOffTimer); 
    var timeLeft = control.dataset.time;
    //convet to seconds for easier caculation

    timer = setInterval(function() {
      // if time passed redirect to result page 
      if (timeLeft > 0) {
        timeLeft -= 1;
      } else {
        var participationId = document.querySelector('.user-timer').dataset.test_id;
        alert('There is no time left to finish the test :(');  
        document.querySelector('form').submit();
      }
      //formart seconds back into mm:ss
      h = pad((timeLeft / 60 / 60) % 60);
      m = pad((timeLeft / 60) % 60);
      s = pad(timeLeft % 60);
      document.getElementById('countdown').textContent = h + ":" + m + ":" + s;
    }, 1000) //calling timer every 1 second to do a count down
  }

  function turnOffTimer() {
  clearInterval(timer);
}
})

// add additional 0 before the number
function pad(num) {
  return ("0" + parseInt(num)).substr(-2);
}