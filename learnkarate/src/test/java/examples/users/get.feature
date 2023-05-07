Feature: GET API sample

//sample API = https://reqres.in/ , https://jsonpathfinder.com/

Background:
    * url 'https://reqres.in/api/'

#sample GET API    s
Scenario: GET DEMO 1
    Given url 'https://reqres.in/api/users?page=2'
    When method get
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

#sample GET API with background  
Scenario: GET DEMO 2
    Given path '/users?page=2'
    When method get
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

#sample GET API with background , params, and path 
Scenario: GET DEMO 3
    Given path '/users'
    And params page = 2
    When method get
    Then status 200
    And print response
    And print responseStatus


#sample GET API with Assertions
Scenario: GET DEMO 4
    Given path '/users'
    And params page = 2
    When method get
    Then status 200
    And print response
    And print responseStatus
    And match response.data[0].first_name != null
    And assert response.data.length == 6
    And match response.data[3].id == 4
    And match $.data[3].id == 4 
    #same as response = $
    And match response.data[5].avatar == 'https://reqres.in/img/faces/6-image.jpg'