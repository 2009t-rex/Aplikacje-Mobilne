print("hekki witkd")

// 2. Pobierz wartość od użytkownika i wypisz (np. dla liczby 6):
		
// 				a) XXXXXX
				
// 				b)
// 					XXXXXX
// 					X    X
// 					X    X
// 					X    X
// 					X    X
// 					XXXXXX
	
// 				c)
// 					     X
// 					    XX
// 					   X X
// 					  X  X
// 					 X   X
// 					XXXXXX
				
// 				d)
// 					1
// 					12
// 					123
// 					1234
// 					12345
// 					123456
					
// 				e)
// 					     1
// 					    21
// 					   321
// 					  4321
// 					 54321
// 					654321
					
// 				f) silnię podanej liczby
// 				g) sumę liczb parzystych w zakresie 0 do podanej lczby
// 				h) informację czy podana liczba jest pierwsza
// 				i) tabliczkę mnożenia wraz z nagłówkami np. dla 4:
// 				   1 2 3 4
// 				 1 1 2 3 4
// 				 2 2 4 6 8
// 				 3 3 6 9 12
// 				 4 4 8 12 16


func pA() {
    print("Podaj liczbę:")
    let podanaLiczba: Int! = Int(readLine() ?? "0")
    var obecnaLiczba = 0
    while obecnaLiczba <  podanaLiczba{
        print("X", terminator: "")
        obecnaLiczba += 1
    }
}

pA()

func pB() {
    print("Podaj liczbę:")
    let podanaLiczba: Int! = Int(readLine() ?? "0")
    var obecnaLiczba = 0
    while obecnaLiczba <  podanaLiczba{
        if(obecnaLiczba  == 0) || (obecnaLiczba == podanaLiczba-1){
            var i = 0
                while i <  podanaLiczba{
                    print("X", terminator: "")
                    i+=1
                }
                print()
        }else {
            var j = 0
                while j < podanaLiczba{
                    if(j == 0) || (j  == podanaLiczba-1){
                        print("X", terminator: "")
                    }
                    else{
                        print(" ", terminator: "")
                    }
                    j+=1
                }
            print()
        }
        obecnaLiczba += 1
    }
}

pB()

func pC() {
    print("Podaj liczbę:")
    let podanaLiczba: Int! = Int(readLine() ?? "0")
    var obecnaLiczba = 1
    while obecnaLiczba <  podanaLiczba{
        var i = 0
        while i < podanaLiczba{
            if(i == podanaLiczba-1){
                print("X")
            }
            else if(i == podanaLiczba - obecnaLiczba){
                print("X", terminator: "")
            }
            else{
                print("", terminator: " ")
            }
            i += 1
        }
        obecnaLiczba += 1
        if (obecnaLiczba == podanaLiczba){
            var j = 0
            while j <  podanaLiczba{
                print("X", terminator: "")
                j += 1
            }
        }
    }
}

pC()

func pD() {
    print("Podaj liczbę:")
    let podanaLiczba: Int! = Int(readLine() ?? "0")
    var obecnaLiczba = 0
    while obecnaLiczba <  podanaLiczba{
        var i = 0
        while i < podanaLiczba{
            if(i == obecnaLiczba){
                print(i+1)
            }
            else if(i < obecnaLiczba){
                print(i+1, terminator: "")
            }
            i+=1
        }
        obecnaLiczba += 1
    }
}

pD()

func pE() {
    print("Podaj liczbę:")
    let podanaLiczba: Int! = Int(readLine() ?? "0")
    var obecnaLiczba = 1
    while obecnaLiczba <  podanaLiczba{
        var i = 0
        var j = obecnaLiczba
        while i < podanaLiczba{
            if(i == podanaLiczba-1){
                print("1")
                j = 0
            }
            else if(i >= podanaLiczba-obecnaLiczba){
                print(j, terminator: "")
                j-=1
            }
            else{
                print("", terminator: " ")
            }
            i+=1
        }
        obecnaLiczba+=1
        if(obecnaLiczba == podanaLiczba){
            var l: Int = podanaLiczba ?? 0
            while l > 0{
                print(l, terminator: "")
                l-=1
            }
        }
    }
}

pE()

func silniaR(liczba: Int) -> Int {
    if liczba <= 0{
        print("Nie ma ujemnej silni")
        return 0
    }

    if liczba <= 1{
        return 1
    }
    return (liczba * silniaR(liczba: (liczba-1)))
}


func pF() {
    print("Podaj liczbę:")
    let podanaLiczba: Int! = Int(readLine() ?? "0")
    print(silniaR(liczba: podanaLiczba))
}

pF()

func pG() {
    print("Podaj liczbę:")
    let podanaLiczba: Int! = Int(readLine() ?? "0")
    var wynik = 0
    for liczba in stride(from: 0, to: podanaLiczba + 1, by: 1){
        if(liczba % 2 == 0){
            wynik+=liczba
        }
    }
    print(wynik)
}

pG()

func czyPrime(liczba: Int) -> Bool  {
    if liczba <= 1{
        return false
    }
    if liczba <= 3 {
        return true
    }
    if (liczba % 2 == 0) || (liczba % 3 == 0){
        return false
    }
    var i = 5
    while i * i <= liczba{
        if(liczba % i == 0) || (liczba % (i + 2) == 0){
            return false
        }
        i+=6
    }
    return true
}

func pH() {
    print("Podaj liczbę:")
    let podanaLiczba: Int! = Int(readLine() ?? "0")
    let odpCzyPrime = czyPrime(liczba: podanaLiczba)
    if(odpCzyPrime == true){
        print("Tak to pierwsza liczba")
    }
    else{
        print("Nie pierwsza liczba")
    }
}

pH()

func pI() {
    print("Podaj liczbę:")
    let podanaLiczba: Int! = Int(readLine() ?? "0")
    var rzad = 1
    while rzad <= podanaLiczba{
        var kolumna = 1
        while kolumna <=  podanaLiczba{
            print(kolumna * rzad, terminator: " ")
            kolumna += 1
        }
        print()
        rzad += 1
    }
    
}

pI()