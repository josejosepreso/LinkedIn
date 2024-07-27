n = 2;

class Action {

    static loadEvents() {

        let reactionButtons = document.querySelectorAll("a.reactionButton");
        for(let reactionButton of reactionButtons) {

            reactionButton.addEventListener("click", Action.react.bind(null));
        }
    }

    static showModal(e) {

        let element = document.querySelector(`div#${e.target.id}Modal`);

        let modal = new bootstrap.Modal(element);

        modal.show();
    }

    static post(textArea) {

        if(textArea.value === "") return;

        let post = new Post(n++, "User1", textArea.value);

        textArea.value = "";

        let posts = document.querySelector("div#posts");

        posts.insertBefore(post.getHTML(), posts.children[0]);

        Action.loadEvents();
    }

    static comment(e) {

        let post = document.querySelector(`div#${e.target.parentElement.parentElement.parentElement.id}`);

        let html = document.createElement("div");
        let input = document.createElement("input");
        let button = document.createElement("a");
        let img = document.createElement("img");

        img.src = "img/profile.png";
        img.classList.add("profile-photo-comment", "p-3");
        button.classList.add("btn");
        button.innerText = "Send";
        html.classList.add("comments", "form-control", "d-flex", "justify-content-center", "align-items-center");
        input.classList.add("form-control");

        input.placeholder = "Comment";

        html.appendChild(img);
        html.appendChild(input);
        html.appendChild(button);

        post.appendChild(html);
    }

    static react(e) {

        // console.log(e.target);

        let post = document.querySelector(`div#${e.target.parentElement.parentElement.parentElement.parentElement.id}`);
        let reactButton = e.target.parentElement.previousElementSibling;

        // console.log(e.target.innerText);

        reactButton.innerText = `${e.target.innerText}`;

        reactButton.style.color = "#0d6efd";
        if(e.target.innerText === "Celebrate") reactButton.style.color = "#198754";
        else if(e.target.innerText === "Support") reactButton.style.color = "#6f42c1";
        else if(e.target.innerText === "Love") reactButton.style.color = "#dc3545";
        else if(e.target.innerText === "Insightful") reactButton.style.color = "#ffc107";
        else if(e.target.innerText === "Funny") reactButton.style.color = "#0dcaf0";
    }


    static loadPosts() {

        let posts = document.querySelector("div#posts");

        for(let i = 0; i < 2; i++) {

            let post = new Post(i, "User", "AAAAAA", "a.png");

            posts.appendChild(post.getHTML());
        }

    }
}
