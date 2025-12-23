Feature: TimeEntry

  Background:
    Given base url https://api.clockify.me/api
    And header x-api-key = MmRjYjA5YjYtNjE3Mi00MzA5LWFkMmUtYmVhNWYzOTVkNDE5

  @get-allTimeEntries
  Scenario: Get all Time Entries
    And endpoint /v1/workspaces/6902d12cf51ed03d2c4af11c/user/6902d12df51ed03d2c4af121/time-entries
    And header x-api-key = MmRjYjA5YjYtNjE3Mi00MzA5LWFkMmUtYmVhNWYzOTVkNDE5
    When execute method GET
    Then the status code should be 200
    * print response

  @create-timeEntry
  Scenario: Create time entry
    And endpoint /v1/workspaces/6902d12cf51ed03d2c4af11c/time-entries
    And header Content-Type = application/json
    And header Accept = */*
    And body read(jsons/bodies/addnewTimeEntry.json)
    When execute method POST
    Then the status code should be 201
    * print response
    * define idTimeEntry = $.id

  @update-timeEntry
  Scenario: Update description time entry
    Given call TimeEntry.feature@create-timeEntry
    And endpoint /v1/workspaces/6902d12cf51ed03d2c4af11c/time-entries/{{idTimeEntry}}
    And header Content-Type = application/json
    And header Accept = */*
    And body read(jsons/bodies/updatetimeentry.json)
    When execute method PUT
    Then the status code should be 200
    And response should be $.description = Descripcion modificada desde automation
    * print response
    And call TimeEntry.feature@delete-timeEntry

  @delete-timeEntry
  Scenario: Delete time entry
    And endpoint /v1/workspaces/6902d12cf51ed03d2c4af11c/time-entries/{{idTimeEntry}}
    When execute method DELETE
    Then the status code should be 204
    * print response

