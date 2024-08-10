*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem      

*** Variables ***
${URL}                           https://www.google.com
${SEARCH_TERM}                   nokia wikipedia
${BROWSER}                       firefox
${EXPECTED_YEAR}                 1865
${GOOGLE_SEARCH_INPUT}           name=q     
${WIKIPEDIA_LINK_XPATH}         //a[contains(@href, 'wikipedia.org')]

#change 'założone' (Founded) if your wikipedia is not in polish
${FOUNDING_YEAR_XPATH}          //table[contains(@class, 'infobox')]//th[contains(text(), 'założone zostało w roku 1865')]/following-sibling::td[1]    
${SCREENSHOT_FILENAME}           screenshot.png
${ACCEPT_COOKIES_BUTTON}         id=L2AGLb  

*** Test Cases ***
Search Nokia Wikipedia
    Open Browser    ${URL}    ${BROWSER}  
    Maximize Browser Window   
    Accept Cookies    #calling the keyword
    Input Text    ${GOOGLE_SEARCH_INPUT}    ${SEARCH_TERM}
    Press Keys    ${GOOGLE_SEARCH_INPUT}    ENTER    
    Wait Until Page Contains Element    ${WIKIPEDIA_LINK_XPATH}    timeout=10

    ${wikipedia_link}=    Get WebElements    ${WIKIPEDIA_LINK_XPATH}
    Run Keyword If    ${wikipedia_link}    Click Element    ${wikipedia_link}[0]
    ...    ELSE    Log To Console    "Wikipedia link not found in search results."    critical

    Wait Until Page Loads
    Capture Page Screenshot    ${SCREENSHOT_FILENAME}
    Log    Screenshot captured and saved as ${SCREENSHOT_FILENAME}

    #wait for the founding year element to be visible
    Wait Until Element Is Visible    ${FOUNDING_YEAR_XPATH}    timeout=10
    ${founding_year}=    Extract Founding Year
    Should Be Equal As Strings    ${founding_year}    ${EXPECTED_YEAR}

*** Keywords ***
Wait Until Page Loads
    Wait Until Page Contains Element    id=firstHeading    timeout=10

Extract Founding Year
    ${year_element}=    Get Text    ${FOUNDING_YEAR_XPATH}
    ${year}=    Set Variable    ${year_element.strip()}  # Strip whitespace using Python's string method
    RETURN    ${year}  # Use RETURN instead of [Return]

Verify Page Title Contains
    [Arguments]    ${expected_title}
    ${actual_title}=    Get Title
    Should Contain    ${actual_title}    ${expected_title}

Accept Cookies
    Wait Until Element Is Visible    ${ACCEPT_COOKIES_BUTTON}    timeout=10
    Click Element    ${ACCEPT_COOKIES_BUTTON}
