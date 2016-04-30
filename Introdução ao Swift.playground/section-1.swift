import UIKit

/***************************
		 INTRODUÇÃO
***************************/



/* var e let */

// Uma variável com tipo inferido Double.
var mutableValue = 27.05

// Uma variável com tipo explícito Float.
var mutableFloat: Float = 19.92

// Variáveis podem ser livremente modificadas, desde que mantenham o tipo inicial.
mutableValue = 30.05

// Criando uma constante, cujo valor não pode ser modificado após a primeira atribuição.
let immutableValue = true
let immutableString: String = "String"



/* tuplas */

let namelessTuple = (1, "bc")
print(namelessTuple.0)

// Podemos dar nome aos valores...
let tuple = (testing: 1.23, tuples: "Works", awesome: true)
// ... e acessá-los por sua respectiva nomemclatura.
print(tuple.tuples)



/* optional binding */

// Valores que podem não existir em algum momento devem ser marcados como optional.
var emptyValue: String?
print(emptyValue)

var maybeValue: String? = "I'm here!"
print(maybeValue!)

// Optional binding permite o desempacotamento e atribuição em um único comando, reduzindo o esforço.
if let theValue = emptyValue {
	print(theValue)
}

emptyValue = "Let's Rock!"
if let theValue = emptyValue {
	print(theValue)
}



/* arrays */

// Inicializando
let anIntArray = [1, 2, 3]
var emptyArray = [Double]()
var fullArray = [String](count: 2, repeatedValue: "Default")

// Adicionado...
fullArray.append("Beyond default")
fullArray[1] = "Must be inside bounds"

// Removendo...
fullArray.removeAtIndex(2)
fullArray.removeLast()

fullArray.removeAll(keepCapacity: false)



/* dictionaries */

// Dictionaries são similares aos arrays, mas acessam os valores através de chaves.
var anStringDictWithStringKeys = [String:String]()

// Para definir um valor, basta atribuí-lo a uma chave.
anStringDictWithStringKeys["Key"] = "Value!"
anStringDictWithStringKeys["Another"] = "Cool!"

// Removendo...
anStringDictWithStringKeys["Key"] = nil
anStringDictWithStringKeys.removeValueForKey("Another")

// Constante: não pode ser alterado após sua inicialização.
let immutableDictionary = ["Never" : "Changes"]



/* loops */

let objects = ["Hey", "Brother"]

// Em listas, iteramos normalmente com for in.
for object in objects {
	print("Object is \(object)")
}

// Podemos obter o índice de cada objeto com o uso de tuplas e da função enumerate().
for (index, object) in objects.enumerate() {
	print("Object at index \(index) is \(object)")
}

// Neste for, estaremos iterando de 0 à 9. O operador ..< define um intervalo exclusivo.
for i in 0..<10 {
	print(i)
}

// Para incluirmos todos os valores, utilizamos o operador ... Nesse caso, iremos de 0 à 5, iterando 6 vezes.
for i in 0...5 {
	print(i)
}



/* switch */

let vegetable = "red pepper"

// Switch permite o direcionamento do código para determinados comandos.
switch vegetable {
	case "celery":
	let vegetableComment = "Add some raisings and make ants on a log."
	fallthrough
	case "cucumber", "watercress":
	let vegetableComment = "That would make a good tea sandwich."
	// Podemos utilizar cláusulas mais complexas
	case let x where x.hasSuffix("pepper"):
	let vegetableComment = "Is it a spicy \(x)?"
	default:
	let vegetableComment = "Everything tastes good in soup."
}

/***************************
	ORIENTAÇÃO A OBJETOS
***************************/

// Podemos declarar uma classe desta forma.
public class Person : NSObject , Positivable {

	var name: String?

	var age: Int = 0 {
		willSet(newValue) {
			if newValue > 11 && name != nil {
				name = "teenager \(name!)"
			}
			if newValue > 18 && name != nil {
				name = "adult \(name!)"
			}
		}
	}

	private(set) var createdAt = NSDate()

	var yearOfBirth: Int {
		var components = NSCalendar.currentCalendar().components(.Year, fromDate: NSDate())
			return components.year - age
	}

	// A função init permite a inicialização correta de objetos provenientes das classes.
	init(printWhat: String) {
		print(printWhat)
		name = "John"
		super.init()
	}

	// Podemos criar inicializadores mais convenientes, para facilitar a inicialização.
	convenience override init() {
		self.init(printWhat: "Boo Yah!")
	}

	// Um método de classe
	class func typeMethod() {

	}

	// Um método
	func aMethod() {

		let c = Car()

		c.drive({
			print("done driving")
		})

		c.drive() {
			print("closures rock")
		}

	}

	// Um método público que retorna
	public func aMethodThatReturns() -> Bool {
		return true
	}

	// Um método interno com parâmetro que retorna uma tupla
	internal func aMethod(havingParameter: Int) -> (one: String, two: Float) {
		return ("Tuples", 1.22)
	}

	// Um método privado com parâmetro nomeado diferente do nome interno
	private func aMethod(havingParameterName parameter: String) {

	}

	// Um método com parâmetro nomeado igual ao nome interno
	func aMethod(havingSameParameterName havingSameParameterName: Double) {
		// Somente membros desta classe poderão chamar a função privada.
		self.aMethod(havingParameterName: "Parameter")
	}

	// Um método com parâmetros, sendo o segundo externamente nomeado por padrão
	func aMethod(havingParameter: Float, andOtherImplicitParameterName: [Int]) {

	}

	// Um método com parâmetros, sendo o nome padrão do segundo ignorado
	func aMethod(havingParameter: [String:String], _ ignoringImplicitParameterName: Int) {
		
	}

	// Override explícito de método de uma superclasse.
	override public func select(sender: AnyObject!) {
		// Faça o override aqui.
	}

	func isPositive(theNumber: Int) -> Bool {
		return theNumber.isPositive()
	}

}

protocol Positivable {
	func isPositive(theNumber: Int) -> Bool
}

extension Int {

	func isPositive() -> Bool {
		return self > 0
	}

}

class Car {

	func drive(finished: ()->()) {
		print("Driving")
		finished()
	}

}
