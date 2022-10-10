  Feature: pelago product
    
    Background:
     * url baseUrl #this will set baseurl from karate-config.js

   #this test case to verify product details by sending correct product id "phpv2"
    Scenario: verify product details with correct productId

    * def productId = "phpv2"
    * def query = read('product.graphql') #read query from product.graphql file
    * def variables = { productId: "#(productId)" } #this will set graphql variable
    And request { query: '#(query)', variables: '#(variables)' }
    When method post
    Then status 200
    #verify the response fields
    Then match $.data.product.productId == "phpv2"
    Then match $.data.product.productName == "Saris, Sultans & Shophouses: Little India & Kampong Glam Tour by Jane's Singapore Tours"
    Then match $.data.product.destinationId == "singapore"
    Then match $.data.product.cancellationType == "NO_CANCELLATION"
    Then match $.data.product.minGroupSize == null
    Then match $.data.product.duration == "2 - 3 Hours"
    Then match $.data.product.openDateTicket == false
    Then match $.data.product.collectPhysicalTicket == false
    Then match $.data.product.confirmationType == "MANUAL"
    Then match $.data.product.voucherType == "PELAGO"
    Then match $.data.product.guideLanguages == "English, Bahasa"
    Then match $.data.product.priceRangeFrom == 400.0
    Then match $.data.product.priceRangeTo == 600.0
    Then match $.data.product.location.latitude == 1.3066479
    Then match $.data.product.location.longitude == 103.8472179
    Then match $.data.product.location.address == "Little India MRT, Exit E (intersection between Race Course Road and Buffalo Road)"
    Then match $.data.product.location == {neighborhood: "Little India", placeId: "ChIJqQbvRr8Z2jERy2II5T8kD1o", latitude: 1.3066479, longitude: 103.8472179, address: "Little India MRT, Exit E (intersection between Race Course Road and Buffalo Road)", mapUrl: "https://traveller.dev.pelago.co/img/products/SG-Singapore/saris-sultans-shophouses-little-india-kampong-glam-tour-janes-singapore-tours/map.png"}

   #this test case to verify product details by sending incorrect product id "phpv"
    Scenario: verify product details with incorrect productId

    * def  productId = "phpv"
    * def query = read('product.graphql')
    * def variables = { productId: "#(productId)" }
    And request { query: '#(query)', variables: '#(variables)' }
    When method post
    Then status 200
    Then match $.data.product.code == 404
    Then match $.data.product.__typename == "PelagoError"
    Then match $.data.product.errorMessage == productId+" product not found"

     #this test case to verify product details by sending incorrect product id as null
    Scenario: verify product details with productId as null

    * def  productId = null
    * def query = read('product.graphql')
    * def variables = { productId: "#(productId)" }
    And request { query: '#(query)', variables: '#(variables)' }
    When method post
    Then status 400
    Then match $.errors[0].message == "Variable \"$productId\" of required type \"String!\" was not provided."

    #this test case to verify product details by sending incorrect product id as Integer
    Scenario: verify product details with productId as Integer

    * def  productId = "phpv"
    * def query = read('product.graphql')
    * def variables = { productId: "#(productId)" }
    And request { query: '#(query)', variables: '#(variables)' }
    When method post
    Then status 200
    Then match $.data.product.code == 404
    Then match $.data.product.__typename == "PelagoError"
    Then match $.data.product.errorMessage == productId+" product not found"

   #this test case to test api by sending wrong GRAPHQL variable
    Scenario: verify product details by passing invalid GRAPHQL variable

    * def productId = "phpv2"
    * def query = read('product.graphql')
    * def variables = { product: "#(productId)" }
    And request { query: '#(query)', variables: '#(variables)' }
    When method post
    Then status 400
    Then match $.errors[0].message == "Variable \"$productId\" of required type \"String!\" was not provided."

    #this test case to test api by sending wrong GRAPHQL query
    Scenario: verify product details by passing invalid GRAPHQL query

    * def productId = "phpv2"
    * def query = read('invalid.graphql')
    * def variables = { productId: "#(productId)" }
    And request { query: '#(query)', variables: '#(variables)' }
    When method post
    Then status 400
    Then match $.errors[0].message == "Unknown argument \"product\" on field \"product\" of type \"Query\". Did you mean \"productId\"?"
