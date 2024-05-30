# Shipping pilot

Estamos en proceso de desarrollo de una aplicación para una empresa que cuenta con su propio depósito y flota de vehículos. A través de esta aplicación, se gestionan tanto los conductores como las rutas de los vehículos.

Los administradores son responsables de crear los perfiles de usuario para los conductores, permitiéndoles acceder a la información necesaria para llevar a cabo sus rutas de manera eficiente.

Además, los administradores también se encargarán de establecer las rutas y las visitas que los conductores realizarán.

Una vez que los conductores ingresen al sistema, podrán visualizar el listado de visitas programadas y completarlas de manera ordenada y eficaz.

En cuanto al pago de las rutas, este se efectuará por visita. Se ha establecido un valor fijo por visita, incentivando el éxito de las mismas mediante un sistema de bonificación. En caso de que la entrega no se realice según lo esperado, se abonará el 90% del valor fijo, mientras que en el caso de una entrega exitosa, se pagará el 120% del valor fijado.

## 🗞️ Historias de usuario

### Administradores

- Como administrador, quiero poder **crear perfiles de usuario** tanto para los conductores como administradores. 

- Como administrador, quiero poder **crear rutas, visitas y vehículos** para que los conductores puedan seguir un plan de trabajo definido.

- Como administrador, quiero poder **visualizar en tiempo real la ubicación de los vehículos**.

- Como administrador, quiero poder **visualizar en tiempo real el progreso de las rutas**. (OK!)

- Como administrador, quiero que se **calcule automáticamente los pagos de los conductores según el éxito de sus entregas**. (OK!)

- Como administrador, quiero poder **configurar los precios de las visitas**. (OK!)

- Como administrador, quiero poder **puntuar los conductores**.

- Como administrador, quiero poder **visualizar la valoración del conductor**.

### Conductores

- Como conductor, quiero poder **visualizar el listado de visitas programadas para el día**. (OK!)

- Como conductor, quiero poder **visualizar el vehículo asignado para el día**. (OK!)

- Como conductor, quiero poder **iniciar visitas**. (OK!)

- Como conductor, quiero poder **finalizar visitas**. (OK!)

- Como conductor, quiero poder **registrarportar cualquier problema o incidencia durante la entrega**.

- Como conductor, quiero poder **visualizar las ganancias del recorrido**. (OK!)

- Como conductor, quiero poder **escanear los paquetes** antes de finalizar la visita.

- Como conductor, quiero poder **ingresar un código de seguridad** para validar que el receptor sea realmente el comprador.

### Usuario (Administradores y Conductores)

- Como usuario, quiero poder **autenticarme en la aplicación** para hacer uso de la misma.

- Como usuario, quiero poder **editar los datos personales**. (OK!)

## 📰 Documentación

<details>
  <summary>Arquitectura</summary>
  <br/>

  La estructura de carpetas en una aplicación es fundamental para la organización y el mantenimiento eficiente del código. A continuación, se detalla la estructura de carpetas utilizada en esta aplicación:

  ```
    -- lib
      -- core
      -- db
      -- models
      -- pages
      -- providers
      -- services
      -- widgets
  ```

  ### Core
  
  **navigation:** Configuración de la navegación de la aplicación, incluyendo rutas y enrutadores.

  **theme:** Definición de estilos y temas aplicados en toda la aplicación.

  ### DB (Database) 
  
  Mockup de la base de datos alojada en firebase.

  ### Models
  
  Modelos de datos que representan la estructura de los datos utilizados en la aplicación.

  ### Pages
  
  Este directorio alberga todas las pantallas de la aplicación. Cada pantalla debe tener su propia carpeta, donde se incluyen los widgets específicos de esa pantalla, organizados por entidad.

  ### Providers
  
  Implementaciones específicas para gestionar el estado de la aplicación. En este caso, se utiliza la librería Riverpod.

  ### Services

  **api:** Lógica para interactuar con servicios web o APIs.
    
  **storage:** Lógica para gestionar el almacenamiento local, como SharedPreferences o bases de datos locales.

  ### Widgets
  
  En este directorio se encuentran los widgets genéricos que pueden ser utilizados en cualquier pantalla de la aplicación, organizados por tipo.
</details>

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
    - Id del recorrido `travel_id`
    - Posición de la visita en el recorrido `travel_index`

  - VisitStats
    - Cantidad de paquetes `packages_count`
    - ETA de la visita `eta`
</details>

<details>
  <summary>Tipos de usuarios</summary>
  <br/>
  
  **Administradores:** Este tipo de usuario tiene privilegios más amplios y capacidades de gestión avanzadas. Sus responsabilidades principales incluyen la creación y gestión de rutas, asignación de conductores a rutas específicas, programación de visitas, seguimiento del progreso de las entregas, gestión de pagos, entre otras tareas administrativas relacionadas con la operación logística de la empresa.

  **Conductores:** Los conductores son usuarios que operan en el terreno y están encargados de llevar a cabo las entregas según las rutas y visitas asignadas por los administradores. Su función principal es registrar el progreso de las visitas, incluida la confirmación de entregas exitosas, actualización del estado de las visitas en tiempo real, reporte de problemas o incidencias, entre otras actividades operativas relacionadas con la logística de transporte y entrega.
</details>

## Fuera del MVP
  - Agregar Pais y Ciudad en al dirección.
  - Agregar valoración del conductor.
  - Agregarle foto al usuario.
  - Pantallas del administrador.
  - Agregar lectura de QR de los paquetes antes de entregarlo al comprador.
  - Ingresar codigo de seguridad para entregar el paquete.
