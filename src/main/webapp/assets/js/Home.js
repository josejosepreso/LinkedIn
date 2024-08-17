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

        img.src = "assets/img/profile1.png";
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
				
				let name = document.querySelector("div#myData").getAttribute("data-user-name");
				
				// console.log(name);
	
				let comment = new Comment(name, "profile1.png", input.value);
	
				post.insertBefore(comment.getHTML(), post.children[5]);
	
				input.value = "";
			}
		});
		
		post.appendChild(html);
		
		Home.loadComments(post);
    }
	
	static loadComments(post) {
		
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "controllers/get/comments", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Home.commentsProcessResponse.bind(xhr, post));
		xhr.send(`id=${(post.id).replace('post-','')}`);
	}

	static commentsProcessResponse(post) {
		
		if(this.readyState == 4) {
					
			if(this.status == 200) {
				
				let comments = JSON.parse(this.responseText).content;
				
				// console.log(comments);
				
			    Object.keys(comments).forEach((i) => {
					
					if(comments[i].FOTO_PERFIL == "null") {
						
						comments[i].FOTO_PERFIL = "profile1.png";
					}

					let commentHTML = new Comment(
											comments[i].NOMBRE_USUARIO,
											comments[i].FOTO_PERFIL,
											comments[i].CONTENIDO
									);

					post.appendChild(commentHTML.getHTML());
				});
			}
		}
	}		


    static react(e) {

        // console.log(e.target);

        // let post = document.querySelector(`div#${e.target.parentElement.parentElement.parentElement.parentElement.id}`);
        let reactButton = e.target.parentElement.previousElementSibling;

        // console.log(e.target.innerText);

        reactButton.innerText = `${e.target.innerText}`;

        reactButton.style.color = "#0d6efd";
        if(e.target.innerText === "Celebrar") reactButton.style.color = "#198754";
        else if(e.target.innerText === "Apoyar") reactButton.style.color = "#6f42c1";
        else if(e.target.innerText === "Encantar") reactButton.style.color = "#dc3545";
        else if(e.target.innerText === "Interesar") reactButton.style.color = "#ffc107";
        else if(e.target.innerText === "Hacer gracia") reactButton.style.color = "#0dcaf0";
    }


    static load() {
		
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "controllers/get/home", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Home.processResponse.bind(xhr));
		xhr.send();
    }
	
	static processResponse() {
		
		if(this.readyState == 4) {
					
			if(this.status == 200) {
				
				const obj = JSON.parse(this.responseText);
				
				const posts = obj.content.posts;
				
				// console.log(obj);
				
				if(obj.status) {
					
					const postsSection = document.querySelector("div#posts");
					
					let post;
					
					Object.keys(posts).forEach((i) => {
						
						post = new Post(
							posts[i].CODIGO_PUBLICACION,
							new User(0, posts[i].USUARIO, "profile1.png"),
							posts[i].CONTENIDO,
							undefined,
							posts[i].CANTIDAD_REACCIONES,
							posts[i].CANTIDAD_COMENTARIOS,
							posts[i].FECHA_PUBLICACION
						).getHTML();
					
						postsSection.appendChild(post);
					});
					
					Home.loadEvents();
					
					if(obj.PUESTO_ACTUAL != null) document.querySelector("p#currentUserJob").innerText = `${obj.PUESTO_ACTUAL}`;
				}
			}
		}
	}
}
