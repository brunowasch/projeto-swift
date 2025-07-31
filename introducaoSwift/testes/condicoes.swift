import Foundation

var idade: Int?

print("Olá! Qual sua idade?")


if let idadeString = readLine(), let idadeConvertida = Int(idadeString) { // Lê a entrada e tenta convertê-la para Int para evitar forçações inválidas
    idade = idadeConvertida
    if idade! >= 18 {
        print("Com \(idade!) anos, você já é maior de idade.")
    } else if idade! < 18 && idade! > 0 {
        print("Com \(idade!) anos, você ainda é menor de idade.")
    } else {
        print("Idade inválida.")
    }
} else {
    print("Por favor, insira uma idade válida.")
}
