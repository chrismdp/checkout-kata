Feature: Scanning

  Important context for our feature
  goes here!

  - Scanning each item adds to the total
  - Apples cost 50p
  - Aspirin costs 23p
  - Can only buy two aspirin at once

  Scenario: Scanning an item
    Given ...
    When ...
    Then ...













  # Stretch goal 1

  - prices should be configurable. Eg:
  ```
      Given a checkout with the following prices:
        | Apple   | 50 |
        | Aspirin | 78 |
  ```

  # Stretch goal 2

  - Bananas cost 75p, Mangos cost 120p
  - Apples are half price on Mondays, BUT only when you buy another type of fruit
