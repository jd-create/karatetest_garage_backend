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
    And print response
    Then match response.firstName == "Peter"
    And match response.lastName == "Anema"
    And match response.clientNumber == "12464"


  Scenario: Update a Client
    Given path 'clients/1'
    And request { "firstName": "Truus", "lastName": "Henksen","clientNumber": "12324"}
    When method put
    Then print response

    Given path '/clients/1'
    When method get
    And print response
    Then match response.firstName == "Truus"
    And match response.lastName == "Henksen"
    And match response.clientNumber == "12324"
