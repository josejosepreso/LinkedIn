let commentButtons = document.querySelectorAll("a.commentButton");

for(let commentButton of commentButtons) {

    commentButton.addEventListener("click", Action.comment.bind(null));
}

let createPostButton = document.querySelector("a#createPost");
createPostButton.addEventListener("click", Action.showModal);
