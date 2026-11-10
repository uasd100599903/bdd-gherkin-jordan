Feature: Menú dinámico del Banco Futuro
  Como cliente del banco
  quiero ver un menú cargado desde un archivo JSON
  para encontrar las opciones del banco y poder agregar o quitar opciones

  Background:
    Given que el usuario abre la página del Banco Futuro
    And el archivo "menu.json" está disponible

  # Valida que el menú se dibuja con los datos del JSON
  Scenario: El menú se carga desde el archivo JSON
    When la página termina de cargar
    Then el menú muestra 6 opciones principales
    And el menú incluye las opciones "Cuentas" y "Préstamos"
    And se muestra el texto de la opción "Inicio"

  # Valida que los submenús y el contenido responden al clic
  Scenario: El usuario abre un submenú y ve su contenido
    Given que el submenú "Cuenta de ahorro" está oculto
    When el usuario hace clic en la opción "Cuentas"
    And el usuario hace clic en la opción "Cuenta de ahorro"
    Then el submenú "Cuenta de ahorro" es visible
    And el contenido muestra el título "Cuenta de ahorro"

  # Valida el caso exitoso al agregar una opción con el formulario
  Scenario: El usuario agrega una opción nueva con datos correctos
    When el usuario escribe el ID "seguros" y el nombre "Seguros"
    And el usuario escribe el enlace "#seguros"
    And el usuario pulsa el botón "Agregar"
    Then se muestra el mensaje "Opción agregada."
    And el menú muestra 7 opciones principales
    And la opción "Seguros" aparece en el menú sin recargar la página

  # Valida el caso de error cuando el ID ya existe
  Scenario: El usuario intenta agregar una opción con un ID repetido
    When el usuario escribe el ID "inicio" y el nombre "Otra"
    And el usuario escribe el enlace "#otra"
    And el usuario pulsa el botón "Agregar"
    Then se muestra el mensaje "Ese ID ya existe, usa otro."
    And el menú sigue mostrando 6 opciones principales

  # Valida el caso de error cuando el enlace no es válido
  Scenario: El usuario intenta agregar una opción con un enlace inválido
    When el usuario escribe el ID "nueva" y el nombre "Nueva"
    And el usuario escribe el enlace "hola"
    And el usuario pulsa el botón "Agregar"
    Then se muestra el mensaje "El enlace debe empezar con # o con http(s)://"
    And el menú sigue mostrando 6 opciones principales

  # Valida que se puede eliminar una opción del menú
  Scenario: El usuario elimina una opción del menú
    When el usuario pulsa el botón "Eliminar" de la opción "contacto"
    Then el menú muestra 5 opciones principales
    And la opción "Contacto" ya no aparece en el menú

  # Valida el caso de error cuando no se puede leer el JSON
  Scenario: El archivo JSON no está disponible
    Given que el archivo "menu.json" no se puede leer
    When la página termina de cargar
    Then se muestra el mensaje "No se pudo cargar menu.json"
    And el menú queda vacío
