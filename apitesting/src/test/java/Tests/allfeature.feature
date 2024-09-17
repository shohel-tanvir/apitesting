@tag
Feature: Simple api test

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read("test.json")

  Scenario: Test a Simple GET API
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.data[1].first_name != null
    And assert response.data.length == 6
    And match response.data[0].id == 7
    And match response.data[0].first_name == "Michael"

  Scenario: Test a Simple POST API
    Given path '/users'
    And request {"name": "Tanvir","job": "Lecturer"}
    When method post
    Then status 201
    And print response

  # Post Assertion
  Scenario: Test a Simple POST API
    Given path '/users'
    And request {"name": "Tanvir","job": "Lecturer"}
    When method post
    Then status 201
    And match response == {"name": "Tanvir","job": "Lecturer","id":"#string","createdAt": "#ignore"}
    And print response

  # Post Assertion  from repository
  Scenario: Test a Simple POST API
    Given path '/users'
    And request {"name": "Tanvir","job": "Lecturer"}
    When method post
    Then status 201
    And match response == expectedOutput
    And print response
