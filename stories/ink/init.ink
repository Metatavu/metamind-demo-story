
== init ==
    ::SET_LONG_TERM_ATTR name::authorizationToken value::Basic MWEwZWNmMTMtOTFiNy00YmEyLWE2MWItZGRlYTZkNzBhNGQwOjBmNGZlYmJlLWMyYzgtNDU1Yy1iZDIxLTljYmJkYmUyZWE5Yg==

    Terve! Olen Metatavu botti. Pyrin olemaan mahdollisimman helppo juttelukaveri, mutta jos olen hämmentävä niin pyydä rohkeasti apua. 

    Toimin MetaMind-rajapintapalvelun avulla ja tehtäväni on kertoa itsestäni ja Metatavun projekteista. Yksi projekteista on KuntaAPI. Haluaisitko jutella tästä?
    
    ::SET_REPROMPT Anteeksi en ymmärtänyt. Vastaa Kyllä tai en.
    
    ::ADD_QUICK_REPLY Kyllä
    ::ADD_QUICK_REPLY En
    + Yes -> introduce_kuntaApi
    + No -> show_subjects
-> END