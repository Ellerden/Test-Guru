document.addEventListener('turbolinks:load', function() {
  var password = document.getElementById('user_password')
  var confirmation = document.getElementById('user_password_confirmation')

  confirmation.addEventListener("input", comparePasswords.bind(null, password, confirmation))
  confirmation.addEventListener("change", comparePasswords.bind(null, password, confirmation))
})

function comparePasswords(password, confirmation) {
    if (confirmation.value == "") {
      return 0
    }
      if (password.value == confirmation.value)
    {
      confirmation.className = "success"
    } else {
      confirmation.className = "error"
    }
}
