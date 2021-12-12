document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('#user_password_confirmation')
  if(control) { control.addEventListener('input', passwordMatching) }
})

function passwordMatching(){
  let password = document.querySelector('#user_password')
  let password_confirmation = document.querySelector('#user_password_confirmation')
  if (password.value != password_confirmation.value && password_confirmation.value != ''){
    document.querySelector('.octicon-alert').classList.remove('hide')
  } else {
    document.querySelector('.octicon-alert').classList.add('hide')
  }
}
