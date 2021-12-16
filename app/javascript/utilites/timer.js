document.addEventListener('turbolinks:load', function() {
  const control = document.querySelector('.timer')  
  if(control) {
    if (control.getAttribute('data-timer')!= ""){
      if (!localStorage.getItem(window.location.pathname)){
        localStorage.setItem(window.location.pathname, control.getAttribute('data-timer'))
      }
      let timerId = setInterval(function() {
        time_to_end = localStorage.getItem(window.location.pathname)      
        control.innerHTML = new Date(time_to_end*1000).toISOString().substr(11,8)
        if (time_to_end == 0){
          clearInterval(timerId)
          window.location.href = (window.location.pathname + '/result')
        }
        time_to_end--
        localStorage.setItem(window.location.pathname, time_to_end)
      }, 1000)  
    }    
  }
  romoveFromStorage()
})

function romoveFromStorage(){
  const control_result = document.querySelector('.result-page')  
  if(control_result) {
    localStorage.removeItem(window.location.pathname.slice(0,-7))
  }
}
