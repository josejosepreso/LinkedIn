/**
 * 
 */

class Register {
	
	static loadPlaces(places) {
		
		let obj = JSON.parse(places);
		
		const selectB = document.querySelector("select#pBirth");
		const selectR = document.querySelector("select#residence");
		
		Object.keys(obj).forEach((i) => {
			
			selectB.innerHTML += `<option value="${obj[i].NOMBRE_LUGAR}">${obj[i].NOMBRE_LUGAR}, ${obj[i].LUGAR_SUPERIOR}, ${obj[i].LUGAR_SUPER_SUPERIOR}</option>`;
			selectR.innerHTML += `<option value="${obj[i].NOMBRE_LUGAR}">${obj[i].NOMBRE_LUGAR}, ${obj[i].LUGAR_SUPERIOR}, ${obj[i].LUGAR_SUPER_SUPERIOR}</option>`;
		});
	}
	
	static send(name, lastName, email, password, pBirth, residence, phone, dateB) {
		
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "controllers/register", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Register.processResponse.bind(xhr));
		xhr.send(Register.formData(name, lastName, email, password, pBirth, residence, phone, dateB));
	}
	
	static processResponse() {
		
		if(this.readyState == 4) {
			
			if(this.status == 200) {
				
				let obj = JSON.parse(this.responseText);
				
				const answer = document.querySelector('div#answer');
				
				if(obj.status) {
									
					answer.classList.remove('text-danger');
					answer.classList.add('text-success');
				} else {
					
					answer.classList.remove('text-success');
					answer.classList.add('text-danger');
				}
				
				answer.innerHTML = `${obj.content}`;
				
				if(obj.status) window.location.replace("http://localhost:8080/LinkedIn/login.jsp");
			}
		}
	}
	
	static formData(name, lastName, email, password, pBirth, residence, phone, dateB){
		
		let now = new Date().toISOString().slice(0, 10);
		
		let list = [];
		list.push(`name=${name.value}`);
		list.push(`lastName=${lastName.value}`);
		list.push(`email=${email.value}`);
		list.push(`password=${password.value}`);
		list.push(`pBirth=${pBirth.value}`);
		list.push(`residence=${residence.value}`);
		list.push(`phone=${phone.value}`);
		list.push(`dateB=${dateB.value}`);
		list.push(`registrationDate=${now}`);
		list.push(`profilePhoto=null`);
		
		return list.join("&");
	}
}