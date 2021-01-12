@smoke
Feature: Test Client api's

  Background:
    * url 'http://localhost:8080'

  Scenario: List all available clients and assert they a available
    * def clientTemplate = read ('classpath:rescources/client-template.json')
    Given path '/clients'
    When method get
    And print response
    And match response == clientTemplate

  Scenario: Call Clients per ID and check response
    Given path '/client/1'
    When method get
    Then status 200
    Then match response.firstName      == "Peter"
    And match response.lastName        == "Anema"
    And match response.telephoneNumber == "06-12345678"

  Scenario: Update a Client and check the result
    Given path 'client/1'
    And request { "firstName": "Truus", "lastName": "Henksen", "telephoneNumber": "06-12345678"}
    When method put
    Then status 200

    Given path '/client/1'
    When method get
    Then status 200
    Then match response.firstName == "Truus"
    And match response.lastName == "Henksen"
    And match response.telephoneNumber == "06-12345678"

  Scenario: Add a Client and check result
    ##Todo Delete doesnot work due to constrain: IntegrityConstraintViolationException
    Given path 'client'
    And request
    """
    {
      "firstName" : "Jurgen",
      "lastName" : "Kervezee",
      "telephoneNumber" : "06-65498732",
      "streetName": "Hamerstraat",
      "houseNumber": "35",
      "houseNumberAddition": "A",
      "postalCode": "1400ZZ",
      "homeTown": "Zeist"
    }
    """
    When method post
    Then status 201
    * def id = response

    Given path 'client/' + id
    When method get
    Then status 200
    And match response.firstName == "Jurgen"
    And match response.lastName == "Kervezee"
    And match response.telephoneNumber == "06-65498732"

    #Delete the last created client
    Given path 'client/' + id
    When method delete
    Then status 204

    Given path 'client/' + id
    When method get
    Then status 200


