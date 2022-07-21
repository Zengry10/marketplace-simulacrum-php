document.addEventListener('DOMContentLoaded', () => {
    let myButton = document.querySelector("#btn")
    let myInput = document.querySelector("#my-input");

    myButton.addEventListener('click',(event)=> {
        event.preventDefault()
        if (myInput.type == "password") {
            myInput.setAttribute("type", "text");
            myButton.innerHTML = "Cacher";
        } else {
            myInput.setAttribute("type", "password");
            myButton.innerHTML = "Afficher";
        }
    })

})