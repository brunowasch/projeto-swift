import Foundation

enum ErroDeCorrida: Error {
    case combustivelInsuficiente
}

class Veiculo {
    var nomePiloto: String
    var velocidadeAtual: Float
    var combustivel: Float
    var distanciaPercorrida: Float

    init(nomePiloto: String, velocidadeAtual: Float, combustivel: Float, distanciaPercorrida: Float) {
        self.nomePiloto = nomePiloto
        self.velocidadeAtual = velocidadeAtual
        self.combustivel = combustivel
        self.distanciaPercorrida = distanciaPercorrida
    }

    func mostrarStatus() {
        print("\nPiloto: \(nomePiloto)\nVelocidade atual: \(velocidadeAtual)\nCombustível: \(combustivel)\nPercorreu: \(distanciaPercorrida)km")
    }
    func acelerar() throws { 
        if combustivel > 0 {
            distanciaPercorrida += velocidadeAtual
            combustivel -= 1 //Não se usa -- em Swift
        } else {
            throw ErroDeCorrida.combustivelInsuficiente
        }
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

func main() {
    print("Bem-vindo à Corrida da POO! 🚗")
    print("------------------------------")
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
} 
main()