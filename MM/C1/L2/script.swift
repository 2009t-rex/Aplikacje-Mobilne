func written(whatAsk: String)  -> String{
    print("Podaj \(whatAsk): ")
    let askedThing: String = readLine() ?? "nothing"

    print("Twoje \(whatAsk) to: \(askedThing)")
    return askedThing
}

// 1. pobierz od użytkownika imię i sprawdź czy jest kobietą czy mężczyzną
// 	założenie: kobiece imiona kończą się literą "a" (ujmij wyjątki: KOSMA, BARNABA, KUBA)

func MaleOrFemale() {
    let exceptions = ["KUBA", "KOSMA", "BARNABA"]
    let name = written(whatAsk: "imie")
    let ending = name.suffix(1)
    var male = true

    if(ending == "a"){
        for man in exceptions{
            if (name.lowercased() == man.lowercased()){
                male = true
                break
            }else{
                male = false
            }
        }
    }
    if(male){
        print("Witaj mężczyzną o imieniu \(name).")
    }
    else{
        print("Witaj kobieto o imieniu \(name).")
    }
}

// 2. pobierz od użytkownika słowo i napisz algorytm, który zaszyfruje je metodą szyfru płotkowego o dwóch rzędach.
	// np. dla słowa łączność

	// ł c n ś
	//  ą z o ć

	// otrzymujemy zaszyfrowane słowo: łcnśązoć.

	// a dla słowa programowanie

	// p o r m w n e
	//  r g a o a i

	// otrzymamy: pormwnergaoai

func szyfrowaniePlotkowe() {
    var wordToCode = written(whatAsk: "co szyfrujesz")
    var everySecondLetter = ""
    var codedWord = ""

    while wordToCode != ""{
        let letter = wordToCode.prefix(1)
        print(letter, terminator: " ")
        wordToCode.removeFirst()
        codedWord += letter
        if(wordToCode.prefix(1) != ""){
            everySecondLetter += wordToCode.prefix(1)
            wordToCode.removeFirst()
        }
    }
    print("\n", terminator: " ")
    while everySecondLetter != ""{
        let letter = everySecondLetter.prefix(1)
        print(letter, terminator: " ")
        everySecondLetter.removeFirst()
        codedWord += letter
    }
    print("\nZaszyfrowane słowo: \(codedWord).")
}

// 3. pobierz od użytkownika PESEL - wiki
// 	- sprawdź jego poprawność (jeśli zły stosowna informacja) 
// 	- wypisz pochodzące z niego informacje tj: 
// 		a) płeć (M/K)
// 		b) datę urodzenia (weź pod uwagę różne stulecia)

func checkPesel() {
    let Pesel: String = written(whatAsk: "PESEL")
    var isValidPesel = true

    if (Pesel.count != 11){
        isValidPesel = false
    }
    for number in Pesel{
        if (!number.isNumber){
            isValidPesel = false
            break
        }
    }
    if !isValidPesel{
        print("Nie prawidłowy PESEL.")
        return
    }
    var helpGender = Pesel.suffix(2)
    helpGender.removeLast()
    let gender: Int! = Int(helpGender)
    if(gender%2 == 0){
        print("Jesteś kobietą")
    } else{
        print("Jesteś chłop")
    }
    var birth = Pesel.prefix(6)
    let year = birth.prefix(2)
    birth.removeFirst()
    birth.removeFirst()
    let helpMonth: Int! = Int(birth.prefix(2))
    let month = helpMonth%20
    var century: Int! = Int(helpMonth/20)
    switch century{
        case 0:
            century = 19
        case 1:
            century = 20
        case 2:
            century = 21
        case 3:
            century = 22
        case 4:
            century = 18
        default:
            century = 0
    }
    birth.removeFirst()
    birth.removeFirst()
    let day = birth.prefix(2)
    print("Urodziłeś się \(day).\(month).\(Int(century))\(year).")
}

// 4. dodaj menu wyboru zadania (zapętlone). Wyjście z menu na znak "k".

func Menu(){
    var running = true
    while running{
        print("""
        Witaj!!!
        Co chesz dzisiaj robić?
        1. Sprawdzić po imieniu płeć
        2. Szyfrować płotkowo
        3. Sprawdzić PESEL
        4. Wyjście (Wpisz: k)
        """)
        let choice: String = String(readLine() ?? "nothing")
        switch choice {
            case "1":
                print("Wybrano opcje \(choice)")
                MaleOrFemale()
            case "2":
                print("Wybrano opcje \(choice)")
                szyfrowaniePlotkowe()
            case "3":
                print("Wybrano opcje \(choice)")
                checkPesel()
            case "k":
                running = false
                print("Żegnaj :C")
            default:
                print("Niepoprawny wybór")
        }
    }
}

Menu()