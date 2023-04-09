const container=document.querySelector('#container');
const loginButton=document.querySelector('#logIn');
const signUpButton=document.querySelector('#signUp');

signUpButton.addEventListener('click',() => container.classList.add('right-panel-active'))
loginButton.addEventListener('click',() => container.classList.remove('right-panel-active'))
