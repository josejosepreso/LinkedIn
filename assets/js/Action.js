class Action {

    static showModal(e) {

        let element = document.querySelector(`div#${e.target.id}Modal`);

        let modal = new bootstrap.Modal(element);

        modal.show();
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

        e.target.removeEventListener("click", Action.comment);
    }

}
