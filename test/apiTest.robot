*** Settings ***
Documentation    This test suite validates services for amadeus API

Library    Collections
Library    RequestsLibrary
Library    Selenium2Library

Resource    ../data/apiData.robot
Resource    ../resources/api.resource

*** Variables ***


*** Test Cases ***

AMA_01 - Obtain Amadeus Token
    [Documentation]    This test cases obtains the token for amadeus API
    [Tags]    AMA    AMA_01
    ${ACCESS_TOKEN} =    Get Amadeus Token    ${API_KEY.CLIENT_ID}    ${API_KEY.CLIENT_SECRET}
    Log    ${ACCESS_TOKEN}

AMA_02 - Flight Search Offer
    [Documentation]    Test case to search for flights offers using Amadeus API.
    [Tags]    API    AMD_02
    ${ACCESS_TOKEN} =     Get Amadeus Token    ${API_KEY.CLIENT_ID}    ${API_KEY.CLIENT_SECRET}
    ${ITA_ORIGIN} =    Set Variable    MEX
    ${ITA_DESTINATION} =    Set Variable    MAD
    ${DATE} =    Set Variable    2025-10-01
    ${ADULTS} =    Set Variable    1
    ${NON_STOP} =    Set Variable    true
    ${CURRENCY} =    Set Variable    MXN
    ${MAX_RESULTS} =    Set Variable    1
    # ${PRICE} =    Set Variable    10000  
    ${RESULT} =    Flight Search Offer   ${ACCESS_TOKEN}    ${ITA_ORIGIN}    ${ITA_DESTINATION}    ${DATE}    ${ADULTS}    ${NON_STOP}    ${CURRENCY}    ${MAX_RESULTS}
    Log    ${RESULT}