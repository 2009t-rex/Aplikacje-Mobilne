print("Hello Home!!")

// 1. Wypisz:
// 		- jedna pod drugą liczby z zakresu: <-22;22)
// 		- malejąco co piątą liczbę (oddzielone spacjami) z zakresu: (-15;55>
// 		- malejąco liczby z zakresu: <10;40> \ (15;25)
// 		- liczby nieparzyste z przedziału: <-40;40) \ <3;30)
// 		- liczby parzyste z przedziału: <-20;20) \ (5;10)
// 		- tylko liczby podzielne przez 7 z przedziału: <-100;41) \ (-28;14)

// Template:
// func p() {
//     let poczatek = 
//     let koniec = 
//     let coIle = 
//     for liczba in stride(from: poczatek, to: koniec, by: coIle){
//         print()
//     }
// }
// 
// p()

func p1() {
    for liczba in -22...21{
        print(liczba)
    }
}

p1()

func p2() {
    let poczatek = 55;
    let koniec = -15
    let coIle = -5
    for liczba in stride(from: poczatek, to: koniec, by: coIle){
        print(liczba, terminator: " ")
    }
}

p2()

func p3() {
    let poczatek = 40
    let koniec = 9
    let coIle = -1
    for liczba in stride(from: poczatek, to: koniec, by: coIle){
        if liczba <= 15 || liczba >= 25{
            print(liczba)
        }
    }
}

p3()

func p4() {
    let poczatek = -39
    let koniec = 40
    let coIle = 2
    for liczba in stride(from: poczatek, to: koniec, by: coIle){
        if liczba < 3 || liczba > 30{
            print(liczba)
        }
    }
}

p4()

func p5() {
    let poczatek = -20
    let koniec = 20
    let coIle = 2
    for liczba in stride(from: poczatek, to: koniec, by: coIle){
        if liczba < 5 || liczba >= 10{
            print(liczba)
        }
    }
}

p5()

func p6() {
    let poczatek = -100
    let koniec = 41
    let coIle = 1
    for liczba in stride(from: poczatek, to: koniec, by: coIle){
        if ((liczba % 7) == 0) && (liczba <= -28 || liczba >= 14){
            print(liczba)
        }
    }
}

p6()