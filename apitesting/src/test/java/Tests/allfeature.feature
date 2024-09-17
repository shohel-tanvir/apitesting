Feature: API Testing

Scenario: Create Pet
    Given url 'https://petstore.swagger.io/v2/pet'
    And request { "id": 12345, "name": "Cat", "status": "available" }
    When method post
    Then status 200
    And match response.id == 12345
    And match response.name == 'Cat'
    And match response.status == 'available'

Scenario: Get Pet
    Given url 'https://petstore.swagger.io/v2/pet/12345'
    When method get
    Then status 200
    And match response.id == 12345
    And match response.name == 'Cat'
    And match response.status == 'available'

Scenario: Update Pet
    Given url 'https://petstore.swagger.io/v2/pet'
    And request { "id": 12345, "name": "Cat", "status": "sold" }
    When method put
    Then status 200
    And match response.id == 12345
    And match response.name == 'Cat'
    And match response.status == 'sold'

Scenario: Delete Pet
    Given url 'https://petstore.swagger.io/v2/pet/12345'
    When method delete
    Then status 200
    And match response.message == 'Pet deleted successfully'

Scenario: Get Non-Existing Pet
    Given url 'https://petstore.swagger.io/v2/pet/99999'
    When method get
    Then status 404
    And match response.message == 'Pet not found'