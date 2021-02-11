# ExameniOSBA
Examen vacante iOS Banco Azteca 

4.- Explique el ciclo de vida de un view controller.

       1. ViewDidLoad: Ciclo inicial, se encarga de cargar las vistas en memoria.                            
       2. ViewWillApper: La vista esta por aparecer en pantalla, se pueden actualizar elementos.                    
       3. ViewDidApper: Cuando la vista ya esta en pantalla, momento para mandar mensajes, animaciones, notificaciones.        
            1. didReceiveMemoryWarning: el sistema puede llamar cuando se este agotando la memoria, momento para respaldar.
       4. ViewWillDisappear: Cuando se desaparecerá la vista, se guarda el estado de la vista.
       5. ViewDidDissapear: Eliminar o poner variables pesadas en nil.
            1.Si se sigue recibiendo didReceiveMemoryWarning el sistema lo pondrá en nil, en caso de requerirla de nuevo se    
            tendrá que cargar de nuevo completa.

5.- Explique el ciclo de vida de una aplicación.

      1. Not runnig: No se ha desplegado la app
      2. Inactive: La aplicación se ha ejecutado pero no ha recibido interacción del usuario.
      3. Active: El usuario esta interactuando con ella.
      4. Background: La aplicación esta desplegando código background como descargas, actualizaciones, etc. 
      5. Suspended.

Analizar las siguientes capturas de pantalla y justificar tu respuesta :

      Al iniciar una app, la definicion en color amarillo es la primera en cargar a la memoria,   
      al ejecutar ViewDidLoad el color a presentar seria rojo.

