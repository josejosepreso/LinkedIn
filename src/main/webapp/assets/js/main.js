//
Home.load();

// PUBLICACIONES
let createPostButton = document.querySelector("a#createPost");
createPostButton.addEventListener("click", Action.showModal);
//
let sendButton = document.querySelector("button#sendButton");
let textArea = document.querySelector("textarea#inputPost");
sendButton.addEventListener("click", Home.send.bind(null, textArea));