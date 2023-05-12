Feature: sample test DELETE

Scenario: DELETE DEMO 1
    Given url 'https://reqres.in/api/users/2'
    When method DELETE
    Then status 204 
    And print response