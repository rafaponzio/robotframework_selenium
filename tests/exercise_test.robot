*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../resources/keywords.robot
Test Setup  Open Browser    ${BASE_URL}    ${BROWSER}
Test Teardown  Clean all

*** Test Cases ***
Add Two Products To Cart And Verify The Sum
    [Tags]    SmokeTest
    Login    ${USER}    ${PASS}
    Navigate To Page    products
    Verify Search Bar Is Visible
    Search Product and Add to Cart    men tshirt
    Search Product and Add to Cart    blue top
    Navigate To Page    view_cart
    Verify Products Are Visible In Cart
    Proceed To Checkout
    Verify Sum Of Product Values Is Correct