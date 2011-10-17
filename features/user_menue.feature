Feature: User menu

  Scenario: Create User
    Given the sign_up url
    When  I go by the sign_up url
    And I fill all fields
    And Click submit
    Then I should see ''