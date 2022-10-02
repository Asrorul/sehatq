***Variables***
${entryProfilData}          id=com.she.sehatq:id/tvDetailProfile
${editBtn}                  id=com.she.sehatq:id/btnEdit
${fieldName}                xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/androidx.appcompat.widget.LinearLayoutCompat[1]/androidx.appcompat.widget.LinearLayoutCompat/android.view.ViewGroup/android.widget.EditText
${suuccessModal}            id=com.she.sehatq:id/fragment_history_menu_bottom
${btnSaveChanges}           id=com.she.sehatq:id/btnSave

***Keywords***
Landing on edit profile page
    Wait Until Element is Visible         ${entryProfilData}
    Click Element                         ${entryProfilData}
    Sleep                                 5s
    Swipe Up Screen 
    Wait Until Element is Visible         ${editBtn}    
    Click Element                         ${editBtn}

change name to ${name}
    Input Text                            ${fieldName}              ${name}

Submit changes
    Swipe Up Screen
    Wait Until Element is Visible         ${btnSaveChanges}
    Click Element                         ${btnSaveChanges}

validate success
    Element Should be Visible               ${suuccessModal} 
