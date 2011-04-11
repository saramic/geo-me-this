Feature: turn an address in a number of forms into a geographical representation like a map

  Scenario: this address into lat and long
    Given this address "1 Victoria St Richmond Victoria Australia"
    When I pass this address to geo-me-this
    Then the returned value will be "Victoria St Richmond VIC Australia; ll: -37.810873,145.0036835"
