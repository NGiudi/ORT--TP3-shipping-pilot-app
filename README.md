# Shipping pilot

Estamos en proceso de desarrollo de una aplicación para una empresa que cuenta con su propio depósito y flota de vehículos. A través de esta aplicación, se gestionan tanto los conductores como las rutas de los vehículos.

Los administradores son responsables de crear los perfiles de usuario para los conductores, permitiéndoles acceder a la información necesaria para llevar a cabo sus rutas de manera eficiente.

Además, los administradores también se encargarán de establecer las rutas y las visitas que los conductores realizarán.

Una vez que los conductores ingresen al sistema, podrán visualizar el listado de visitas programadas y completarlas de manera ordenada y eficaz.

En cuanto al pago de las rutas, este se efectuará por visita. Se ha establecido un valor fijo por visita, incentivando el éxito de las mismas mediante un sistema de bonificación. En caso de que la entrega no se realice según lo esperado, se abonará el 90% del valor fijo, mientras que en el caso de una entrega exitosa, se pagará el 120% del valor fijado.

OBS: mientras la ruta no este finalizada, el precio es estimado. Luego al finalizar la ruta se calcula el monto a pagar.
OBS: mientras la visita no este en un estado final (Exitosa o Fallida), el precio es estimado. Luego al finalizar la visata se calcula el monto a pagar.

## Pantallas

### Pantalla de Inicio de Sesión

Esta pantalla permitirá a los usuarios iniciar sesión con sus credenciales para acceder a la aplicación.

### Pantalla de Lista de Visitas

Esta pantalla mostrará una lista de visitas programadas para la ruta del conductor logueado.

## Pantalla de Detalles de Visita

Al hacer clic en una visita específica, podrán ver detalles más detallados, como la dirección exacta, los paquetes a entregar, las instrucciones especiales del cliente, etc.

Inicialmente, en la parte inferior, habrá un botón para iniciar una visita. Una vez llegado al domicilio del comprador, podrá finalizar la visita, marcándola como entregada o no entregada. En ambos casos, se proporcionará un formulario para completar. En el caso de una visita fallida, se requerirá especificar la razón del fallo. Si la visita se marca como entregada, se deberán completar los datos de la persona que recibió el pedido.

**Pantalla de Perfil de Usuario:** Esta pantalla permitirá a los usuarios ver y editar su información personal, como nombre, dirección, información de contacto, etc.

## Tipos de usuarios

**Administradores:** Este tipo de usuario tiene privilegios más amplios y capacidades de gestión avanzadas. Sus responsabilidades principales incluyen la creación y gestión de rutas, asignación de conductores a rutas específicas, programación de visitas, seguimiento del progreso de las entregas, gestión de pagos, entre otras tareas administrativas relacionadas con la operación logística de la empresa.

**Conductores:** Los conductores son usuarios que operan en el terreno y están encargados de llevar a cabo las entregas según las rutas y visitas asignadas por los administradores. Su función principal es registrar el progreso de las visitas, incluida la confirmación de entregas exitosas, actualización del estado de las visitas en tiempo real, reporte de problemas o incidencias, entre otras actividades operativas relacionadas con la logística de transporte y entrega.

## Dcumentación

<details>
  <summary>Entidades</summary>
  
  - Address
    - Barrio `district`
    - Calle `street_name`
    - Altura `street_number`
    - Piso `floor`
    - Departamento `unit`
    - Código Postal `zip_code`
    - Observaciones `observations`

  - Client
    - Dirección `Address` 
    - Nombre `name`
    - Apellido `last_name`
    - DNI `doc_number`
    - Telefono `phone`

  - Travel
    - Conductor `User.doc_number`
    - Estado `status` (Nueva / En Curso / Finalizada)
    - Precio `price`
    - Stats `TravelStats`
    - Vehículo `Vehicle.license_plate`
   
  - TravelStats 
    - Cantidad de paquetes `packages_count`
    - Cantidad de visitas `visits_count`
    - ETA del recorrido `eta`
  
  - User `key=doc_number`
    - Apellido `last_name`
    - Email `email`
    - Foto `photo_url`
    - Nombre `name`
    - Password `password`
    - Rol `role` (admin / driver)
    - Telefono `phone`

  - Vehicle `key=license_plate`
    - Color `color`
    - Marca `brand`
    - Modelo `model`
    - Tipo `type`

  - Visit
    - Comprador `Client`
    - Estado `status` (Nueva / Exitosa / Fallida / En curso)
    - Stats `VisitStats`
    - Lista de ids de los paquetes `packages`
    - Precio `price`

  - VisitStats
    - Cantidad de paquetes `packages_count`
    - ETA de la visita `eta`
</details>

## Fuera del MVP
  - Agregar Pais y Ciudad en al dirección.
  - Agregar valoración del conductor.
  - Agregarle foto al usuario.
  - Pantallas del administrador.
  - Agregar lectura de QR de los paquetes antes de entregarlo al comprador.
  - Ingresar codigo de seguridad para entregar el paquete.


## TODOs
  - [ ] Cuando se inicia la visita, se sigue mostrando el botón de "iniciar visita" cuando debería mostrarse el botón de "finalizar visita".
  - [ ] Cuando la visita pasa en curso, no se muestra el badge de "En curso".
  - [ ] Solo se debe permitir ver el detalle de la primer visita en estado new.
