== show_subjects ==
    ::KUNTA_API_GET_RANDOM_NUMBER scale::3 var::randomNumber
    
    {
        - randomNumber == 0:
            Mistä haluaisit jutella?
        - randomNumber == 1:
            Mistä sitten juteltais?
        - randomNumber == 2:
            Mistä jutellaan seuraavaksi?
    }
    
    ::SAVE_CHECKPOINT knotname::show_subjects
    ::SET_REPROMPT Anteeksi en ymmärtänyt. Osaan keskustella Metatavusta ja KuntaAPI:sta.
    
    ::ADD_QUICK_REPLY Metatavusta
    ::ADD_QUICK_REPLY KuntaAPI:sta
    + Metatavu -> discuss_about_metatavu
    + KuntaApi -> introduce_kuntaApi
-> END

== end_conversation == 
    Kiitos juttuseurasta!
-> END

== back_to_subject ==
    ::GO_TO_CHECKPOINT
-> END