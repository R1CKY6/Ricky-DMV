const app = new Vue({
    el: '#app',

    data: {

        nomeRisorsa : GetParentResourceName(),

        schermata : 'license',

        domande : [],

        license : [],

        userLicense : [],

        currentQuestions : false,

        currentQuestion : {},

        selectedIndex : false,

        licenseSelected : false,

        correctAnswers : 0,

        descriptionTitle : "",

        puntiMinimi : 1,

        facendoTeoria : false,
        facendoPratica : false,

        config : [],

        contanti : 0,
        banca : 0
    },

    methods: {
        postMessage(type, data) {
            $.post(`https://${this.nomeRisorsa}/${type}`, JSON.stringify(data));
        },

        checkLicense(license) {
            for(const[k,v] of Object.entries(this.userLicense)) {
                if(v.id == license) {
                    if(v.theory && !v.practice) {
                        return "practice"
                    } else if(v.theory && v.practice) {
                        return "none"
                    } else {
                        return "theory"
                    }
                }
            }
            return false;
        },

        getNotAttr() {
            var cosi = []
            for(const[k,v] of Object.entries(this.currentQuestions)) {
                if(!v.attr) {
                    cosi.push(k)
                }
            }
            return cosi
        },

        updateQuestion(disableupdate, controllocheck) {
            $("input[type='radio']").prop('checked', false);
            if(!disableupdate) {
                if(this.selectedIndex != false) {
                    if(this.currentQuestion.options[this.selectedIndex].correct) {
                        this.correctAnswers = this.correctAnswers + 1
                    }
                }
            }

            if(this.getNotAttr().length == 0) {
                this.currentQuestion = false
                this.updateSchermata('risultato')
                this.selectedIndex = false
                if(this.correctAnswers >= this.puntiMinimi) {
                    this.postMessage('theoryOk', {
                        license : this.licenseSelected
                    })
                    this.licenseSelected = false
                    this.descriptionTitle = "Congratulazioni, hai passato il test teorico, torna tra poco per effettuare il test pratico!"
                } else {
                    this.descriptionTitle = "Ci spiace comunicarti che non hai passato il test teorico, non abbatterti, torna tra poco più preparato e ritenta il test!"
                }
                for(const[k,v] of Object.entries(this.currentQuestions)) {
                    v.attr = false
                }
                return
            }
            var randomNumber = Math.floor(Math.random() * this.domande.length);
            for(const[k,v] of Object.entries(this.currentQuestions)) {
                if(k == randomNumber && v.attr) {
                    this.updateQuestion(true)
                    return
                }
            }
            for(const[k,v] of Object.entries(this.currentQuestions)) {
                if(k == randomNumber) {
                    v.attr = true
                    this.currentQuestion = this.domande[randomNumber]
                    this.descriptionTitle = this.currentQuestion.label
                }
            }
            this.updateSelectedQuestion(false)
        },  

        updateSelectedQuestion(index) {
            this.selectedIndex = index
        },

        startTheory(id, question) {
            for(const[k,v] of Object.entries(this.license)) {
                if(v.id == id) {
                    if(this.contanti >= v.pricing.theory) {
                        this.postMessage('removeMoney', {
                            account : "money",
                            amount : v.price
                        })
                    } else if(this.banca >= v.pricing.theory) {
                        this.postMessage('removeMoney', {
                            account : "bank",
                            amount : v.price
                        })
                    } else {
                        var missingMoney = v.pricing.theory - this.contanti
                        this.descriptionTitle = this.config.Lang.money_error.replace("%s", missingMoney)
                        setTimeout(() => {
                            this.descriptionTitle  = ""
                        }, 5000);
                        return
                    }
                }
            }
            this.facendoTeoria = true
            this.facendoPratica = false
            this.licenseSelected = id+"dmv"
            this.correctAnswers = 0
            this.updateSchermata('theory')
            for(const[k,v] of Object.entries(question)) {
                v.attr = false
            }
            this.currentQuestions = question
            this.correctAnswers = 0
            this.updateQuestion()
        },

        startPractice(id) {
            for(const[k,v] of Object.entries(this.license)) {
                if(v.id == id) {
                    if(this.contanti >= v.pricing.practice) {
                        this.postMessage('removeMoney', {
                            account : "money",
                            amount : v.price
                        })
                    } else if(this.banca >= v.pricing.practice) {
                        this.postMessage('removeMoney', {
                            account : "bank",
                            amount : v.price
                        })
                    } else {
                        var missingMoney = v.pricing.practice - this.contanti
                        this.descriptionTitle = this.config.Lang.money_error.replace("%s", missingMoney)
                        setTimeout(() => {
                            this.descriptionTitle  = ""
                        }, 5000);
                        return
                    }
                }
            }
            this.licenseSelected = id
            this.facendoTeoria = false 
            this.facendoPratica = true
            $("#app").fadeOut(800)
            this.postMessage("close")
            this.postMessage('startPractice', {
                license : id
            })   
        },

        updateDescription(msg) {
            this.descriptionTitle = msg
        },

        close() {
            this.facendoPratica = false
            this.facendoTeoria = false
            $("#app").fadeOut(800)
            this.postMessage("close")
        },

        updateSchermata(sch) {
            this.schermata = sch
            if(sch == "license") {
                this.updateDescription("")
                this.facendoTeoria = false
                this.facendoPratica = false
            }
        }
    }

});

window.addEventListener('message', function(event) {
    var data = event.data;
    if (data.type === "OPEN") {
        $("#app").fadeIn(500)
        app.userLicense = data.licenses
        app.license = data.license
        app.updateSchermata('license')
    } else if(data.type === "UPDATE_LICENSE") {
        app.userLicense = data.licenses
    } else if(data.type === "DISPLAY_RISULTATO") {
        $("#app").fadeIn(800)
        app.correctAnswers = data.errori
        app.updateSchermata('risultato')
        app.facendoPratica = true
        app.facendoTeoria = false
        if(data.errori >= app.config.MaxErrors) {
            app.descriptionTitle = "Ci spiace comunicarti che non hai passato il test pratico, non abbatterti, torna tra poco più preparato e ritenta il test!"
        } else {
            app.descriptionTitle = "Congratulazioni, hai passato il test pratico!"
            app.postMessage('practiceOk', {
                license : app.licenseSelected
            })
        }
    } else if(data.type === "SET_CONFIG") {
        app.config = data.config
        var randomNumber = Math.floor(Math.random() * data.config.Question.length);
        app.domande = data.config.Question[randomNumber]
        app.config.Lang = app.config.Lang[app.config.Language]
        app.puntiMinimi = data.config.PuntiMinimi
    } else if(data.type === "SET_MONEY") {
        app.contanti = data.contanti,
        app.banca = data.banca
    }
})

document.onkeyup = function (data) {
    if (data.key == 'Escape' && app.schermata == 'license') {
        $("#app").fadeOut(800)
        app.postMessage("close")
    }
};