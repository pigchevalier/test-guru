document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('#user\\_password\\_confirmation')
  if(control) { control.addEventListener('input', passwordMatching) }
})

function passwordMatching(){
  var password = document.querySelector('#user\\_password')
  var password_confirmation = document.querySelector('#user\\_password\\_confirmation')
  if (password.value != password_confirmation.value && password_confirmation.value != ''){
    document.querySelector('.octicon-alert').classList.remove('hide')
  } else {
    document.querySelector('.octicon-alert').classList.add('hide')
  }

}



