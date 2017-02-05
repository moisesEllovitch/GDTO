// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


/* Why to use Timing Event here?

Because onload had a problem. The page still use application (same page) even if I changed page.
So I would have to refresh every time.

*/
window.setInterval(main, 1000)

function main(){

	if (document.getElementById("form_user")){
		formFeatured("form_user")
		validateForm("form_user")
	} 

	if (document.getElementById("login_form")){
		formFeatured("login_form")
	}

	tecnologies()
}


function tecnologies(){
	var tecnologies = document.getElementById("tecnologies")
	var tecnologies_down = document.getElementById("tecnologies_down")

	tecnologies.onclick = function(){
		if(tecnologies.classList.contains("active_tecnologies")){
			tecnologies.classList.remove("active_tecnologies");
			tecnologies_down.classList.remove("active_tecnologies_down");
		} else {
			tecnologies.classList.add("active_tecnologies");
			tecnologies_down.classList.add("active_tecnologies_down");	
		}
	}
}


function validateForm(form_id){
	var form = document.getElementById(form_id)
	//console.log(form)

	form.onsubmit = function(){
		var re_email = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
		var re_pass = /^[A-Za-z]\w{4,}$/

		if (!re_email.test(email.value)) {
			console.log("Invalid email");
			return false
		} else if (!re_pass.test(pwd.value)) {
			console.log("Invalid Password")
			return false
		} else	{
			console.log("Validation successfull")
			return true
		}	
	}
}

// set a style on a Sign Up and Login form when mouse over.
function formFeatured(form_id){
	var inputs = document.getElementsByClassName("js-style-featured")

	document.getElementById(form_id).onmouseover = function(){
		for (var i = 0; i < inputs.length; i++) {
			//console.log('obj.' + i, '=', inputs[i]);
			inputs[i].style.boxShadow = "0px 0px 30px #272626"
		}
	}

	document.getElementById(form_id).onmouseout = function(){
		for (var i = 0; i < inputs.length; i++) {
			//console.log('obj.' + i, '=', inputs[i]);
			inputs[i].style.boxShadow = ""
		}
	}
}
