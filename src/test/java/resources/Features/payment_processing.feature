Feature: Payment Processing

  @SuccessfulPayment
  Scenario: Successful payment processing
    Given url 'http://localhost:8082/payment'
    And request read('../data/valid_payment_request.json')
    When method POST
    Then status 200
    And match response.status == 'SUCCESS'
    * print response

  @InvalidAccount
  Scenario: Invalid payment request - Account doesn't exist
    Given url 'http://localhost:8082/payment'
    And request read('../data/invalid_account_payment_request.json')
    When method POST
    Then status 400
    And match response.message == 'REQUEST_DETAILS_INVALID'
    * print response

  @InsufficientBalance
  Scenario: Insufficient balance
    Given url 'http://localhost:8082/payment'
    And request read('../data/insufficient_balance_payment_request.json')
    When method POST
    Then status 400
    And match response.message == 'INSUFFICIENT_BALANCE'
    * print response