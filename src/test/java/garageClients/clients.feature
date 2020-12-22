@smoke
Feature: First Test Clients

  Background:
    * url 'http://localhost:8080'

  Scenario: Call Clients Api and assert they a available
    * def clientTemplate = read ('classpath:rescources/client-template.json')
    Given path '/clients'
    When method get
    And print response
    And match response == clientTemplate

  Scenario: Call Clients per ID
    Given path '/clients/1'
    When method get
    Then status 200
    Then match response.firstName == "Peter"
    And match response.lastName == "Anema"
    And match response.clientNumber == "12464"

  Scenario: Update a Client
    Given path 'clients/1'
    And request { "firstName": "Truus", "lastName": "Henksen","clientNumber": "12324"}
    When method put
    Then status 200

    Given path '/clients/1'
    When method get
    Then status 200
    Then match response.firstName == "Truus"
    And match response.lastName == "Henksen"
    And match response.clientNumber == "12324"

  Scenario: Add a Client
    Given path 'clients'
    And request { "firstName": "Henk", "lastName": "de Geweldige","clientNumber": "12345"}
    When method post
    Then status 201
    * def id = response

    Given path 'clients/' + id
    When method delete
    Then status 204
    Then print response
