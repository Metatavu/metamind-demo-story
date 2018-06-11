== ask_for_email_address ==
    Anna sähköpostiosoitteesi, niin sinuun otetaan yhteyttä.
    
    ::SET_REPROMPT Anna sähköposti muodossa esko@esimerkki.fi
    + GaveEmail -> email_given
-> END

== re_ask_for_email_address ==
    Anna sähköpostiosoitteesi uudelleen.
    
    ::SET_REPROMPT Anna sähköposti muodossa esko@esimerkki.fi
    + GaveEmail -> email_given
-> END

== email_given ==
    Annoit osoitteen: {email} <br/><br/>
    
    Onko tämä oikein?
    
    ::ADD_QUICK_REPLY Kyllä
    ::ADD_QUICK_REPLY Ei
    + Yes -> send_email
    + No -> re_ask_for_email_address
-> END

== send_email ==
    ::SEND_EMAIL subject:Uusi yhteydenottopyyntö chatbotilta,content:jeejee,address:ville.koivukangas12@gmail.com
    
    Yhtydenottopyyntö jätetty. Haluatko viellä jutella jostakin?
    ::ADD_QUICK_REPLY Kyllä
    ::ADD_QUICK_REPLY En
    + Yes -> show_subjects
    + No -> end_conversation
-> END

== ask_if_wants_to_get_contacted == 
    Haluatko, että metatavun edustaja ottaa sinuun yhteyttä?
    
    + Yes -> ask_for_email_address
    + No -> end_conversation
-> END