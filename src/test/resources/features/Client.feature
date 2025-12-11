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
    And set value Banco Nuevo2 of key name in body jsons/bodies/addnewClient.json
    When execute method POST
    Then the status code should be 201
    And response should be name = Banco Nuevo
    * print response