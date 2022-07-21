document.addEventListener('DOMContentLoaded', () => {
    let myButton = document.querySelector("#btn")
    let myInput = document.querySelector("#my-input");
    let myInput2 = document.querySelector("#my-input2");
    let myButton2 = document.querySelector('#btn2');
    let myButton3 = document.querySelector('#btn3');
    let myButton4 = document.querySelector('#btn4');

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



    myButton2.addEventListener('click',(event)=> {
        event.preventDefault()
        if (myInput2.type == "password") {
            myInput2.setAttribute("type", "text");
            myButton2.innerHTML = "Cacher";
        } else {
            myInput2.setAttribute("type", "password");
            myButton2.innerHTML = "Afficher";
        }
    })
    
})

