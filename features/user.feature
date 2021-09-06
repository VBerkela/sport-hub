Feature: User
  Scenario: Creating a new user
    When I create the following user:
      | Email                 | v_berkela@test.com |
      | Full name             | Volodya Berkela    |
      | Password              | test123            |
      | Password confirmation | test123            |
    Then I should have the following user:
      | email              | full_name       |
      | v_berkela@test.com | Volodya Berkela |
