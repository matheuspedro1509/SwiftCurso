//: Playground - noun: a place where people can play

import UIKit

var name = "Guilherme"
var project = "Eggplant nois"

name = "Paulo"
print(name)
print(project)

let eggplantIsAVegetable: Bool = false

if eggplantIsAVegetable == false {
    print("sal")
}

//funcao sem parametros
func helloCalories(){
    let product = "brownie"
    print("Hello Calories! \(product)")
}

helloCalories()

//funcao com parametros
func add(name:String, calories:Double){
    print("adding \(name) with \(calories)")
}
add(name: "Brownie", calories: 30.5)
add(name: "s", calories: 15.9)

//Array
let totalCalories = [50.5,100,300,500,600]
//let totalCalories:Array<Double> = []
print (totalCalories)

//laço 
//nesse laço o i equivale a posicao do array, como 1,2,3
for i in 0...4{
    print("Calories are \(totalCalories[i])")
}

for i in 0...totalCalories.count - 1{
   print("laco de forma diferente  \(totalCalories[i])")
}

//// nesse laço o i equivale ao valor que tem no array de calories, como 100,300,etc
for i in totalCalories {
    print("laco de outra forma \(i)")
}

////funcoes com array
func addAllCalories(caloriesTotal:Array<Double>) -> Double{
    var total:Double=0
    for i in caloriesTotal{
        total += i
   }
    return total
}
//
////chamada da funcao
addAllCalories(caloriesTotal: [10.5,100,300,500])


class Meal{
    var happiness : Int?
    var name : String?
}

//inicializando e atribuindo o meal para o brownie
let brownie = Meal()
brownie.name = "Salve"
brownie.happiness = 2
// se eu nao tivesse atribuido valor para os atributos ele estaria nil = "nulo"
//como eu atribui e ele estava opicional na model ali encima , voce coloca o ponto de exclamação para "abrir" o atributo
print(brownie.happiness!)
print(brownie.name!)

//passando novos valores para o objeto
brownie.happiness = 4
brownie.name = "sundubu"
print(brownie.happiness!)
print(brownie.name!.uppercased())
//o uppercased transforma a palavra em letra maiuscula


//fazendo uma classe com o construtor, com o construtor nao é necessário você colocar o ponto de interrogação "?" ou exclamação "!"
class Meal2{
    var happiness : Int
    var name : String
    var items = Array<Item>()
    
    //construtor
    init(name:String, happiness:Int) {
        self.name = name
        self.happiness = happiness
    }
    func allCalories() ->Double  {
        var total = 0.0
        for i in items{
            total += i.calories
        }
        return total
    }
}

class Item{
    var name : String
    var calories : Double
    
    init(name:String, calories:Double) {
        self.calories = calories
        self.name = name
    }
    
}
let brownie2 = Meal2(name: "comida", happiness: 5)

let item1 = Item(name: "brownie", calories: 200)
let item2 = Item(name: "vegan cream", calories: 40)

brownie2.items.append(item1)
brownie2.items.append(item2)


print(brownie2.allCalories())
		
