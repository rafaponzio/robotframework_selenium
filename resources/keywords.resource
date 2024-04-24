*** Settings ***
Resource    locators.resource
Library    SeleniumLibrary

*** Keywords ***
Login
    [Arguments]  ${login}
    Navigate to Page  login
    Input Text  ${LOGIN_EMAIL}    ${login.user}
    Input Text  ${LOGIN_PASSWORD}    ${login.pwd}
    Click Button  ${LOGIN_BUTTON}

Search Product and Add to Cart
    [Arguments]  ${product_name}
    Input Text  ${SEARCH_BOX}  ${product_name}
    Click Button  ${SEARCH_BUTTON}
    Verify Text Is Visible  ${SEARCH_RESULT}  ${product_name}
    Add Product To Cart
    Continue Shopping

Proceed To Checkout
    Click Element  ${PROCEED_TO_CHECKOUT_BUTTON}

Navigate To Page
    [Arguments]    ${page}
    Go To    ${BASE_URL}/${page}

Verify Search Bar Is Visible
    ${search_bar_visibility}=    Run Keyword And Return Status    Element Should Be Visible    ${SEARCH_BOX}
    Should Be True    ${search_bar_visibility}

Verify Text Is Visible
    [Arguments]    ${locator}    ${expected_text}
    Wait Until Page Contains Element    ${locator}
    ${actual_text}=    Get Text    ${locator}
    Should Be Equal As Strings    ${actual_text}    ${expected_text}	ignore_case=True

Add Product To Cart
	Scroll To Element	${ADD_TO_CART_BUTTON}
    Click Element    ${ADD_TO_CART_BUTTON}

Continue Shopping
    Wait Until Element Is Visible    ${CONTINUE_SHOPPING_BUTTON}
    Click Element    ${CONTINUE_SHOPPING_BUTTON}

Verify Products Are Visible In Cart
	Verify Text Is Visible	${PRODUCT_TEXT_1}	men tshirt
	Verify Text Is Visible	${PRODUCT_TEXT_2}	blue top

Verify Sum Of Product Values Is Correct
    ${total_sum}=    Set Variable    0
    ${line_number}=    Set Variable    1

    ${num_lines}=    Get Element Count    css:tr p.cart_total_price

    FOR    ${line_number}    IN RANGE    1    ${num_lines}
        ${total_text}=    Get Text    css:tr:nth-child(${line_number}) p.cart_total_price
        ${total_cleaned}=    Replace String    ${total_text}    Rs.    ${EMPTY}    2
        ${total_int}=    Convert To Number    ${total_cleaned}
        ${total_sum}=    Evaluate    ${total_sum} + ${total_int}
    END

    ${cart_total}=    Get Text    css:tr:nth-child(${num_lines}) p.cart_total_price
    ${cart_total_cleaned}=    Replace String    ${cart_total}    Rs.    ${EMPTY}    2
    ${cart_total_int}=    Convert To Number    ${cart_total_cleaned}

    Should Be Equal    ${total_sum}    ${cart_total_int}

Scroll To Element
    [Arguments]  ${locator}
    ${x}=        Get Horizontal Position  ${locator}
    ${y}=        Get Vertical Position    ${locator}
    Execute Javascript  window.scrollTo(${x}, ${y+20})

Clean all
    Navigate To Page    delete_cart/1
    Navigate To Page    delete_cart/2
    Close Browser