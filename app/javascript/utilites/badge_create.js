document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('#badge_rule')
  // я не знаю почему но событие onchange вызывается только при загрузке(перезагрузке) страницы
  // поэтому страница меняется только после перезагрузки
  if(control) { control.addEventListener("change", badgeCreate(control)) }
})

function badgeCreate(control) {
  if (control.value == "Level"){
    document.querySelectorAll('.badge-level').forEach(e => e.classList.remove('hide'))
    document.querySelectorAll('.badge-category').forEach(e => e.classList.add('hide'))
    document.querySelectorAll('.badge-test').forEach(e => e.classList.add('hide'))
  } else if (control.value == "Category"){
    document.querySelectorAll('.badge-level').forEach(e => e.classList.add('hide'))
    document.querySelectorAll('.badge-category').forEach(e => e.classList.remove('hide'))
    document.querySelectorAll('.badge-test').forEach(e => e.classList.add('hide'))
  } else if (control.value == "Test") {
    document.querySelectorAll('.badge-level').forEach(e => e.classList.add('hide'))
    document.querySelectorAll('.badge-category').forEach(e => e.classList.add('hide'))
    document.querySelectorAll('.badge-test').forEach(e => e.classList.remove('hide'))
  } else {
    document.querySelectorAll('.badge-level').forEach(e => e.classList.add('hide'))
    document.querySelectorAll('.badge-category').forEach(e => e.classList.add('hide'))
    document.querySelectorAll('.badge-test').forEach(e => e.classList.add('hide'))
  }
}
