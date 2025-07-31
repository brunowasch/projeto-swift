import Foundation

var tarefas: [String] = []

// Laço para capturar 3 tarefas
for i in 1...3 {
    print("Digite a tarefa \(i):")
    if let tarefa = readLine() {
        tarefas.append(tarefa) // Adiciona a tarefa ao vetor
    }
}

print("Tarefas registradas:")

// Variável para percorrer as tarefas
var percorre = 0 // Percorre o vetor da variável

// Laço 'while' para exibir as tarefas
while percorre < tarefas.count {
    print("Tarefa \(percorre + 1): \(tarefas[percorre])")
    percorre += 1 // Incrementa o índice para o próximo item
}

print("Deseja marcar como concluído alguma tarefa? [s] [n]")
if let res = readLine() {
    if res.lowercased() == "s" {
        print("Digite o número da tarefa que você quer marcar como concluída:")
        
        if let numTarefa = readLine(), let num = Int(numTarefa), num > 0 && num <= tarefas.count {
            tarefas[num - 1] += " - Concluída!" // Marca a tarefa como concluída
            print("Tarefa \(num) marcada como concluída.")
        } else {
            print("Número de tarefa inválido.") // Se o número estiver fora do alcance
        }
    } else if res.lowercased() == "n" {
        print("Programa encerrado.")
    } else {
        print("Você digitou algo inválido.") // Caso a entrada não seja "s" nem "n"
    }
}

// Exibe as tarefas atualizadas com o laço 'repeat-while'
print("\nTarefas Atualizadas:")

percorre = 0 // Reinicia o índice para percorrer novamente

// Laço 'repeat-while', substitui o do while
repeat {
    print("\(percorre + 1). \(tarefas[percorre])") // Exibe a tarefa
    percorre += 1 // Incrementa o índice para a próxima tarefa
} while percorre < tarefas.count // Condição do laço
