class ProgressBar {
  constructor(){
    this.prBar = document.querySelector('.progress-bar')
    this.currentProgress = this.prBar.dataset.progressStatus
    this.maxProgress = this.prBar.dataset.progressMax

    this.progressBar()
  }


  progressBar() {
    const value = this.currentProgress/this.maxProgress
    this.prBar.value = value
  }
}

document.addEventListener('turbolinks:load', function() {
  const control = document.querySelector('.progress-bar')
  if(control) {new ProgressBar()}
})

