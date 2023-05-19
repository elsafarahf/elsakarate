@users
Feature: sample test POST

Background: 
    * url 'https://reqres.in/api/'
    * def expectedOutput = read('response-post.json') 
    # * same as GIVEN WHEN AND THEN
    #return response for POST DEMO 4 and only can read json file from the same folder

#sample POST 1
Scenario: POST DEMO 1
    Given url 'https://reqres.in/api/users'
    And request { "name": "elsa","job": "QA" }
    When method POST
    Then status 201
    And  print response

#sample POST with background
Scenario: POST DEMO 2
    Given path '/users'
    And request { "name": "elsa","job": "QA" }
    When method POST
    Then status 201
    And  print response


#sample POST with asseration
Scenario: POST DEMO 3
    Given path '/users'
    And request { "name": "elsa","job": "QA" }
    When method POST
    Then status 201
    And match response == {"name": "elsa", "job": "QA", "id": "#string", "createdAt": "#ignore"}
    #id, name, job, createdAt can determine as #notnull, data type #string, or #ignore. refer to https://karatelabs.github.io/karate/#match
    And print response

#sample POST with read response from file json
Scenario: POST DEMO 4
    Given path '/users'
    And request { "name": "elsa","job": "QA" }
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response 

#sample POST with read request and response from file json under same folder
Scenario: POST DEMO 5
    Given path '/users'
    And def requestBody = read ('request-post.json')
    And request requestBody
    When method POST
    Then status 201
    And def expectedOutput = read ('response-post.json')
    #can be And match response == expectedOutput
    #response can be read from here or put on background
    And print response 

#sample POST with read request read from file json under different folder
Scenario: POST DEMO 6
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    And print projectPath
    And def filePath = projectPath + '/src/test/java/examples/json/request-post-1.json'
    #path directory request-post-1.json
    And print filePath
    And def requestBody1 = filePath
    And request requestBody1
    When method POST
    Then status 201
    And def expectedOutput = read ('response-post.json')
    And print response 

#sample POST with change value of request
Scenario: POST DEMO 7
    Given path '/users'
    And def requestBody = read ('request-post.json')
    And request requestBody
    And set requestBody.name = 'Farah'
    And set requestBody.job = 'IT'
    #set for change value of request body
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response 
