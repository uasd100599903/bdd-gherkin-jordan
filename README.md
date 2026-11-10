# Práctica 5.2 - Pruebas BDD con Gherkin

Nombre: Jordany Sosa
Matrícula: 100599903
Sección: INF5170-1
Asignatura: Lab Lenguaje de Programación III

## Funcionalidad principal
Elegí el menú dinámico del Banco Futuro que hice en una tarea anterior. La funcionalidad es que el menú se carga desde `menu.json` y que el usuario puede abrir submenús, agregar opciones con un formulario y eliminarlas.

## Qué es BDD y Gherkin
BDD (Behavior Driven Development) es una forma de describir cómo debe comportarse una aplicación usando frases fáciles de entender. Gherkin es el lenguaje que se usa para escribirlas, con esta estructura:

- **Given** (dado): la situación de inicio.
- **When** (cuando): la acción que hace el usuario.
- **Then** (entonces): el resultado que se espera.
- **And** (y): para agregar más pasos.

## Archivo con los escenarios
`features/menu_dinamico.feature`

Escribí solo los escenarios (documentación), que es una de las opciones que permite la práctica.

## Escenarios y qué valida cada uno

| N.º | Escenario | Tipo | Qué valida |
|---|---|---|---|
| 1 | El menú se carga desde el archivo JSON | Exitoso | Que el menú se dibuje con los 6 datos de `menu.json`. |
| 2 | El usuario abre un submenú y ve su contenido | Exitoso | Que al hacer clic se despliegue el submenú y se muestre el texto de la opción. |
| 3 | El usuario agrega una opción nueva con datos correctos | Exitoso | Que el formulario agregue la opción y el menú se actualice sin recargar. |
| 4 | El usuario intenta agregar una opción con un ID repetido | Error | Que no se permitan IDs duplicados y se muestre un mensaje. |
| 5 | El usuario intenta agregar una opción con un enlace inválido | Error | Que solo se acepten enlaces que empiecen con # o http(s):// . |
| 6 | El usuario elimina una opción del menú | Exitoso | Que el botón Eliminar quite la opción del menú. |
| 7 | El archivo JSON no está disponible | Error | Que la página avise con un mensaje si no puede leer `menu.json`. |

Son 7 escenarios: 4 exitosos y 3 de error.

## Relación con las pruebas anteriores
Varios de estos escenarios son los mismos que probé automáticamente con Playwright en la práctica 5.1. La diferencia es que aquí están escritos en lenguaje normal, para que cualquier persona los pueda entender.
