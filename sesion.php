
<?php
	include ("conexion.php");
	$correo = $_POST["Email"];
	$pass= $_POST["Password"];
	// MOVER A UN TRY CATCH
	try{
	$sql="SELECT password FROM `usuario` WHERE email = '$correo'";
	$result=mysqli_query($conexion,$sql);
	if ($result) {
		
		$row= $result->fetch_array();
		if (password_verify($pass,$row['password'])) {
			
			$actual = $correo;
			//include_once 'index2.html';
			header("Location:index2.html");
		}
		else{

        $errorLogin="Usuario y/o password invalido";
        //include_once 'index.html';
        header("Location:index.html");
		}
	} 
	else {
		//NECESITO UN SCRIPT QUE DIGA FALLO DE INICIO DE SESION
		
		

        $errorLogin="Usuario y/o password invalido";
        //include_once 'index.html';
        header("Location:index.html");
	}
}
catch(Exception $e){


        $errorLogin="Usuario y/o password invalido";
        //include_once 'index.html';
        header("Location:index.html");
}
mysqli_close($conexion);


?>