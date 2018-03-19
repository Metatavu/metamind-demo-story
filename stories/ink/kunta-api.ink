== introduce_kuntaApi ==
    KuntaAPI on rajapintapalvelu, joka yhdistää kunnan käyttämät eri tietolähteet samaan avoimeen rajapintaan. Rajapinnan kautta esim. PTV (palvelutietovaranto), päätösasiakirjat, tapahtumatiedot jne. ovat www-sivujen käytettävissä. KuntaAPIn voi ottaa käyttöön joko pelkkänä rajapintapalveluna tai kokonaisratkaisuna, jolloin APIn ympärille rakennetaan esim. www-sivut tai muu applikaatio. KuntaAPIn ensimmäinen versio toteutettiin Mikkelin kaupungin LUPAUS2016 -ohjelman yhteydessä.
    
    ::SAVE_CHECKPOINT knotname::introduce_kuntaApi
    ::SET_REPROMPT Anteeksi en ymmärtänyt. Voit kysyä esim. "Mitä sillä voi tehdä?"
    ::ADD_QUICK_REPLY Mitä sillä voi tehdä?
    + WhatProductCanDo -> ask_if_wants_to_see_events
-> END

== ask_if_wants_to_see_events ==
    ::GET_LONG_TERM_ATTR name::CHECKPOINT var::currentCheckPoint
    ::KUNTA_API_GET_RANDOM_NUMBER scale::3 var::randomNumber
    
    {
        - currentCheckPoint == "ask_if_wants_to_see_events":
            {
                - randomNumber == 0:
                    Haluan nyt näyttää, että osaan hakea tapahtumia! Haluatko nähdä?
                - randomNumber == 1:
                    Haluaisitko nyt katsella tapahtumia?
                - randomNumber == 2:
                    Katsotaanko nyt mitä tapahtumia löytyy?
            }
        - else:
            {
                - randomNumber == 0:
                    KuntaAPIn avulla voi hakea mm. Mikkelin ja Mäntyharjun tapahtumia. Jopa minä osaan tehdä sen. Haluatko kokeilla?
                - randomNumber == 1:
                    Sillä voi hakea mm. uutisia, bussiaikatauluja, työpaikkoja, tapahtumia ja paljon muuta. Minä osaan hakea tapahtumia Mikkelistä ja Mäntyharjulta. Haluatko nähdä?
                - randomNumber == 2:
                    KuntaAPI:n avulla voidaan hakea vaikkapa uutisia, bussiaikatauluja, työpaikkoja, tapahtumia ja paljon muuta. Jopa minä osaan hakea tapahtumia Mikkelistä ja Mäntyharjulta. Haluatko nähdä?
            }
    }
    
    ::SAVE_CHECKPOINT knotname::ask_if_wants_to_see_events
    ::SET_REPROMPT Anteeksi en ymmärtänyt. Vastaa kyllä tai ei.
    
    ::ADD_QUICK_REPLY Kyllä
    + Yes -> ask_which_city
-> END

== ask_which_city ==
    ::GET_LONG_TERM_ATTR name::CHECKPOINT var::currentCheckPoint
    ::KUNTA_API_GET_RANDOM_NUMBER scale::3 var::randomNumber
    
    rand {randomNumber} ..
    {
        - currentCheckPoint == "ask_which_city":
            {
                - randomNumber == 0:
                    Mihinkäs me jäätiin? Ainiin, haluatko hakea tapahtumia Mikkelistä vai Mäntyharjulta?
                - randomNumber == 1:
                    Noniin, halusitkos tapahtumia Mikkelistä vai Mäntyharjulta?
                - randomNumber == 2:
                    Eli haetaanko tapahtumia Mikkelistä vai Mäntyharjulta?
            }
        - else:
            {
                - randomNumber == 0:
                    Mahtavaa! Haluatko nähdä tapahtumia Mikkelistä vai Mäntyharjulta?
                - randomNumber == 1:
                    Osaan hakea tapahtumat Mikkelistä ja Mäntyharjulta. Kummasta haetaan?
                - randomNumber == 2:
                    Haetaanko Mikkelistä vai Mäntyharjulta?
            }
    }
    
    ::SAVE_CHECKPOINT knotname::ask_which_city
    ::SET_REPROMPT Anteeksi en ymmärtänyt. Haluatko nähdä tapahtumia Mikkelistä vai Mäntyharjulta?
    
    ::ADD_QUICK_REPLY Mikkelistä
    ::ADD_QUICK_REPLY Mäntyharjulta
    + Mikkeli -> set_city_to_mikkeli
    + Mantyharju -> set_city_to_mantyharju
-> END

== set_city_to_mikkeli ==
    ~ organizationId = "f7afad08-7a19-4693-a11f-7daeb6991fde"
    ~ currentCity = "Mikkeli"
    -> get_events
-> END

== set_city_to_mantyharju == // TODO: vaihda oikea id
    ~ organizationId = "f7afad08-7a19-4693-a11f-7daeb6991fde"
    ~ currentCity = "Mantyharju"
    -> get_events
-> END

== ask_if_wants_to_change_city ==
    ::GET_LONG_TERM_ATTR name::CHECKPOINT var::currentCheckPoint
    ::KUNTA_API_GET_RANDOM_NUMBER scale::3 var::randomNumber
    
    {
        - currentCheckPoint == "ask_if_wants_to_change_city":
            {
                - currentCity == "Mikkeli":
                    {
                        - randomNumber == 0:
                            Mihis me jäimmekään? Ainiin, haluatko vielläkin hakea tapahtumat Mikkelistä?
                        - randomNumber == 1:
                            Nonniin, haluatkos vielläkin hakea Mikkelistä tapahtumat?
                        - randomNumber == 2:
                            Mihin me nyt jäätiinkään? Ainiin, vielläkö haetaan tapahtumat Mikkelistä?
                    }
                - currentCity == "Mantyharju":
                    {
                        - randomNumber == 0:
                            Mihis me jäimmekään? Ainiin, haluatko vielläkin hakea tapahtumat Mäntyharjulta?
                        - randomNumber == 1:
                            Nonniin, haluatkos vielläkin hakea Mäntyharjulta tapahtumat?
                        - randomNumber == 2:
                            Mihin me nyt jäätiinkään? Ainiin, vielläkö haetaan tapahtumat Mäntyharjulta?
                    }
            }
        - else:
            {
                - currentCity == "Mantyharju":
                    {
                        - randomNumber == 0:
                            Haluatko vielläkin hakea tapahtumat Mäntyharjulta?
                        - randomNumber == 1:
                            Haluatko vielläkin hakea Mäntyharjulta tapahtumat?
                        - randomNumber == 2:
                            Vielläkö haetaan tapahtumat Mäntyharjulta?
                    }
                - currentCity == "Mikkeli":
                    {
                        - randomNumber == 0:
                            Haluatko vielläkin hakea tapahtumat Mikkelistä?
                        - randomNumber == 1:
                            Haluatko vielläkin hakea Mikkelistä tapahtumat?
                        - randomNumber == 2:
                            Vielläkö haetaan tapahtumat Mikkelistä?
                    }
            }
    }
    
    ::SAVE_CHECKPOINT knotname::ask_if_wants_to_change_city
    ::SET_REPROMPT Anteeksi en ymmärtänyt. Vastaa kyllä tai ei.
    
    ::ADD_QUICK_REPLY Kyllä
    ::ADD_QUICK_REPLY Ei
    + Yes -> get_events
    + No -> change_city
-> END

== change_city ==
    ~ cityChanged = true
    
    {
        - currentCity == "Mikkeli":
            ~ currentCity = "Mantyharju"
        - currentCity == "Mantyharju":
            ~ currentCity = "Mikkeli"
    }
    
    -> get_events
-> END

== get_events ==
    ::KUNTA_API_GET_EVENTS organizationId::{organizationId} randomResult::true maxResults::50
    ::GET_LONG_TERM_ATTR name::CHECKPOINT var::currentCheckPoint
    ::KUNTA_API_GET_RANDOM_NUMBER scale::3 var::randomNumber
    
    {
        - currentCheckPoint == "get_events":
            {
                - randomNumber == 0:
                    Mihinkäs me jäätiin? Ainiin, löysin tämän tapahtuman: {eventName}. Haluatko kuulla tästä lisää?
                - randomNumber == 1:
                    Haluatko nyt kuulla lisätietoja tapahtumasta {eventName}?
                - randomNumber == 2:
                    Taidettiin jäädä tapahtuman "{eventName}" löytymiseen. Halutako tästä lisätietoa?
            }
        - else:
            {
                - cityChanged:
                    {
                        - currentCity == "Mikkeli":
                            {
                                - randomNumber == 0:
                                    Vaihdoin kaupungin Mikkeliksi ja löysin tapahtuman nimeltä {eventName}. Haluatko kuulla tästä lisää?
                                - randomNumber == 1:
                                    Tällä kertaa hain tapahtumat Mikkelistä ja tämä vaikutti mielenkiintoiselta: {eventName}. Haluaisitko kuulla tästä lisää?
                                - randomNumber == 2:
                                    Vaihdoin Mäntyharjulta Mikkeliin ja tapahtumia löytyi taas melko läjä. Tämä vaikutti mielenkiintoiselta: {eventName}. Haluaisitko kuulla tästä lisää?
                            }
                        - currentCity == "Mantyharju":
                            {
                                - randomNumber == 0:
                                    Vaihdoin kaupungin Mäntyharjuun ja löysin tapahtuman nimeltä {eventName}. Haluatko kuulla tästä lisää?
                                - randomNumber == 1:
                                    Tällä kertaa hain tapahtumat Mäntyharjulta ja tämä vaikutti mielenkiintoiselta: {eventName}. Haluaisitko kuulla tästä lisää?
                                - randomNumber == 2:
                                    Vaihdoin Mikkelistä Mäntyharjulle ja tapahtumia löytyi taas melko läjä. Tämä vaikutti mielenkiintoiselta: {eventName}. Haluaisitko kuulla tästä lisää?
                            }
                    }
                - else:
                    {
                        - randomNumber == 0:
                            Löysin tapahtuman nimeltä {eventName}. Haluatko kuulla tästä lisää?
                        - randomNumber == 1:
                            Selailin tapahtumat läpi ja tämä vaikutti mielenkiintoiselta: {eventName}. Haluaisitko kuulla tästä lisää?
                        - randomNumber == 2:
                            Melkoinen läjä löytyi tapahtumia! Tämä vaikutti kuitenkin mielenkiintoiselta: {eventName}. Haluaisitko kuulla tästä lisää?
                    }
            }
    }
    ~ cityChanged = false
    
    ::SAVE_CHECKPOINT knotname::get_events
    ::SET_REPROMPT Anteeksi en ymmärtänyt. Vastaa kyllä tai ei.
    
    ::ADD_QUICK_REPLY Kyllä
    ::ADD_QUICK_REPLY En
    + Yes -> show_event_description
    + No -> ask_if_wants_to_see_more_events
-> END

== show_event_description == 
    {eventDescription}
    <br/><br/>
    Tapahtuma järjestetään paikassa {eventLocation}. Tiedätkö missä tämä sijaitsee?
    
    ::SAVE_CHECKPOINT knotname::show_event_description
    ::SET_REPROMPT Anteeksi en ymmärtänyt. Vastaa kyllä tai en.
    
    ::ADD_QUICK_REPLY Kyllä
    ::ADD_QUICK_REPLY En
    + No -> show_event_address
    + Yes -> ask_if_wants_to_see_more_events
-> END

== ask_if_wants_to_see_more_events ==
    Haluatko hakea lisää tapahtumia?
    
    ::SAVE_CHECKPOINT knotname::ask_if_wants_to_see_more_events
    ::SET_REPROMPT Anteeksi en ymmärtänyt. Vataa kyllä tai en.
    
    ::ADD_QUICK_REPLY Kyllä
    ::ADD_QUICK_REPLY En
    + Yes -> ask_if_wants_to_change_city
    + No -> thats_all_from_kuntaApi
-> END

== show_event_address ==
    Tässä tarkempi osoite: <br/><br/>
    {eventAddress} <br/>
    {eventZip}, {eventCity} <br/><br/>
    
    -> ask_if_wants_to_see_more_events
-> END

== thats_all_from_kuntaApi == 
    ::GET_LONG_TERM_ATTR name::CHECKPOINT var::currentCheckPoint
    ::KUNTA_API_GET_RANDOM_NUMBER scale::3 var::randomNumber
    
    {
        - currentCheckPoint == "thats_all_from_kuntaApi":
            {
                - randomNumber == 0:
                    Mihinkäs me jäätiin? Ainiin, näytin tapahtumia sulle. Siinä oli kaikki mitä osaan kertoa KuntaAPI:sta. Haluatko, että Metatavun edustaja kertoo sinulle tarkempia tietoja sähköpostitse?
                - randomNumber == 1:
                    Mihin jäätiin? Ainiin, et halunnut nähdä enäään tapahtumia. Siinä oli oikeastaan kaikki mitä osaan sanoa KuntaAPI:sta. Haluatko, että Metatavun edustaja ottaa sinuun sähköpostitse yhteyttä ja kertoo tästä lisätietoja?
                - randomNumber == 2:
                    Ainiin, et halunnut nähdä enäään tapahtumia. Siinä oli oikeastaan kaikki mitä osaan sanoa KuntaAPI:sta. Haluatko, että Metatavun edustaja ottaa sinuun sähköpostitse yhteyttä ja kertoo tästä lisätietoja?
            }
        - else:
            {
                - randomNumber == 0:
                    Siinä oli kaikki mitä osaan kertoa KuntaAPI:sta. Haluatko, että Metatavun edustaja kertoo sinulle tarkempia tietoja sähköpostitse?
                - randomNumber == 1:
                    Siinä oli oikeastaan kaikki mitä osaan sanoa KuntaAPI:sta. Haluatko, että Metatavun edustaja ottaa sinuun sähköpostitse yhteyttä ja kertoo tästä lisätietoja?
                - randomNumber == 2:
                    Siinä oli oikeastaan kaikki mitä osaan sanoa KuntaAPI:sta. Haluatko, että Metatavun edustaja ottaa sinuun sähköpostitse yhteyttä ja kertoo tästä lisätietoja?
            }
    }
    
    ::SAVE_CHECKPOINT knotname::thats_all_from_kuntaApi
    ::SET_REPROMPT Anteeksi en ymmärtänyt. Vastaa kyllä tai en.
    
    ::ADD_QUICK_REPLY Kyllä
    ::ADD_QUICK_REPLY En
    + Yes -> ask_for_email_address
    + No -> show_subjects
-> END





