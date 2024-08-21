class Post {

    constructor(postId, user, contentText, img, reactions, comments, date, reacted) {

		this.postId = postId;
		this.user = user;
        this.contentText = contentText;
        this.img = img;
		this.reactions = reactions;
		this.comments = comments;
		this.date = date;
		this.reacted = reacted;
    }

    interactionButtons() {

        return `
            <div class="d-flex px-5 justify-content-between my-1">
                 <button type="button" class="interaction-buttons py-2  d-flex justify-content-center flex-wrap" aria-expanded="false">
                   <a style="color:black" class="reactButton dropdown-toggle" data-bs-toggle="dropdown">${this.reacted === "null" ? "Recomendar" : this.reacted}</a>
                   <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                     <a class="reactionButton dropdown-item">Recomendar</a>
                     <a class="reactionButton dropdown-item">Celebrar</a>
                     <a class="reactionButton dropdown-item">Apoyar</a>
                     <a class="reactionButton dropdown-item">Encantar</a>
                     <a class="reactionButton dropdown-item">Interesar</a>
                     <a class="reactionButton dropdown-item">Hacer gracia</a>
                   </div>
                 </button>
               <button class="interaction-buttons">
                 <a class="text-black" style="cursor:pointer;">Comentar</a>
               </button>
               
            </div>
        `;
    }

    header() {

        return `
			<div class="px-3 my-2 d-flex justify-content-between align-items-center">
				<div>
					<img class="me-2 post-profile-photo" src="assets/img/${this.user.img}">
					<a class="text-dark fw-bold" href="profile.jsp?id=${this.user.id}">${this.user.name}</a>
				</div>
				<small>${this.date}</small>
			</div>
        `;
    }

    content() {

        return `
              <div class="px-3 mt-3">
                <p class="post-content main-text">
                  ${this.contentText}
                </p>
              </div>
              ${this.img === undefined ? "" : this.addImg()}
        `;
    }

    addImg() {

        return `
            <div class="postPicture">
                <img src="${this.img}" class="w-100">
            </div>
        `;
    }

    footer() {

        return `
              <div class="d-flex align-items-center border-bottom px-3 p-1 mb-2 justify-content-between">

                <div class="d-flex align-items-center">
                  <p class="m-0 small-font-size">
                    ${this.reactions} Reacciones
                  </p>
                </div>

                <div class="d-flex justify-content-end text-center">
                  <p class="m-0 small-font-size">${this.comments} Comentarios</p>
                </div>

              </div>
        `;
    }

    getHTML() {

        let html = document.createElement("div");
        html.classList.add("bg-white", "my-3", "py-2", "posts");
        html.id = 'post-' + this.postId;

        html.innerHTML += this.header();
        html.innerHTML += this.content();
        html.innerHTML += this.footer();
        html.innerHTML += this.interactionButtons();

        let commentButton = html.children[html.children.length-1].children[1].children[0];
        commentButton.addEventListener("click", Home.comment.bind(null), { once:true });
		
		Home.setReaction(html,this.reacted);

        return html;
    }
}
