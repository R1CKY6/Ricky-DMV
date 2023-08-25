Config = {}

Config.DMVSchool = {
    vector3(240.7489, -1379.575, 33.74177)
}

Config.Language = "it"

Config.SpeedMultiplier = 3.6 -- 3.6 for kmh, 2.236936 for mph

Config.MaxErrors = 3 -- Max errors before fail

Config.MarkerSettings = {
    type = 2,
    size = vector3(1.0, 1.0, 1.0),
    color = vector3(255, 255, 255),
    rotate = false,
    dump = false
}

Config.PuntiMinimi = 5 -- Minimum points to pass the theory test

-- ATTENTION: Modifying the id after a user has already obtained a license causes them to be lost
Config.License = {
    {
        label = 'License A',
        id = 'drive_bike',
        img = 'bike.png',
        pricing = {
            theory = 3000,
            practice = 4000
        },
        vehicle = {
            model = 'faggio',
            coords = vector3(231.2591, -1392.982, 30.50785),
            heading = 144.40260314941,
            plate = "DMV1"
        }
    },
    {
        label = 'License B',
        id = 'drive',
        img = 'car.png',
        pricing = {
            theory = 3000,
            practice = 4000
        },
        vehicle = {
            model = 'blista',
            coords = vector3(231.2591, -1392.982, 30.50785),
            heading = 144.40260314941,
            plate = "DMV1"
        }
    },
    {
        label = 'License C',
        id = 'drive_truck',
        img = 'truck.png',
        pricing = {
            theory = 3000,
            practice = 4000
        },
        vehicle = {
            model = 'pounder',
            coords = vector3(231.2591, -1392.982, 30.50785),
            heading = 144.40260314941,
            plate = "DMV1"
        }
    }
}

Config.PracticeCoords = {
    [1] = {
        {
            coordinate = vector3(227.1181, -1399.691, 30.1),
            speedLimit = 50
        },
        {
            coordinate = vector3(183.7479, -1394.595, 29.05295),
            speedLimit = 50
        },
        {
            coordinate = vector3(210.3608, -1327.127, 29.16619),
            speedLimit = 50
        },
        {
            coordinate = vector3(217.6466, -1145.248, 29.3349),
            speedLimit = 50
        },
        {
            coordinate = vector3(83.13854, -1136.699, 29.15778),
            speedLimit = 50
        },
        {
            coordinate = vector3(55.52874, -1248.127, 29.34311),
            speedLimit = 50
        },
        {
            coordinate = vector3(82.69904, -1338.678, 29.3447),
            speedLimit = 50
        },
        {
            coordinate = vector3(131.4893, -1387.581, 29.28993),
            speedLimit = 50
        },
        {
            coordinate = vector3(220.603, -1445.61, 29.24681),
            speedLimit = 50
        },
        {
            coordinate = vector3(242.2584, -1536.136, 29.24705),
            speedLimit = 50
        },
        {
            coordinate = vector3(301.6448, -1523.68, 29.34156),
            speedLimit = 50
        },
        {
            coordinate = vector3(256.1726, -1445.458, 29.24207),
            speedLimit = 50
        },
        {
            coordinate = vector3(233.427, -1397.215, 30.5071),
            speedLimit = 50
        },
    }
}


Config.Question = {
    [1] = {
        {
            label = "Qual è il colore del segnale di divieto?",
            options = {
                {
                    label = "Rosso",
                    correct = true
                },
                {
                    label = "Blu",
                    correct = false
                },
                {
                    label = "Giallo",
                    correct = false
                }
            }
        },
        {
            label = "Cosa indica il segnale stradale a forma di triangolo?",
            options = {
                {
                    label = "Incrocio a tre vie",
                    correct = false
                },
                {
                    label = "Dare la precedenza",
                    correct = true
                },
                {
                    label = "Senso unico",
                    correct = false
                }
            }
        },
        {
            label = "Cosa significa una linea continua sul bordo della strada?",
            options = {
                {
                    label = "Si può sorpassare",
                    correct = false
                },
                {
                    label = "No sorpasso",
                    correct = true
                },
                {
                    label = "Sorpasso consentito solo a destra",
                    correct = false
                }
            }
        },
        {
            label = "Qual è il limite di velocità in una zona urbana?",
            options = {
                {
                    label = "50 km/h",
                    correct = true
                },
                {
                    label = "70 km/h",
                    correct = false
                },
                {
                    label = "90 km/h",
                    correct = false
                }
            }
        },
        {
            label = "Cosa significa il segnale di pericolo con una macchina fotografica?",
            options = {
                {
                    label = "Zona di parcheggio",
                    correct = false
                },
                {
                    label = "Zona di divieto di sosta",
                    correct = false
                },
                {
                    label = "Controllo elettronico della velocità",
                    correct = true
                }
            }
        },
        {
            label = "Qual è la distanza minima di sicurezza da mantenere dal veicolo che precede?",
            options = {
                {
                    label = "1 metro",
                    correct = false
                },
                {
                    label = "2 secondi di distanza",
                    correct = true
                },
                {
                    label = "0,5 metri",
                    correct = false
                }
            }
        },
        {
            label = "Cosa deve fare un conducente quando si avvicina a un passaggio a livello con le barriere chiuse?",
            options = {
                {
                    label = "Accelerare per attraversare prima che le barriere si chiudano completamente",
                    correct = false
                },
                {
                    label = "Attraversare solo se non ci sono treni in arrivo",
                    correct = true
                },
                {
                    label = "Suonare il clacson e procedere",
                    correct = false
                }
            }
        },
        {
            label = "Cosa rappresenta il segnale di stop?",
            options = {
                {
                    label = "Dare la precedenza",
                    correct = false
                },
                {
                    label = "Obbligo di fermarsi",
                    correct = true
                },
                {
                    label = "Senso unico",
                    correct = false
                }
            }
        },
        {
            label = "Cosa indica il segnale con una freccia verde rivolta verso l'alto?",
            options = {
                {
                    label = "Percorso consentito solo per biciclette",
                    correct = false
                },
                {
                    label = "Percorso consentito solo per pedoni",
                    correct = true
                },
                {
                    label = "Percorso riservato ai veicoli pubblici",
                    correct = false
                }
            }
        },
        {
            label = "Cosa rappresenta il segnale con una croce di Sant'Andrea (X rossa su sfondo bianco)?",
            options = {
                {
                    label = "Zona ad accesso limitato",
                    correct = true
                },
                {
                    label = "Zona di sosta consentita",
                    correct = false
                },
                {
                    label = "Zona pedonale",
                    correct = false
                }
            }
        }
    },
    [2] = {
        {
            label = "Cosa indica il segnale di divieto di accesso?",
            options = {
                {
                    label = "Obbligo di dare la precedenza",
                    correct = false
                },
                {
                    label = "Divieto di transito",
                    correct = true
                },
                {
                    label = "Sorpasso obbligatorio",
                    correct = false
                }
            }
        },
        {
            label = "Cosa deve fare un conducente quando si avvicina a un incrocio non regolato da segnali?",
            options = {
                {
                    label = "Accelerare per attraversare rapidamente",
                    correct = false
                },
                {
                    label = "Fermarsi, dare la precedenza e procedere con cautela",
                    correct = true
                },
                {
                    label = "Suonare il clacson per avvisare gli altri conducenti",
                    correct = false
                }
            }
        },
        {
            label = "Cosa indica il segnale di curva pericolosa a sinistra?",
            options = {
                {
                    label = "Prossimità di un'area di sosta",
                    correct = false
                },
                {
                    label = "Presenza di un incrocio",
                    correct = false
                },
                {
                    label = "Presenza di una curva a sinistra pericolosa",
                    correct = true
                }
            }
        },
        {
            label = "Cosa indica il segnale di fine divieto di sorpasso?",
            options = {
                {
                    label = "Si può iniziare un sorpasso",
                    correct = true
                },
                {
                    label = "Divieto di sosta",
                    correct = false
                },
                {
                    label = "Fine dell'autostrada",
                    correct = false
                }
            }
        },
        {
            label = "Cosa rappresenta il segnale di attraversamento pedonale?",
            options = {
                {
                    label = "Attraversamento consentito solo per biciclette",
                    correct = false
                },
                {
                    label = "Divieto di attraversamento per i pedoni",
                    correct = false
                },
                {
                    label = "Punto in cui i pedoni possono attraversare in sicurezza",
                    correct = true
                }
            }
        },
        {
            label = "Cosa indica il segnale di fine zona a traffico limitato?",
            options = {
                {
                    label = "Inizio di una zona a traffico limitato",
                    correct = false
                },
                {
                    label = "Fine di una zona di parcheggio",
                    correct = false
                },
                {
                    label = "Fine della zona in cui le restrizioni di accesso sono in vigore",
                    correct = true
                }
            }
        },
        {
            label = "Cosa rappresenta il segnale di divieto di transito ai veicoli a motore?",
            options = {
                {
                    label = "Obbligo di dare la precedenza",
                    correct = false
                },
                {
                    label = "Divieto di transito solo per i camion",
                    correct = false
                },
                {
                    label = "Divieto di transito per tutti i veicoli a motore",
                    correct = true
                }
            }
        },
        {
            label = "Cosa deve fare un conducente quando si avvicina a un semaforo con luce gialla lampeggiante?",
            options = {
                {
                    label = "Accelerare per passare prima che cambi il segnale",
                    correct = false
                },
                {
                    label = "Fermarsi solo se ci sono veicoli che attraversano l'incrocio",
                    correct = true
                },
                {
                    label = "Proseguire senza rallentare",
                    correct = false
                }
            }
        },
        {
            label = "Cosa indica il segnale di divieto di accesso ai pedoni?",
            options = {
                {
                    label = "Divieto di transito solo per i ciclisti",
                    correct = false
                },
                {
                    label = "Divieto di transito solo per i pedoni",
                    correct = true
                },
                {
                    label = "Obbligo di attraversare solo in bicicletta",
                    correct = false
                }
            }
        },
        {
            label = "Cosa indica il segnale di divieto di transito per i veicoli trainanti?",
            options = {
                {
                    label = "Divieto di transito solo per i camper",
                    correct = false
                },
                {
                    label = "Divieto di transito per i veicoli trainati",
                    correct = true
                },
                {
                    label = "Obbligo di trainare un rimorchio",
                    correct = false
                }
            }
        }
    }
}

Config.Lang = {
    ['it'] = {
        ['speed_error'] = "Vai troppo veloce, rallenta!",
        ['open_dmv'] = "Premi ~INPUT_CONTEXT~ per aprire la scuola guida",
        ['dmv'] = "SCUOLA GUIDA",
        ['point'] = "PUNTEGGIO",
        ['error'] = "ERRORI",
        ['ok'] = "Avanti",
        ['start_theory'] = "Inizia il Test Teorico",
        ['theory_before'] = "Fai il test teorico",
        ['start_practice'] = "Inizia il Test Pratico",
        ['test_passed'] = "Test Passato!",
        ['already_done'] = "Hai già fatto questo test!",
        ['theory_success'] = "Congratulazioni, hai passato il test teorico, torna presto per il test pratico!",
        ['theory_error'] = "Ci dispiace comunicarti che non hai passato il test teorico, non demordere, torna presto più preparato e riprova il test!",
        ['practice_success'] = "Congratulazioni, hai passato il test pratico, sei ora un guidatore con la patente!",
        ['practice_error'] = "Ci dispiace comunicarti che non hai passato il test pratico, non demordere, torna presto più preparato e riprova il test!",
        ['money_error'] = "Non hai abbastanza soldi per fare questo test! Ti mancano %s€"
    },
    ['en'] = {
        ['speed_error'] = "You are going too fast, slow down!",
        ['open_dmv'] = "Press ~INPUT_CONTEXT~ to open the DMV",
        ['dmv'] = "DMV SCHOOL",
        ['point'] = "POINT",
        ['error'] = "ERROR",
        ['ok'] = "Ok",
        ['start_theory'] = "Start the Theory Test",
        ['theory_before'] = "Take the theory test",
        ['start_practice'] = "Start the Practice Test",
        ['test_passed'] = "Test Passed!",
        ['already_done'] = "You have already done!",
        ['theory_success'] = "Congratulations, you passed the theory test, come back soon for the practical test!",
        ['theory_error'] = "We are sorry to inform you that you did not pass the theory test, do not give up, come back soon more prepared and try the test again!",
        ['practice_success'] = "Congratulations, you passed the practical test, you are now a licensed driver!",
        ['practice_error'] = "We are sorry to inform you that you did not pass the practical test, do not give up, come back soon more prepared and try the test again!",
        ['money_error'] = "You don't have enough money to do this test! You are missing %s€"
    }
}

-- Functions --

onCompleteTheory = function(license)
    TriggerServerEvent('ricky-dmv:givelicense', license) -- Give license to sql
end

onCompletePractice = function(license)
    TriggerServerEvent('ricky-dmv:givelicense', license) -- Give license to sql
end