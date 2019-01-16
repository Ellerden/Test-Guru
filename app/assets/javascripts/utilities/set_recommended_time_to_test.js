document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.timer');

  if (control) {
    checkRecommendedTime();
  }
})

function checkRecommendedTime() {
  var checkbox = document.getElementById('add-time');
  checkbox.addEventListener('change', enableDisableTime.bind(null, checkbox));
}

function enableDisableTime(checkbox) {
  var field = document.querySelector('.time-selector');
  var label = document.querySelector('.form-check-label');

  if (checkbox.checked) {
    field.disabled = false;
    label.classList.remove('text-muted');
  } else {
    field.disabled = true;
    label.classList.add('text-muted');
  }
}
