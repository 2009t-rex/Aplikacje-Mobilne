var auto_ID = 1000

struct User {
    var ID = auto_ID
    var name: String = "User"
    var PIN = "0000"
    var balance: Double = 0.0
}

var Users: [User] = []
var numberOfUsers = 0

func clearConsole(){
    print("\u{001B}[2J\u{001B}[H")
}

func generateUser() {
    print("Podaj swoje imię:")
    let username: String? = readLine()
    var goodPIN = false
    var userPIN: String!
    while (!goodPIN){
        print("Wpisz nowy kod PIN (hasło do logowania):")
        userPIN = readLine()
        if(userPIN.count == 4){
            goodPIN = true
        }
        for number in userPIN{
            if (!number.isNumber){
                goodPIN = false
                break
            }
        }
        if(!goodPIN){
            print("Podaj poprawny PIN - 4 cyfry")
        }
    }
    let person = User(name: username ?? "Nobody", PIN: userPIN)
    auto_ID += 1
    Users.insert(person, at: numberOfUsers) 
    numberOfUsers += 1
    clearConsole()
    print("Pomyślnie dodano użytkownika\n")
}

func checkUsers(){
    clearConsole()
    print("Lista użytkowników z ich ID")
    for person in Users{
        print("ID: \(person.ID) | Imie: \(person.name)\n")
    }
}

func userLog(){
    print("Podaj ID użytkownika:")
    let user_ID: Int? = Int(readLine() ?? "0")
    var goodPIN = false
    var userPIN: String!
    while (!goodPIN){
        print("Wpisz kod PIN użytkownika:")
        userPIN = readLine()
        if(userPIN.count == 4){
            goodPIN = true
        }
        for number in userPIN{
            if (!number.isNumber){
                goodPIN = false
                break
            }
        }
        if(!goodPIN){
            print("Podaj poprawny PIN")
        }
    }
    var accountFound = false
    for person in Users{
        if(person.ID == user_ID && person.PIN == userPIN){
            clearConsole()
            loggedMenu(user: person, userID: person.ID)
            accountFound = true
            break
        }
    }
    if(!accountFound){
        clearConsole()
        print("Nie znaleziono użytkownika\n")
    }

}

func checkBalance(user: User, userID: Int) -> Double{
    if let person = Users.firstIndex(where: {person in person.ID == userID}){
        return Users[person].balance
    }
    //Safety return function always need to return something.
    //It should always give back amount there was when You logged on account
    return user.balance
}
func depositMoney(user: User, userID: Int){
    print("Wpisz kwotę, którą chcesz wpłacić:")
    let deposit: Double = Double(readLine()!)!
    print("Czy tyle chcesz wpłacić \(deposit)? [T/N]")
    let choice: String = String(readLine() ?? "nothing")
    switch choice.lowercased() {
        case "t", "tak":
            clearConsole()
            print("Wprowadzam wpłatę na konto.\n")
            //ChatGPT helped - didn't know I was using copy and it wasn't mutable
            if let person = Users.firstIndex(where: {person in person.ID == userID}){ 
                Users[person].balance += deposit
            }
            //To here higher I copied this one and changed so it works
        default:
            clearConsole()
            print("Nie potwierdzono wpłaty\n")
    }
}
//copied one above and just changed the names
//and added balance that will be left
//remebered to added You can't withdraw to have negative
func withdrawMoney(user: User, userID: Int){
    var canWithdraw = false
    var withdraw: Double = 0.0
    while(!canWithdraw){
        print("Wpisz kwotę, którą chcesz wypłacić:")
        withdraw = Double(readLine()!)!
        if let person = Users.firstIndex(where: {person in person.ID == userID}){ 
            if(Users[person].balance < withdraw || withdraw < 0){
                print("Nie możesz tyle wypłacić")
            }
            else{
                canWithdraw = true
            }
        }
    }
    print("Czy tyle chcesz wypłacić \(withdraw)? [T/N]")
    let qbalanceCheck = checkBalance(user: user, userID: userID)
    print("Zostanie wtedy \(qbalanceCheck - withdraw)zl na koncie")
    let choice: String = String(readLine() ?? "nothing")
    switch choice.lowercased() {
        case "t", "tak":
            clearConsole()
            print("Wypłacam pieniądze z konta.\n")
            if let person = Users.firstIndex(where: {person in person.ID == userID}){ 
                Users[person].balance -= withdraw
            }
        default:
            clearConsole()
            print("Nie potwierdzono wypłaty\n")
    }
}

func loggedMenu(user: User, userID: Int){
    print("Pomyślnie zalogowano \(user.name)\n")
    var runningLog = true
    while runningLog{
        print("""
        1. Sprawdź saldo
        2. Wpłać
        3. Wypłać
        4. Przelew
        5. Wyloguj (Wpisz: w/k)
        """)
        let choice: String = String(readLine() ?? "nothing")
        switch choice {
            case "1":
                clearConsole()
                let balance = checkBalance(user: user, userID: userID)
                print("Twoje saldo \(user.name) to \(balance)zł\n")
            case "2":
                clearConsole()
                depositMoney(user: user, userID: userID)
            case "3":
                clearConsole()
                withdrawMoney(user: user, userID: userID)
            case "4":
                clearConsole()
            case "k", "w":
                runningLog = false
                clearConsole()
                print("Wylogowano\n")
            default:
                clearConsole()
                print("Niepoprawny wybór\n")
        }
    }

}

func Menu(){
    var running = true
    while running{
        print("""
        Witaj w aplikacji banku.
        1. Zaloguj
        2. Utwóez Konto
        3. Lista użytkowników
        4. Wyjście (Wpisz: k)
        """)
        let choice: String = String(readLine() ?? "nothing")
        switch choice {
            case "1":
                clearConsole()
                userLog()
            case "2":
                clearConsole()
                generateUser()
            case "3":
                clearConsole()
                checkUsers()
            case "k":
                running = false
                clearConsole()
                print("Dowidzenia")
            default:
                clearConsole()
                print("Niepoprawny wybór\n")
        }
    }
}

Menu()