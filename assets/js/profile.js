let contactInfo = document.querySelector("a#contactInfo");
contactInfo.addEventListener("click", e => {

    let modal = new bootstrap.Modal(document.querySelector(`div#${e.target.id}Modal`));
    modal.show();
})
