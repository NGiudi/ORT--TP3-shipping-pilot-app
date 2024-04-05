# Shipping pilot

Estamos en proceso de desarrollo de una aplicación para una empresa que cuenta con su propio depósito y flota de vehículos. A través de esta aplicación, se gestionan tanto los conductores como las rutas de los vehículos.

Los administradores son responsables de crear los perfiles de usuario para los conductores, permitiéndoles acceder a la información necesaria para llevar a cabo sus rutas de manera eficiente.

Además, los administradores también se encargarán de establecer las rutas y las visitas que los conductores realizarán.

Una vez que los conductores ingresen al sistema, podrán visualizar el listado de visitas programadas y completarlas de manera ordenada y eficaz.

En cuanto al pago de las rutas, este se efectuará por visita. Se ha establecido un valor fijo por visita, incentivando el éxito de las mismas mediante un sistema de bonificación. En caso de que la entrega no se realice según lo esperado, se abonará el 90% del valor fijo, mientras que en el caso de una entrega exitosa, se pagará el 120% del valor fijado.

## Pantallas

**Pantalla de Inicio de Sesión:** Esta pantalla permitirá a los usuarios iniciar sesión con sus credenciales para acceder a la aplicación.

**Pantalla de Lista de Visitas:** Esta pantalla mostrará una lista de visitas programadas para la ruta del conductor logueado.

**Pantalla de Detalles de Visita:** Al hacer clic en una visita específica, podrán ver detalles más detallados, como la dirección exacta, los paquetes a entregar, las instrucciones especiales del cliente, etc.

**Pantalla de Perfil de Usuario:** Esta pantalla permitirá a los usuarios ver y editar su información personal, como nombre, dirección, información de contacto, etc.

## Tipos de usuarios

**Administradores:** Este tipo de usuario tiene privilegios más amplios y capacidades de gestión avanzadas. Sus responsabilidades principales incluyen la creación y gestión de rutas, asignación de conductores a rutas específicas, programación de visitas, seguimiento del progreso de las entregas, gestión de pagos, entre otras tareas administrativas relacionadas con la operación logística de la empresa.

**Conductores:** Los conductores son usuarios que operan en el terreno y están encargados de llevar a cabo las entregas según las rutas y visitas asignadas por los administradores. Su función principal es registrar el progreso de las visitas, incluida la confirmación de entregas exitosas, actualización del estado de las visitas en tiempo real, reporte de problemas o incidencias, entre otras actividades operativas relacionadas con la logística de transporte y entrega.

## Entidades

- Address
  - Id
  - Barrio
  - Calle
  - Altura
  - Piso
  - Departamento
  - Código Postal
  - Observaciones

- Person
  - Id
  - Nombre
  - Apellido
  - DNI
  - Telefono

- User
  - Id
  - Persona (Person)
  - Password
  - Email
  - Rol (admin / driver)

- Vehicle
  - Color
  - Patente
  - Modelo
  - Marca
  - Tipo

- Visit
  - ID
  - Dirección (Address)
  - Comprador (Person)
  - Conductor (User)
  - Estado (Exitosa / Fallida / En curso)
  - Cantidad de paquetes.
  - Lista de ids de los paquetes.
  - Precio visita. (devuelve un valor según el estado)

- Route
  - Auto (Vehicle)
  - Estado (Nueva / En Curso / Finalizada)
  - Lista de visitas
  - Precio estimado (cantidad vistas * precio fijo por visita).
  - Precio final

## Fuera del MVP
  - Agregar Pais  y Ciudad en al dirección.
  - Agregar valoración del conductor.
  - Agregarle foto al usuario.
  - Pantallas del administrador.