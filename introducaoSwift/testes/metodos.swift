import Foundation

struct Carro {
    var marca: String
    var modelo: String 
    var km: Float

    func mostrar() {
        print("Registrado um carro de marca \(marca), modelo \(modelo) com \(km)km rodados.")
    }
}

print("Registrando um carro!")
print("Marca:")
let marca = readLine() ?? "" // Lê a marca como String, com valor default vazio
print("Modelo:")
let modelo = readLine() ?? "" 
print("Quilometragem:")
let kmString = readLine() ?? "" // Lê a quilometragem como String
if let km = Float(kmString) {
    let carro = Carro(marca: marca, modelo: modelo, km: km)
    carro.mostrar()
} else {
    print("Quilometragem inválida. Por favor, insira um número válido para a quilometragem.")
}


