class Comment {

	constructor(user, img, content) {

		this.user = user;
		this.img = img;
		this.content = content;
	}

	getHTML() {

		let html = document.createElement("div");
		html.classList.add("form-control", "d-flex");

		let img = document.createElement("img");
		img.src = `assets/img/${this.img}`;
        img.classList.add("profile-photo-comment", "me-3");

		let span = document.createElement("span");
		span.style.width = "80%";
		span.innerHTML = `
			<a class="fw-bold text-black" href="profile.jsp?id=this.user">${this.user}</a>
			<p class="small">${this.content}</p>
			<p class="small"><a style="cursor:pointer;">Like</a> <a style="cursor:pointer">Reply</a></p>
		`;

		html.appendChild(img);
		html.appendChild(span);

		return html;
	}
}
