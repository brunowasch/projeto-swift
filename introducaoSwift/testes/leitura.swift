import Foundation /*Importa a biblioteca Foundation, que fornece um conjunto de funcionalidades essenciais para o desenvolvimento de aplicativos em Swift.
A Foundation fornece APIs para manipulação de strings, datas, arquivos, URLs, operações assíncronas e muito mais.*/

print("Digite seu nome:")
let nome = readLine()
print("Olá, \(nome!)! Digite sua idade:") //O ! serve para imprimir todo a variável, caso contrário, a saída seria: Optional("nome")
let idade = readLine();
print("Você tem \(idade!) anos.") //Optional("idade")