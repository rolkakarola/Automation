*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem      
Library    SeleniumLibrary    timeout=30s

*** Variables ***
${URL}                           https://www.google.com               
${SEARCH_TERM}                   nokia wikipedia                       
${BROWSER}                       firefox                                
${EXPECTED_FOUNDING_YEAR}        1865                                    
${GOOGLE_SEARCH_INPUT}           xpath://*[@id="APjFqb"]    
${WIKIPEDIA_LINK_XPATH}          //a[contains(@href, 'wikipedia.org')]     #check it
${FOUNDING_YEAR_XPATH}           //a[contains(@href, '/wiki/1865')]
${SCREENSHOT_FILENAME}           screenshot.png
${ACCEPT_COOKIES_BUTTON}         id=L2AGLb  

*** Test Cases ***
Valid Screenshot
    Open Google in Firefox
    Accept Cookies    
    Search for Nokia 
    Verify Link
    Wait Until Page Loads
    Capture Screenshot
    Verify Page Title 
    Founding Year
    [Teardown]    Close Browser

*** Keywords ***
Open Google in Firefox
    Open Browser    ${URL}    ${BROWSER}  
    Maximize Browser Window 

Accept Cookies 
    Wait Until Element Is Visible    ${ACCEPT_COOKIES_BUTTON}         # accepts the cookies
    Click Element    ${ACCEPT_COOKIES_BUTTON}

Search for Nokia 
    Input Text    ${GOOGLE_SEARCH_INPUT}    ${SEARCH_TERM}
    Press Keys    ${GOOGLE_SEARCH_INPUT}    ENTER                      # search button is the same as the input field

Verify link
    Wait Until Page Contains Element    ${WIKIPEDIA_LINK_XPATH}        # Fails if timeout expires
    ${wikipedia_link}=    Get WebElement    ${WIKIPEDIA_LINK_XPATH}    # stores the result
    
    Run Keyword If    ${wikipedia_link}    Click Element    ${wikipedia_link}
    ...    ELSE    Log To Console    "Wikipedia link not found in search results."    critical

Wait Until Page Loads
    Wait Until Page Contains Element    id=firstHeading   

Capture Screenshot
    Capture Page Screenshot    ${SCREENSHOT_FILENAME}
    Log    Screenshot captured and saved as ${SCREENSHOT_FILENAME}

Verify Page Title
    ${actual_title}=    Get Title
    ${container}=    Should Contain    ${actual_title}    Nokia    #checks if the title has a Nokia in it 

Founding Year  
    ${founding_year}=    Get Text    ${FOUNDING_YEAR_XPATH}
    Should Be Equal As Numbers    ${founding_year}    ${EXPECTED_FOUNDING_YEAR}    Founding year is not as expected.