  Feature: pelago product
    
    Background:
     * url baseUrl

    Scenario: product details with correct productId

    * def productId = "phpv2"
    * def query = read('product.graphql')
    * def variables = { productId: "#(productId)" }
    And request { query: '#(query)', variables: '#(variables)' }
    When method post
    Then status 200
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


    Scenario: product details with incorrect productId

    * def  productId = "phpv"
    * def query = read('product.graphql')
    * def variables = { productId: "#(productId)" }
    And request { query: '#(query)', variables: '#(variables)' }
    When method post
    Then status 200
    Then match $.data.product.code == 404
    Then match $.data.product.__typename == "PelagoError"
    Then match $.data.product.errorMessage == productId+" product not found"

    Scenario: product details with productId as null

    * def  productId = null
    * def query = read('product.graphql')
    * def variables = { productId: "#(productId)" }
    And request { query: '#(query)', variables: '#(variables)' }
    When method post
    Then status 400
