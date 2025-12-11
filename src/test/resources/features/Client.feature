Feature: Client

  @add-newClient
  Scenario: Add a new client
    Given call Workspace.feature@get-allWorkspaces
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{idWorkspace}}/clients
    And header x-api-key = MmRjYjA5YjYtNjE3Mi00MzA5LWFkMmUtYmVhNWYzOTVkNDE5
    And header Content-Type = application/json
    And header Accept = */*
    And body read(jsons/bodies/addnewClient.json)
    And set value Instrumentos of key name in body jsons/bodies/addnewClient.json
    When execute method POST
    Then the status code should be 201
    And response should be name = Instrumentos
    * define idClient = $.id
    * print response
    And call Client.feature@deleteClient

  @deleteClient
  Scenario: Delete an existing Client successfully
    Given base url https://api.clockify.me/api
    And endpoint /v1/workspaces/6902d12cf51ed03d2c4af11c/clients/{{idClient}}
    And header x-api-key = MmRjYjA5YjYtNjE3Mi00MzA5LWFkMmUtYmVhNWYzOTVkNDE5
    When execute method DELETE
    Then the status code should be 200


  @invalidEndpoint
  Scenario: Validate error when calling an invalid API endpoint
    Given base url https://api.clockify.me/api
    And endpoint /v1/workspaces/6902d12cf51ed03d2c4af11c/projects/clients/693b31a382bbd06f54f1503a
    And header x-api-key = MmRjYjA5YjYtNjE3Mi00MzA5LWFkMmUtYmVhNWYzOTVkNDE5
    When execute method DELETE
    Then the status code should be 404
    * print response
