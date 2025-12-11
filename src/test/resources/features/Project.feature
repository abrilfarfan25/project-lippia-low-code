Feature: Project

  @add-newProject
  Scenario: Add a new project
    Given call Workspace.feature@get-allWorkspaces
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{idWorkspace}}/projects
    And header x-api-key = MmRjYjA5YjYtNjE3Mi00MzA5LWFkMmUtYmVhNWYzOTVkNDE5
    And header Content-Type = application/json
    And header Accept = */*
    And body read(jsons/bodies/addnewProject.json)
    When execute method POST
    Then the status code should be 201
    * define idProject = $.id
    * print response
    And call Project.feature@deleteProject

  @deleteProject
  Scenario: Delete an existing project
    Given call Project.feature@updateProject
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{idWorkspace}}/projects/{{idProject}}
    And header x-api-key = MmRjYjA5YjYtNjE3Mi00MzA5LWFkMmUtYmVhNWYzOTVkNDE5
    When execute method DELETE
    Then the status code should be 200
    * print response

  @updateProject
  Scenario: Update status project
    Given base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{idWorkspace}}/projects/{{idProject}}
    And header x-api-key = MmRjYjA5YjYtNjE3Mi00MzA5LWFkMmUtYmVhNWYzOTVkNDE5
    And header Content-Type = application/json
    And header Accept = */*
    And body read(jsons/bodies/updateProject.json)
    When execute method PUT
    Then the status code should be 200
    And response should be archived = true
    * print response


