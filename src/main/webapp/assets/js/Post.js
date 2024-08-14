class Post {

    constructor(postId, user, contentText, img, reactions) {

		this.user = user;
        this.postId = postId;
        this.contentText = contentText;
        this.img = img;
		this.reactions = reactions;
    }

    interactionButtons() {

        return `
            <div class="d-flex px-3 justify-content-between my-2">
                 <button type="button" class="interaction-buttons py-2 px-4 d-flex justify-content-center flex-wrap" aria-expanded="false">
                   <a style="color:black" class="reactButton dropdown-toggle" data-bs-toggle="dropdown">Like</a>
                   <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                     <a class="reactionButton dropdown-item">Like</a>
                     <a class="reactionButton dropdown-item">Celebrate</a>
                     <a class="reactionButton dropdown-item">Support</a>
                     <a class="reactionButton dropdown-item">Love</a>
                     <a class="reactionButton dropdown-item">Insightful</a>
                     <a class="reactionButton dropdown-item">Funny</a>
                   </div>
                 </button>
               <button class="interaction-buttons py-2 px-4">
                 <a class="text-black" style="cursor:pointer;">Comment</a>
               </button>
               <button class="interaction-buttons py-2 px-4">
                 <a class="text-black">Repost</a>
               </button>
            </div>
        `;
    }

    header() {

        return `
              <div class="d-flex px-3 mb-2 justify-content-between align-items-center">
                <div class="d-flex align-items-center">
                  <img class="me-2 post-profile-photo" src="assets/img/${this.user.img}">
                  <div>
                    <div class="d-flex my-3">
                      <a class="me-1 text-dark fw-bold" href="profile.jsp?id=${this.user.id}">${this.user.name}</a>
                    </div>
                  </div>
                </div>
              </div>
        `;
    }

    content() {

        return `
              <div class="px-3">
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
                    ${this.reactions} Reactions
                  </p>
                </div>

                <div class="d-flex justify-content-end text-center">
                  <p class="m-0 small-font-size">3 Comments</p>
                </div>

              </div>
        `;
    }

    getHTML() {

        let html = document.createElement("div");
        html.classList.add("bg-white", "my-3", "py-2", "posts");
        html.id = "post-" + this.postId;

        html.innerHTML += this.header();
        html.innerHTML += this.content();
        html.innerHTML += this.footer();
        html.innerHTML += this.interactionButtons();

        let commentButton = html.children[html.children.length-1].children[1].children[0];
        commentButton.addEventListener("click", Home.comment.bind(null), { once:true });

        return html;
    }
}
