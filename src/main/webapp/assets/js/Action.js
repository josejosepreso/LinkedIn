/**
 * 
 */

class Action {
	
	static showModal(e) {

	    let element = document.querySelector(`div#${e.target.id}Modal`);

	    let modal = new bootstrap.Modal(element);

	    modal.show();
	}
}