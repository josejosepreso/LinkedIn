class Home {

    static loadEvents() {

        let reactionButtons = document.querySelectorAll("a.reactionButton");
        for(let reactionButton of reactionButtons) {

            reactionButton.addEventListener("click", Home.react.bind(null));
        }
    }

    static processPostResponse(textArea,date) {
		
		if(this.readyState == 4) {
					
			if(this.status == 200) {
				
				let obj = JSON.parse(this.responseText);
				
				const userPhoto = document.querySelector("div#myData").getAttribute("data-user-picture");
				const userName = document.querySelector("div#myData").getAttribute("data-user-name");
				const userId = document.querySelector("div#myData").getAttribute("data-user-id");
		        let post = new Post(obj.content.CODIGO_PUBLICACION, new User(userId, userName, userPhoto), textArea.value, undefined, 0, 0,date,"null");
		
		        textArea.value = "";
		
		        let posts = document.querySelector("div#posts");
		
		        posts.insertBefore(post.getHTML(), posts.children[0]);
		
				let modal = bootstrap.Modal.getInstance(document.querySelector(`div#createPostModal`));
				modal.hide();
		
		        Home.loadEvents();
			}
		}
    }
	
	static send(textArea) {
		
		if(textArea.value === "") return;
		
		let now = new Date().toISOString().slice(0, 10);
		
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "controllers/create/post", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Home.processPostResponse.bind(xhr,textArea,now));
		xhr.send(`content=${textArea.value}&date=${now}`);
	}
	
	static postCommentProcessResponse(input, post) {
		
		if(this.readyState == 4) {
							
			if(this.status == 200) {
				
				if(JSON.parse(this.responseText).status) {
					
					let userPicture = document.querySelector("div#myData").getAttribute("data-user-picture");
					let name = document.querySelector("div#myData").getAttribute("data-user-name");
									
					// console.log(name);
		
					let comment = new Comment(null, null, name, userPicture, input.value);
		
					post.insertBefore(comment.getHTML(), post.children[5]);
		
					input.value = "";
				}
			}
		}
	}
	
	static postComment(content, post) {
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "controllers/post/comment", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Home.postCommentProcessResponse.bind(xhr, content, post));
		xhr.send(`content=${content.value}&post=${post.id.replace('post-','')}`);
	}

    static comment(e) {

        let post = document.querySelector(`div#${e.target.parentElement.parentElement.parentElement.id}`);

        let html = document.createElement("div");
        let input = document.createElement("input");
        let button = document.createElement("a");
        let img = document.createElement("img");

		let userPicture = document.querySelector("div#myData").getAttribute("data-user-picture");
        img.src = `assets/img/${userPicture}`;
        img.classList.add("profile-photo-comment", "mx-2");
        button.classList.add("btn");
        button.innerText = "Send";
        html.classList.add("my-2", "comments", "form-control", "d-flex", "justify-content-center", "align-items-center");
        input.classList.add("form-control");

        input.placeholder = "Comment";

        html.appendChild(img);
        html.appendChild(input);
        html.appendChild(button);
		
		button.addEventListener("click", Home.postComment.bind(null, input, post));

		/*
		button.addEventListener("click", () => {
	
			if(input.value != ""){
				
				let name = document.querySelector("div#myData").getAttribute("data-user-name");
				
				// console.log(name);
	
				let comment = new Comment(null, null, name, userPicture, input.value);
	
				post.insertBefore(comment.getHTML(), post.children[5]);
	
				input.value = "";
			}
		});
		*/
		
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
					
					if(comments[i].FOTO_PERFIL === "null") {
						
						comments[i].FOTO_PERFIL = "profile1.png";
					}

					let commentHTML = new Comment(
											comments[i].CODIGO_COMENTARIO,
											comments[i].CODIGO_COMENTARIO_SUPERIOR,
											comments[i].NOMBRE_USUARIO,
											comments[i].FOTO_PERFIL,
											comments[i].CONTENIDO
									);
									
					if(comments[i].CODIGO_COMENTARIO_SUPERIOR === "0") {
						
						post.appendChild(commentHTML.getHTML());
					} else {
						
						document.querySelector(`div#comment-${comments[i].CODIGO_COMENTARIO_SUPERIOR}`).appendChild(commentHTML.getHTML());
					}
				});
			}
		}
	}
	
	static setReaction(button, reaction) {
		
		if(reaction === "null") return;
		
		button.style.color = "#0d6efd";
		if(button.innerText === "Celebrar") button.style.color = "#198754";
        else if(button.innerText === "Apoyar") button.style.color = "#6f42c1";
        else if(button.innerText === "Encantar") button.style.color = "#dc3545";
        else if(button.innerText === "Interesar") button.style.color = "#ffc107";
        else if(button.innerText === "Hacer gracia") button.style.color = "#0dcaf0";
	}
	
	static loadReaction(post, reaction) {
		
		const a = post.children[post.children.length-1].children[0].children[0];
		
		Home.setReaction(a, reaction);
	}
	
	static processReactResponse(reactButton, target) {
		
		if(this.readyState == 4) {
							
			if(this.status == 200) {
				
				const obj = JSON.parse(this.responseText);
				
				if(obj.status) {
					Home.setReaction(reactButton, target);
				}
			}
		}
	}


    static react(e) {
		
		let post = e.target.parentElement.parentElement.parentElement.parentElement.id;
        let reactButton = e.target.parentElement.previousElementSibling;
        reactButton.innerText = `${e.target.innerText}`;
		
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "controllers/set/reaction", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Home.processReactResponse.bind(xhr, reactButton, e.target));
		xhr.send(`postId=${post.replace('post-','')}&reaction=${e.target.innerText}`);
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
				
				console.log(obj);
				
				if(obj.status) {
					
					const postsSection = document.querySelector("div#posts");
					
					let post;
					
					Object.keys(posts).forEach((i) => {
						
						let userPicture = posts[i].NOMBRE_FOTO_PERFIL;
						if(posts[i].NOMBRE_FOTO_PERFIL === "null") userPicture = "profile1.png";
						
						post = new Post(
							posts[i].CODIGO_PUBLICACION,
							new User(posts[i].CODIGO_USUARIO_SIGUIENDO, posts[i].USUARIO, userPicture),
							posts[i].CONTENIDO,
							undefined,
							posts[i].CANTIDAD_REACCIONES,
							posts[i].CANTIDAD_COMENTARIOS,
							posts[i].FECHA_PUBLICACION,
							posts[i].REACCION
						).getHTML();
					
						postsSection.appendChild(post);
					});
					
					Home.loadEvents();
					
					if(obj.PUESTO_ACTUAL != null) document.querySelector("p#currentUserJob").innerText = `${obj.PUESTO_ACTUAL}`;
					
					//
					const users = obj.USUARIOS_NO_SEGUIDOS;
					const addToFeed = document.querySelector("div#addToFeed");
					if(users) {
						
						Object.keys(users).forEach((i) => {
							
							let img = users[i].NOMBRE_FOTO_PERFIL;
							if(img === "null") img = "profile1.png";
							
							let description = users[i].DESCRIPCION;
							if(description === "null") description = "";
							
							addToFeed.appendChild(Home.userCard(users[i].CODIGO_USUARIO,users[i].NOMBRE_USUARIO,description,img));
						});
					}
				}
			}
		}
	}
	
	static userCard(userId, name, description, img) {
		
		let div = document.createElement("div");
		div.classList.add("card-body","pt-0");
		
		
		div.innerHTML =
			`<div class="d-flex mb-3">
				<img class="suggestions-logo me-3" src="assets/img/${img}">
			    <div>
			      <a href="profile.jsp?id=${userId}" class="text-decoration-none">
			        <span class="suggestions-name">
			          ${name}
			        </span>
			      </a>
			      <p class="mb-2 small">${description}</p>
			    </div>
			  </div>`;
						
		return div;
	}
}
