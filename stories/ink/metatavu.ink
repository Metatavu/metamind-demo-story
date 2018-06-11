== discuss_about_metatavu == 
    ::KUNTA_API_GET_RANDOM_NUMBER scale::3 var::randomNumber
    ::GET_LONG_TERM_ATTR name::CHECKPOINT var::currentCheckPoint
    
    {
        - currentCheckPoint == "discuss_about_metatavu":
            {
                - randomNumber == 0:
                    Taidettiin jäädä aiheeseen Metatavu. Voin parhaani mukaan vastata kysymyksiisi, vai haluatko, että kerron tiivistetysti kaiken oleellisen?
                - randomNumber == 1:
                    Mihin me nyt jäätiin? Ainiin, juteltiin Metatavusta. Onko sulla jotakin kysyttävää vai haluatko, että kerron sinulle tiivistetysti kaiken oleellisen Metatavusta?
                - randomNumber == 2:
                    Ainiin halusit jutella Metatavusta. Mitä haluaisit tietää siitä? Vai haluatko, että kerron sinulle tiivistetysti kaiken oleellisen?
            }
        - else:
            {
                - randomNumber == 0:
                    Okei jutellaan Metatavusta. Voin parhaani mukaan vastata kysymyksiisi, vai haluatko, että kerron tiivistetysti kaiken oleellisen?
                - randomNumber == 1:
                    Mitä haluaisit tietää Metatavusta? Vai haluatko, että kerron sinulle tiivistetysti kaiken oleellisen?
                - randomNumber == 2:
                    Selvä! Voin parhaani mukaan vastata kysymyksiisi, vai haluatko, että kerron tiivistetysti kaiken oleellisen?
            }
    }
    
    ::SAVE_CHECKPOINT knotname::discuss_about_metatavu
    ::SET_REPROMPT Anteeksi en ymmärtänyt. Esitä kysymys tai vastaa kyllä.
    
    ::ADD_QUICK_REPLY Kyllä
    ::ADD_QUICK_REPLY Milloin perustettu?
    + WhenFounded -> discuss_about_metatavu
    + Yes -> introduce_metatavu
-> END

== introduce_metatavu ==
    Metatavu on vuonna 2016 perustettu ohjelmistokehitykseen erikoistunut yritys. Metatavu toteuttaa open source -pohjaisia ohjelmistoprojekteja asiakkaan todelliseen tarpeeseen. Tällä hetkellä yritys pyörii viiden ihmisen voimin. Paremmin en osaa nyt tiivistää, mutta lisätietoa toiminnasta näet selailemalla verkkosivuja! Haluatko viellä keskustella jostakin?
    
    ::SAVE_CHECKPOINT knotname::discuss_about_metatavu
    + Yes -> show_subjects
    + No -> ask_if_wants_to_get_contacted
    + TellMore -> no_more_to_tell
-> END

== no_more_to_tell ==
    En valitettavasti osaa kertoa enempää. Voit katsella lisätietoa Metatavun verkkosivuilta tai ottamalla yhteyttä. Haluatko jättää sähköpostiosoitteesi, jotta sinuun otetaan yhteyttä?
    
    + Yes -> ask_for_email_address
    + No -> show_subjects
-> END



