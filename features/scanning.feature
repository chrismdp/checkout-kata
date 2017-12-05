Feature: Scanning

  Important context for our feature goes here!

  - Scanning each item adds to the total
  - Apples cost 50p
  - Aspirin costs 78p
  - Can only buy two aspirin at once

  Scenario: Total starts at 0
    Given nothing has been scaned yet
    Then the total should be 0p

  Scenario: Scanning one apple
    Given nothing has been scaned yet
    When I scan an apple
    Then the total should be 50p



