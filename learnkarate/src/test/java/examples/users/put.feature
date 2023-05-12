Feature: sample test PUT

Background: 
    * url 'https://reqres.in/api/'
    * def responsePUT = read('response-put.json')

Scenario: PUT DEMO 1
    Given path '/users/2'
    And def requestPUT = read('request-put.json')
    And request requestPUT
    When method PUT
    Then status 200
    And match response == responsePUT
    And print response