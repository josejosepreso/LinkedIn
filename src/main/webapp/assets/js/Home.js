n = 0;

class Home {

    static loadEvents() {

        let reactionButtons = document.querySelectorAll("a.reactionButton");
        for(let reactionButton of reactionButtons) {

            reactionButton.addEventListener("click", Home.react.bind(null));
        }
    }

    static post(textArea) {

        if(textArea.value === "") return;

        let post = new Post(n++, new User(0, "Cradily", "profile.png"), textArea.value, undefined, 0);

        textArea.value = "";

        let posts = document.querySelector("div#posts");

        posts.insertBefore(post.getHTML(), posts.children[0]);

		let modal = bootstrap.Modal.getInstance(document.querySelector(`div#createPostModal`));
		modal.hide();

        Home.loadEvents();
    }

    static comment(e) {

        let post = document.querySelector(`div#${e.target.parentElement.parentElement.parentElement.id}`);

        let html = document.createElement("div");
        let input = document.createElement("input");
        let button = document.createElement("a");
        let img = document.createElement("img");

        img.src = "assets/img/profile.png";
        img.classList.add("profile-photo-comment", "mx-2");
        button.classList.add("btn");
        button.innerText = "Send";
        html.classList.add("my-2", "comments", "form-control", "d-flex", "justify-content-center", "align-items-center");
        input.classList.add("form-control");

        input.placeholder = "Comment";

        html.appendChild(img);
        html.appendChild(input);
        html.appendChild(button);

		button.addEventListener("click", () => {
	
			if(input.value != ""){
	
				let comment = new Comment("User", "profile.png", input.value);
	
				post.insertBefore(comment.getHTML(), post.children[post.children.length-1]);
	
				input.value = "";
			}
		});

	// LOAD COMMENTS
	let comments = {
		1:{
			user:"Swampert",
			content:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo",
			img:"swampert.png"
		},
		2:{
			user:"Beedrill",
			content:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo",
			img:"beedrill.png"
		},
		3:{
			user:"Dewgon",
			content:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo",
			img:"dewgon.png"
		}
	}; 
	
    Object.keys(comments).forEach((i) => {

		let commentHTML = new Comment(comments[i].user, comments[i].img, comments[i].content);

		post.appendChild(commentHTML.getHTML());
	});

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

		posts.appendChild(new Post(n++, new User(1, "Swampert", "swampert.png"), "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", undefined, 1).getHTML());
		posts.appendChild(new Post(n++, new User(2, "Haunter", "haunter.png"), "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "assets/img/posts/2.jpg", 1).getHTML());
		posts.appendChild(new Post(n++, new User(3, "Dewgon", "dewgon.png"), "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "assets/img/posts/3.png", 12).getHTML());
		posts.appendChild(new Post(n++, new User(4, "Beedrill", "beedrill.png"), "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "assets/img/posts/1.png", 2).getHTML());

        // for(let i = 0; i < 2; i++) {

        //     let post = new Post(n++, "User", "AAAAAA", "a.png");

        //     posts.appendChild(post.getHTML());
        // }

    }
}
