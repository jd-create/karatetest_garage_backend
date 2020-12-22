@Alltests
Feature: First Test Clients

  Background:
    * url 'http://localhost:8080'

  Scenario: Call Clients Api and assert they a available
    Given path '/clients'
    When method get
    And print response
    * def clients = response

  Scenario: Call Clients per ID
    Given path '/clients/1'
    When method get
    And print response
    And match response.firstName == "Peter"
    And match response.lastName == "Anema"
    And match response.clientNumber == "12464"