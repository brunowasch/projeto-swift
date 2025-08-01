import Foundation

enum ErroDeCorrida: Error {
    case combustivelInsuficiente
}

class Veiculo {
    var nomePiloto: String
    var velocidadeAtual: Float
    var combustivel: Float
    var distanciaPercorrida: Float
    var pulandoRodada = false

    init(nomePiloto: String, velocidadeAtual: Float, combustivel: Float, distanciaPercorrida: Float) {
        self.nomePiloto = nomePiloto
        self.velocidadeAtual = velocidadeAtual
        self.combustivel = combustivel
        self.distanciaPercorrida = distanciaPercorrida
    }

    func mostrarStatus() {
        print("\nPiloto: \(nomePiloto)\nVelocidade atual: \(velocidadeAtual)\nCombustível: \(String(format: "%.1f", combustivel))L\nPercorreu: \(distanciaPercorrida)km")
    }
    func acelerar() throws { 
        if combustivel > 0 {
            distanciaPercorrida += velocidadeAtual
            combustivel -= 3 //Não se usa -- em Swift
        } else {
            throw ErroDeCorrida.combustivelInsuficiente
        }
    }
    func frear() throws {
        if velocidadeAtual <= 10 {
            print("O piloto já está na velocidade mínima permitida.")
        } else if velocidadeAtual > 10 {
            velocidadeAtual -= 10
            combustivel -= 0.5
            print("\(nomePiloto) reduziu a velocidade para \(velocidadeAtual)km/h para poupar combustível.\n Combustível de \(nomePiloto): \(combustivel)")
        } else {
            throw ErroDeCorrida.combustivelInsuficiente
        }
    }
    func reabastecer() throws {
        combustivel += 3
        pulandoRodada = true
        print("\(nomePiloto) reabasteceu 3 de combustível e ficará fora da próxima rodada.")
    }
}

class CarroEsportivo: Veiculo {
    override func acelerar() throws {
        if combustivel >= 2 {
            distanciaPercorrida += velocidadeAtual * 2
            combustivel -= 2
        } else {
            throw ErroDeCorrida.combustivelInsuficiente
        }
    }
    init (nomePiloto: String) {
        super.init(
            nomePiloto: nomePiloto,
            velocidadeAtual: 200,
            combustivel: 10,
            distanciaPercorrida: 0
        )
    }
}

class Caminhonete: Veiculo {
    override func acelerar() throws {
        if combustivel >= 1 {
            distanciaPercorrida += velocidadeAtual * 0.8
            combustivel -= 1
        } else {
            throw ErroDeCorrida.combustivelInsuficiente
        }
    }
    init (nomePiloto: String) {
        super.init(
            nomePiloto: nomePiloto,
            velocidadeAtual: 120,
            combustivel: 12,
            distanciaPercorrida: 0
        ) 
    }
}

class Moto: Veiculo {
    override func acelerar() throws {
        if combustivel >= 0.5 {
            distanciaPercorrida += velocidadeAtual * 1.2
            combustivel -= 0.5
        } else {
            throw ErroDeCorrida.combustivelInsuficiente
        }
    }
    init (nomePiloto: String) {
        super.init(
            nomePiloto: nomePiloto,
            velocidadeAtual: 150,
            combustivel: 8,
            distanciaPercorrida: 0
        )
    }
}

enum ErroTecnico: Error {
    case numeroInvalido
}

func eventoAleatorio(veiculo: Veiculo) { 
    let aleatorio = Int.random(in: 1...100)
    if aleatorio <= 10 {
        veiculo.velocidadeAtual -= 20
        print("Obstáculo na pista! \(veiculo.nomePiloto) teve sua velocidade reduzida para \(veiculo.velocidadeAtual).")     
    } else if aleatorio <= 20{
        veiculo.combustivel += 1
        print("Bônus! \(veiculo.nomePiloto) aumentou seu combustível em 1L")    
    } else if aleatorio <= 30 && veiculo is Moto {
        veiculo.velocidadeAtual += 30
        print("Turbinada! A moto de \(veiculo.nomePiloto) ganhou mais 30km/h por esta rodada!")
    }
}

func corridaInterativa(veiculos: [Veiculo]) {
    while veiculos.contains(where: {$0.combustivel > 0}) {
        for veiculo in veiculos{
            if veiculo.pulandoRodada {
                print("\(veiculo.nomePiloto) Está reabastecendo nessa rodada. Fora por um turno.")
                veiculo.pulandoRodada = false
                continue
            }
            if veiculo.combustivel <= 0 {
                print("Acabou o combustível de \(veiculo.nomePiloto). Fora!")
                continue // Pula para o próximo veículo no laço
            } else {
                print("\nPiloto: \(veiculo.nomePiloto)\nEscolha uma ação:\n")
                print("""
                1 - Acelerar (Consome muito combustível)
                2 - Frear (Reduz a velocidade e o consumo de combustível)
                3 - Reabastecer (Fica fora da próxima rodada)
                4 - Ver status
                5 - Sair da corrida
                """)
                let pilotoEscolha = Int(readLine() ?? "") ?? 0
                do {
                    if pilotoEscolha == 1 {
                        try veiculo.acelerar()
                        eventoAleatorio(veiculo: veiculo)
                        print("\(veiculo.nomePiloto) acelerou. Distância total: \(String(format: "%.1f", veiculo.distanciaPercorrida)) km")
                        let distanciaFinal: Float = 3000
                        if veiculo.distanciaPercorrida >= distanciaFinal {
                            print("\(veiculo.nomePiloto) completou a corrida! 🏁")
                            for zerar in veiculos {
                                zerar.combustivel = 0 // Encerra a corrida
                            }
                        }   
                        
                    } else if pilotoEscolha == 2 {
                        try veiculo.frear()
                    } else if pilotoEscolha == 3 {
                        try veiculo.reabastecer()
                    } else if pilotoEscolha == 4 {
                        veiculo.mostrarStatus()
                    } else if pilotoEscolha == 5 {
                        veiculo.combustivel = 0
                    } else {
                        throw ErroTecnico.numeroInvalido
                    }
                } catch {
                    print("Opção inválida. Tente novamente.")
                }
                
            }
         }
    }

    var ranqueamento = veiculos
    
    print("Corrida encerrada!\nGrid final:")
    ranqueamento.sort(by: {
        $0.distanciaPercorrida > $1.distanciaPercorrida //Ordena do maior para menor colocado
    })
    
    for (i, veiculo) in ranqueamento.enumerated() {
        print("\(i + 1)º lugar: \(veiculo.nomePiloto) - \(veiculo.distanciaPercorrida) km")
    }
}

func main() {
    print("Bem-vindo à Corrida da POO! 🚗")
    print("-------------------------------")
    print("Cadastre os pilotos para começar!")

    var veiculos: [Veiculo] = []
    var nome: String = ""
    var i: Int = 1

    repeat {
        print("Digite o nome do \(i)º piloto (digite 'Sair' para encerrar):")
        nome = readLine() ?? ""
        if nome.lowercased() != "sair" {
            do {
                print("""
                Escolha o tipo do veículo:
                1 - Carro Esportivo 
                    Velocidade muito alta, mas consome mais combustível a cada rodada.

                2 - Caminhonete 
                    Acelera devagar, porém é mais econômica e resistente.

                3 - Moto 
                    Ágil e com consumo leve, ideal para economizar, mas com aceleração moderada.
                """)

                let tipoCarro = Int(readLine() ?? "") ?? 0 // Lê em String e passa para Int
                if tipoCarro == 1 {
                    let veiculoCriado = CarroEsportivo(nomePiloto: nome)
                    veiculos.append(veiculoCriado) // Adiciona ao Array
                } else if tipoCarro == 2 {
                    let veiculoCriado = Caminhonete(nomePiloto: nome)
                    veiculos.append(veiculoCriado) 
                } else if tipoCarro == 3 {
                    let veiculoCriado = Moto(nomePiloto: nome)
                    veiculos.append(veiculoCriado) 
                } else {
                    throw ErroTecnico.numeroInvalido
                }
                i += 1
            } catch {
                print("Tipo de veículo inválido. Por favor, escolha 1, 2 ou 3.")
            }
        }
    } while nome.lowercased() != "sair"

    print("Cadastro encerrado! Grid da corrida:")
    for veiculo in veiculos {
        veiculo.mostrarStatus()
    }
    corridaInterativa(veiculos: veiculos)
}

main()