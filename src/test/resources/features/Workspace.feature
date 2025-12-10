Feature: Workspaces

    @get-allWorkspaces
    Scenario: Get all my Workspaces
        Given base url https://api.clockify.me/api
        And endpoint /v1/workspaces
        And header x-api-key = MmRjYjA5YjYtNjE3Mi00MzA5LWFkMmUtYmVhNWYzOTVkNDE5
        When execute method GET
        Then the status code should be 200
        * print response
        * define idWorkspace = $[0].id

    @get-infoWorkspace
    Scenario: Get Workspace info
      Given call Workspace.feature@get-allWorkspaces
      And base url https://api.clockify.me/api
      And endpoint /v1/workspaces/{{idWorkspace}}
      And header x-api-key = MmRjYjA5YjYtNjE3Mi00MzA5LWFkMmUtYmVhNWYzOTVkNDE5
      When execute method GET
      Then the status code should be 200
      And response should be $.name = Crowdar
      * print response






