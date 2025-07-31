import Foundation

// Definindo os erros possíveis
enum ErroPessoa: Error {
    case idadeInvalida
    case idadeNaoNumerica
}

// Classe Pessoa com validação no construtor
class Pessoa {
    var nome: String
    var idade: Int

    init(nome: String, idade: Int) throws {
        if idade < 0 {
            throw ErroPessoa.idadeInvalida // Lança erro se a idade for negativa
        }
        self.nome = nome
        self.idade = idade
    }

    // Método para exibir as informações da pessoa
    func exibirPessoa() {
        print("Registrado: \(nome), com \(idade) anos")
    }
}

// Classe Dirige, que herda de Pessoa
class Dirige: Pessoa {
    var marcaCarro: String
    var modeloCarro: String
    var kmCarro: Float

    init(nome: String, idade: Int, marcaCarro: String, modeloCarro: String, kmCarro: Float) throws {
        self.marcaCarro = marcaCarro
        self.modeloCarro = modeloCarro
        self.kmCarro = kmCarro
        try super.init(nome: nome, idade: idade)  // Inicializa a classe base (Pessoa)
    }

    // Sobrescrevendo o método exibirPessoa para incluir informações do carro
    override func exibirPessoa() {
        super.exibirPessoa()  // Chama o método exibirPessoa da classe base
        print("Dirige o carro de marca \(marcaCarro), modelo \(modeloCarro) com \(kmCarro) km rodados.")
    }
}

// Função para registrar uma pessoa e os dados do carro
func registrarPessoa() -> Dirige? {
    print("Digite seu nome:")
    let nome = readLine() ?? ""  // Lê o nome da pessoa
    
    print("Digite a idade:")
    if let idadeString = readLine() {
        // Tenta converter a idade para um número inteiro
        if let idade = Int(idadeString) {
            do {
                // Agora vamos perguntar sobre o carro
                print("Digite a marca do carro que você dirige:")
                let marcaCarro = readLine() ?? ""
                
                print("Digite o modelo do carro que você dirige:")
                let modeloCarro = readLine() ?? ""
                
                print("Digite a quilometragem do carro:")
                if let kmString = readLine(), let kmCarro = Float(kmString) {
                    do {
                        // Criando uma instância de Dirige com dados da pessoa e do carro
                        let motorista = try Dirige(nome: nome, idade: idade, marcaCarro: marcaCarro, modeloCarro: modeloCarro, kmCarro: kmCarro)
                        return motorista  // Retorna a instância de Dirige
                    } catch ErroPessoa.idadeInvalida {
                        print("Erro: A idade não pode ser negativa.")
                    } catch {
                        print("Erro desconhecido: \(error)")  // Captura outros erros
                    }
                } else {
                    print("Erro: A quilometragem precisa ser um número válido.")
                }
                
            } catch ErroPessoa.idadeInvalida {
                print("Erro: A idade não pode ser negativa.")
            }
        } else {
            print("Erro: A idade precisa ser um número válido.")
        }
    }
    return nil  // Retorna nil se houver algum erro
}

// Tentando registrar uma pessoa e seus dados do carro
if let pessoaRegistrada = registrarPessoa() {
    // Polimorfismo: Podemos tratar `pessoaRegistrada` como `Pessoa` e chamar o método exibirPessoa
    // O método correto será chamado dependendo do tipo real do objeto (Pessoa ou Dirige).
    var pessoa: Pessoa = pessoaRegistrada  // Tratamos como `Pessoa`, mas é realmente `Dirige`
    pessoa.exibirPessoa()  // Exibe a pessoa e o carro registrado
} else {
    print("Não foi possível registrar a pessoa.")
}