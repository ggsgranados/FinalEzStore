/*Script by ggsgranados */
<?php
    $destino= "gg.sgranados@gmail.com";
    $nombre= $_POST["Name"];
    $correo= $_POST["Email"];
    $telefono= $_POST["Telephone"];
    $mensaje= $_POST["message"];  
    mail($destino,"Contactanos EzStore","
Nombre: " . $nombre . 
"\nCorreo: " .$correo .
".\nTelefono: " .$telefono .
".\n\nMensaje: \n" .$mensaje);
    header("Location:mail.html");
?>