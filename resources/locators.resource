*** Variables ***
${BROWSER}    chrome
${BASE_URL}   http://automationexercise.com

&{LOGIN}    
...    user=kjatohkhhvbtqbfpzf@cazlg.com    
...    pwd=qwe123@

# Page Locators
${LOGIN_EMAIL}         css:input[data-qa="login-email"]
${LOGIN_PASSWORD}      css:input[data-qa="login-password"]
${LOGIN_BUTTON}        css:button[data-qa="login-button"]
${SEARCH_BOX}          id:search_product
${SEARCH_BUTTON}       id:submit_search
${SEARCH_RESULT}       xpath://div[@class='productinfo text-center']/p
${PRODUCT_TEXT_1}      css:tr:nth-child(1) td.cart_description h4 a
${PRODUCT_TEXT_2}      css:tr:nth-child(2) td.cart_description h4 a
${ADD_TO_CART_BUTTON}  xpath://div[@class='productinfo text-center']/a[@class='btn btn-default add-to-cart']
${CONTINUE_SHOPPING_BUTTON}  xpath://button[@class='btn btn-success close-modal btn-block']
${PROCEED_TO_CHECKOUT_BUTTON}  xpath://a[text()='Proceed To Checkout']