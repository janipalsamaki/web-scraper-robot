*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary

*** Keywords ***
Store the latest ${number_of_tweets} tweets by user name "${user_name}"
    Open Twitter homepage   ${user_name}
    Store tweets            ${user_name}    ${number_of_tweets}
    [Teardown]              Close Browser

Open Twitter homepage
    [Arguments]     ${user_name}
    Open Browser    ${TWITTER_URL}/${user_name}  ${BROWSER}

Store tweets
    [Arguments]                     ${user_name}            ${number_of_tweets}
    ${tweets_locator}=              Get tweets locator      ${user_name}
    Wait Until Element Is Visible   ${tweets_locator}
    @{tweets}=                      Get WebElements         ${tweets_locator}
    ${tweet_directory}=             Get tweet directory     ${user_name}
    Create Directory                ${tweet_directory}
    ${index}=                       Set Variable            1

    FOR     ${tweet}  IN  @{tweets}
        Exit For Loop If            ${index} > ${number_of_tweets}
        ${screenshot_file}=         Set Variable    ${tweet_directory}/tweet-${index}.png
        ${text_file}=               Set Variable    ${tweet_directory}/tweet-${index}.txt
        ${text}=                    Set Variable    ${tweet.find_element_by_class_name('tweet-text').text}
        Capture Element Screenshot  ${tweet}        ${screenshot_file}
        Create File                 ${text_file}    ${text}
        ${index}=                   Evaluate        ${index} + 1
    END

Get tweets locator
    [Arguments]     ${user_name}
    [Return]        xpath://div[@data-screen-name="${user_name}" and contains(@class, "tweet")]

Get tweet directory
    [Arguments]     ${user_name}
    [Return]        ${CURDIR}/tweets/${user_name}