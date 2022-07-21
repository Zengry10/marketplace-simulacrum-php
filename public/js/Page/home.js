const buttons = document.querySelectorAll("[data-carousel-button]")

buttons.forEach(button => {
  button.addEventListener("click", () => {
    const offset = button.dataset.carouselButton === "next" ? 1 : -1
    const slides = button
      .closest("[data-carousel]")
      .querySelector("[data-slides]")

    const activeSlide = slides.querySelector("[data-active]")
    let newIndex = [...slides.children].indexOf(activeSlide) + offset
    if (newIndex < 0) newIndex = slides.children.length - 1
    if (newIndex >= slides.children.length) newIndex = 0

    slides.children[newIndex].dataset.active = true
    delete activeSlide.dataset.active
  })
})

const reserveHouse = document.querySelector('.reserveHouse')
const colorReserve = document.querySelector('.colorReserve')
const body = document.querySelector('body')

reserveHouse.addEventListener('mouseover', () =>{
    colorReserve.style.color = '#00BFB2'
    colorReserve.style.transition = '.7s'
    reserveHouse.style.backgroundColor = 'white'
    colorReserve.style.transition = '.7s'
})
reserveHouse.addEventListener('mouseout', () =>{
    colorReserve.style.color = 'white'
    colorReserve.style.transition = '.7s'
    reserveHouse.style.backgroundColor = '#00BFB2'
    colorReserve.style.transition = '.7s'
})
