Feature: Cars feature

  Background:
    * url 'http://localhost:8080'

    Scenario: cars test
      Given path 'cars'
      When method get

