*** Settings ***

Library    Collections
Library    RequestsLibrary
Library    Selenium2Library

Resource    ../data/apiData.robot

*** Variables ***

*** Keywords ***

Get Amadeus Token
    [Documentation]    Get amadeus token to be able to connect amadeus services
    [Arguments]    ${clientId}    ${clientSecret}
    ${baseUrl} =    Set Variable    ${URL.AMADEUS_API_URL}${ENDPOINTS_AMADEUS.AMADEUS_TOKEN}
    ${formData} =    Create Dictionary    grant_type=client_credentials    client_id=${clientId}    client_secret=${clientSecret}
    ${headers} =  Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${response} =    POST    url=${baseUrl}    headers=${headers}    data=${formData}
    Log    ${response.json()}
    RETURN    ${response.json()['access_token']}

Flight Search Offer
    [Documentation]    Search for flight offers using Amadeus API
    [Arguments]    ${TOKEN}    ${ITA_ORIGIN}    ${ITA_DESTINATION}    ${DATE}    ${ADULTS}    ${NON_STOP}    ${CURRENCY}    ${MAX_RESULTS}    ${PRICE}=999999
    ${baseUrl} =    Set Variable    ${URL.AMADEUS_API_URL}${ENDPOINTS_AMADEUS.AMADEUS_FLIGHT_SEARCH_OFFER}?originLocationCode=${ITA_ORIGIN}&destinationLocationCode=${ITA_DESTINATION}&departureDate=${DATE}&adults=${ADULTS}&nonStop=${NON_STOP}&currencyCode=${CURRENCY}&max=${MAX_RESULTS}&maxPrice=${PRICE}
    ${headers} =  Create Dictionary    Authorization=Bearer ${TOKEN}
    ${response} =    GET    url=${baseUrl}    headers=${headers}
    Status Should Be    200    ${response}
    Log    ${response.json()}
    RETURN    ${response.json()}