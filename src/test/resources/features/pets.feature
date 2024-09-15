Feature: Test pagina tienda de mascotas

  Background:
    * def urlBase = 'https://petstore.swagger.io/v2/'
    * def addPet = 'pet'
    * def dataPet = 'pet/'
    * def findStatus = 'findByStatus'

  Scenario Outline: Crear una nueva mascota
    Given url urlBase + addPet
    And request {'id': '#(id)','name': '#(name)','photoUrls': ['#(pathImg)'],'status': 'available'}
    When method POST
    * print response
    Then status 200
    Examples:
      | read('pet.csv') |

  Scenario Outline: Buscar una mascota por ID
    Given url urlBase + dataPet + <id>
    When method GET
    * print response
    Then status 200
    Examples:
      | read('pet.csv') |

  Scenario Outline: Actualizar nombre y estado de mascota
    * def fields = { name: '#(newName)', status: '#(status)'}
    Given url urlBase + dataPet + <id>
    * form fields fields
    When method POST
    * print response
    Then status 200
    Examples:
      | read('pet.csv') |

  Scenario Outline: Consultar mascota por status
    Given url urlBase + dataPet + findStatus
    * param status = 'sold'
    When method GET
    * print response
    Then status 200
    Examples:
      | read('pet.csv') |

