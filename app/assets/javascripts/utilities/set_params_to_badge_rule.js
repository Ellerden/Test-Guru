document.addEventListener('turbolinks:load', function() {
  var control = document.getElementById('rule_name');

  if (control) {
<<<<<<< HEAD
=======

>>>>>>> f5a79f3... fix badge path, create rules constructor, refactoring
    var fieldLevel = document.querySelector('.choose-level');
    var labelLevel =  document.getElementById('label-add-level');
    var fieldCategory = document.querySelector('.choose-category');
    var labelCategory = document.getElementById('label-add-category');

    control.addEventListener('change', function() {
      //var optionValue = control.options[control.selectedIndex].value;
<<<<<<< HEAD
=======

>>>>>>> f5a79f3... fix badge path, create rules constructor, refactoring
      if (this.value === 'whole_category') {
        enableCategory();
      } else {
        enableLevel();
      }
<<<<<<< HEAD
=======
      //alert(this.value);
>>>>>>> f5a79f3... fix badge path, create rules constructor, refactoring
    }, false);
  }

  function enableCategory() {
    fieldCategory.disabled = false;
    labelCategory.classList.remove('text-muted');
    fieldLevel.disabled = true;
    labelLevel.classList.add('text-muted');
  }

  function enableLevel() {
    fieldLevel.disabled = false;
    labelLevel.classList.remove('text-muted');
    fieldCategory.disabled = true;
    labelCategory.classList.add('text-muted');
  }  
<<<<<<< HEAD
})
=======
})
>>>>>>> f5a79f3... fix badge path, create rules constructor, refactoring
