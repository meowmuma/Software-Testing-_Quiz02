*** Settings ***
Library             SeleniumLibrary
Library             Dialogs
Suite Setup         Open Browser    https://chiangmuan.igovapp.com/    Chrome
Suite Teardown      Close Browser

*** Variables ***
${LOGIN_PAGE_BTN}      xpath=//*[@id="root"]/div/nav/header/div/a[1]
${QR_MODE_BTN}         xpath=//*[@id="app"]/div/div/div/div[2]/div/div[2]/a
${LINE_CONFIRM_BTN}    xpath=//*[@id="app"]/div/div/div/div/div/div[2]/div/div[3]/button

# สิ่งที่คุณเพิ่ม
${SERVICE_CARD}        xpath=//*[@id="root"]/div/main/section/div[3]/div[2]/div/div/a[1]/div
${HISTORY_ICON}        xpath=//*[@id="root"]/div/main/section[2]/div/div[2]/div[1]/a/svg
${CHECK_HISTORY_BTN}   xpath=//*[@id="react-aria7475584685-«r19»-1579901115675-00154-$.0"]/a

*** Keywords ***
Login With LINE (QR Code)
    Wait Until Element Is Visible    ${LOGIN_PAGE_BTN}    15s
    Click Element    ${LOGIN_PAGE_BTN}

    Wait Until Element Is Visible    ${QR_MODE_BTN}    15s
    Click Element    ${QR_MODE_BTN}

    Pause Execution    กรุณาสแกน QR Code ด้วย LINE แล้วกด OK เพื่อดำเนินการต่อ

    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${LINE_CONFIRM_BTN}    10s
    Run Keyword And Ignore Error    Click Element    ${LINE_CONFIRM_BTN}

Open Health Check-up History Page
    # Step 1: กดหน้า / การ์ดบริการ
    Wait Until Element Is Visible    ${SERVICE_CARD}    20s
    Click Element    ${SERVICE_CARD}

    # Step 2: กดไอคอนเข้าสู่หน้าประวัติ
    Wait Until Element Is Visible    ${HISTORY_ICON}    20s
    Click Element    ${HISTORY_ICON}

    # Step 3: กดปุ่ม "ตรวจสอบประวัติของแอคเค้านี้"
    Wait Until Element Is Visible    ${CHECK_HISTORY_BTN}    20s
    Click Element    ${CHECK_HISTORY_BTN}

    Page Should Contain    ประวัติ

*** Test Cases ***
F01_Login
    [Documentation]    ทดสอบการเข้าสู่ระบบด้วย LINE QR Code (Manual Scan)
    Login With LINE (QR Code)
    Log    Login success

F02_View_Health_Checkup_History
    [Documentation]    ทดสอบการดูประวัติการตรวจสุขภาพ
    Open Health Check-up History Page
    Log    View Health Check-up History success
