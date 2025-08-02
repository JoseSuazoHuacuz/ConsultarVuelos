*** Variables ***

&{URL} = 
...    TEQUILA_API_URL=https://tequila-api.kiwi.com/
...    SHEETY_API_URL=https://api.sheety.co/
...    AMADEUS_API_URL=https://test.api.amadeus.com/

&{ENDPOINTS_TEQUILA} =
...    TEQUILA_INSPIRATION_SEARCH=v2/search
 
&{ENDPOINTS_AMADEUS} =
...    AMADEUS_CHEAPEST_DATA_SEARCH=v1/shopping/flight-dates
...    AMADEUS_FLIGHT_SEARCH_OFFER=v2/shopping/flight-offers
...    AMADEUS_TOKEN=/v1/security/oauth2/token

&{API_KEY} =
...    CLIENT_ID=q7NKn4WTretMsAoSGRIShCjo0ZoUsfJQ
...    CLIENT_SECRET=cos7jXc6hPHLaKUF