func clearConsole(){
    print("\u{001B}[2J\u{001B}[H")
}

// 1. Napisz funkcję, która:
// 	- przyjmuje tablicę z typami Any
// 	- zwraca tablicę tylko z elementami typu Int wejściowej tablicy
	
// 	Reasumując wycina elemety inne niż typu Int.

func leftOnlyInt (table: [Any]) -> [Int]{
    var returnTable: [Int] = []
    if (table.isEmpty) {
        print("Tablica pusta")
        return returnTable
    }
    for thing in table{
        if  thing is Int{
            returnTable.append(thing as! Int)
        }
    }
    return returnTable
}

// Test

// let arr: [Any] = ["cosik", 5, 20, 20.5, 30.33, true, -20]

// let newArr = leftOnlyInt(table: arr)

// print(newArr)

// 2. Napisz program umożliwiający rotowanie tablicy w prawo i lewo.
// 	- wejściową tablicę podaje użytkownik
// 	- użytkownik decyduje o rotacji wpsując kierunek R/L i ilość iteracji
// 	- w wyniku kod wypisuje każdą z iteracji
// 	- pętla kontynuowana do zakończenia np. klawisz "k"
	
// 	przykładowo:
// 		wprowadzona tablica wejściowa [1,2,3,4,5]
		
// 		R3
// 		[1,2,3,4,5] // iteracja 0
// 		[5,1,2,3,4] // iteracja 1
// 		[4,5,1,2,3] // iteracja 2
// 		[3,4,5,1,2] // iteracja 3
	
// 		L2
// 		[3,4,5,1,2] // iteracja 0
// 		[4,5,1,2,3] // iteracja 1
// 		[5,1,2,3,4] // iteracja 2
		
// 		k // koniec

func rotateTable() -> [String]{
    clearConsole()
    print("Podaj ilość elementów tablicy: ")
    let size: Int! = Int(readLine() ?? "0")
    var table: [String] = [] 
    for number in 0..<size{
        print("Podaj wartość na miejscu \(number+1)")
        let value = readLine() ?? ""
        table.append(value as String)
    }
    var running = true
    while running{
        print("Wybierz co chcesz robić [R/L{ile}], (k - wyjśie)")
        let choice: String = String(readLine() ?? "nothing")
        switch choice.prefix(1).lowercased(){
            case "r":
                let ile: Int! = Int(choice.suffix(1))
                for number in 0..<ile {
                    print(table, terminator: "\t")
                    print("|| iteracja \(number)")
                    let toChange = table.suffix(1)
                    table.removeLast()
                    table.insert(contentsOf: toChange, at: 0)
                    if (number == ile-1){
                        print(table, terminator: "\t")
                        print("|| iteracja \(number+1)")
                    }
                }
            case "l":
                let ile: Int! = Int(choice.suffix(1))
                for number in 0..<ile {
                    print(table, terminator: "\t")
                    print("|| iteracja \(number)")
                    let toChange = table.prefix(1)
                    table.removeFirst()
                    table.append(contentsOf: toChange)
                    if (number == ile-1){
                        print(table, terminator: "\t")
                        print("|| iteracja \(number+1)")
                    }
                }
            case "k":
                running=false

            default:
                print("Niepoprawny wybór")
        }
    }
    return table
}

// Test

// let rotatedTable = rotateTable()
// print(rotatedTable)

// 3. Napisz funkcję mnożącą dwie macierze, która:
// 	- przyjmuje dwie tablice
// 	- informuje jeśli tablice mają złe wymiary lub typy
// 	- zwraca tablicę z wynikiem

let mac1: Array<Array<Int>> = [[1, 2, 3], [0, 9, 8]]
let mac2: Array<Array<Int>> = [[4, 5], [6, 8], [7, 7]]
func mnozenie(m1: Array<Array<Int>> , m2: Array<Array<Int>> )-> Array<Array<Int>> {
    var wyn: Array<Array<Int>> = [[0, 0], [0, 0]]
    var i = 0
    m1.forEach { row in
        var k = 0

        for j in 0...1 {
            var a = 0

            m2.forEach { col in
                let el = col[j]
                a += el * row[k]
                k += 1
            }

            wyn[i][j] = a
            k = 0
        }

        i += 1
    }

    return wyn
}

print(mnozenie(m1: mac1, m2: mac2))