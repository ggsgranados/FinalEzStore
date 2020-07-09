/*Script by ggsgranados*/
<?php
	include ("conexion.php");
    $destino= $_POST["Email"];
    $nombre= $_POST["Name"];
    $contra= $_POST["Password"];
    $contra2= $_POST["Password2"];
    if ($contra==$contra2) {
    	try {

    $pass_cifrado=password_hash($contra, PASSWORD_DEFAULT);
	$sql="INSERT INTO usuario(nombre, email, password) VALUES ('$nombre','$destino','$pass_cifrado')";
	$result=mysqli_query($conexion,$sql);


	//NECESITO UN SCRIPT QUE DIGA REGISTRO EXITOSO
    /*mail($destino,"Registro en EzStore","Saludos " .$nombre .".\n\n
Es un gusto que te hayas registrado en EzStore.\n
Esperamos que encuentres todo lo que necesites\n\n
Atte.\n
El equipo de EzStore.\n
Tus compras son Ez!");*/
header("Location:index.html");
      	
      } catch (Exception $e) {
        header("Location:index.html");
      	//NECESITO UN SCRIPT QUE DIGA USUARIO EXISTENTE
      }
    }
    else{
      header("Location:index.html");
    	//NECESITO UN SCRIPT QUE DIGA PASSWORD NO COINCIDEEN
    }
   header("Location:index.html");   
  mysqli_close($conexion);  
?>