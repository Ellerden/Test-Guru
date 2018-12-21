document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.answer-btn');

  if (control) {
    checkCapacity(control);
  }
})

function checkCapacity(control){
  var maximum = control.dataset.maximum;

  if (maximum == 'true') {
    control.classList.add('disabled');
  } else {
    control.classList.remove('disabled');
  }
}
