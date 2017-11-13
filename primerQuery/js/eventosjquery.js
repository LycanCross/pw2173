// "jquery" es lo mismo que "$"

var inicia = function()
{
	var nuevo = function()
	{
		//JSON= JavaScript Object Notation
		$.ajax
		({
		  url: 'https://randomuser.me/api/',
	 	  dataType: 'json',
	 	  success: function(data) 
	 	  {
		 	//alert(data.results[0].name.first+" "+data.results[0].name.last);
		     //console.log(data);
		     $("#nombre").html("Nombre: "+data.results[0].name.first+" "+
		       				 data.results[0].name.last);
		     $("#foto").attr("src",data.results[0].picture.large);
		     $("#email").html("E-Mail: "+data.results[0].email);
		     $("#dob").html("Fecha de nacimiento: "+data.results[0].dob);
		     $("#direccion").html("Dirección: "+data.results[0].location.street);
		     $("#telefono").html("Telefono: "+data.results[0].phone);
		     $("#password").html("Contraseña: "+data.results[0].login.password);
		  	  }
		});
	}
	//alert("Lista la paágina");
		$("#btnNuevo").on("click",nuevo);
}
//Iniciamos JQuery cuando la pagina está lista ejecuta la función inicia.
$(document).ready(inicia);