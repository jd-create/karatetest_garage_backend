Feature: Cars feature

  Background:
    * url 'http://localhost:8080'

    Scenario: cars test
      Given path 'cars'
      When method get
      And match response == [{"id":1,"numberPlate":"23-HG-35","brand":"Opel","model":"Zafira"},{"id":2,"numberPlate":"12-HG-ZZ","brand":"Fiat","model":"Multipla"}]



