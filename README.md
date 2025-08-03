# 🐦 Swift: Conceitos Básicos, Programação Orientada a Objetos e Jogo Interativo

Este repositório foi utilizado a fins educacionais para a prática da linguagem de programação Swift

## 🎯 Principais objetivos:
- Compreender os fundamentos da linguagem Swift
- Praticar a estrutura e sintaxe da linguagem
- Aplicar os principais conceitos da Programação Orientada a Objetos:
  - Classes
  - Atributos
  - Construtores
  - Instâncias (criação de objetos)
  - Herança
  - Polimorfismo
  - Tratamento de exceções

## 🚗 Corrida da POO: um jogo utilizando os conceitos da Programação Orientada a Objetos
O projeto consiste em um **jogo de corrida interativo e estratégico** no terminal. Cada jogador representa um piloto e pode escolher um tipo de veículo, cada um com comportamentos únicos:

- **Carro Esportivo:** muito rápido, mas consome bastante combustível
- **Caminhonete:** aceleração moderada, mas mais econômica
- **Moto:** leve, econômica e com bom desempenho

A cada rodada, o jogador escolhe uma ação:
- Acelerar 💨
- Frear 🚫
- Reabastecer ⛽
- Ver status 📊
- Sair da corrida ❌

O objetivo é alcançar 3000 km antes dos demais, gerenciando bem o combustível e lidando com eventos aleatórios que podem ajudar ou atrapalhar a corrida.

## ⚙️ Conceitos aplicados

Durante o desenvolvimento, os seguintes conceitos de POO foram aplicados:

- **Classes** para representar os veículos
- **Atributos** como velocidade, combustível, e distância percorrida
- **Herança** entre a classe `Veiculo` e suas subclasses (`CarroEsportivo`, `Caminhonete`, `Moto`)
- **Polimorfismo** no método `acelerar()` que se comporta de forma diferente para cada tipo de veículo
- **Construtores personalizados** para inicializar os objetos
- **Exceções personalizadas**, utilizando enums para tratar erros como combustível insuficiente ou escolha inválida

---

## 💻 Como rodar
- Pré requisitos:
Para executar ou editar este projeto, é necessário ter:

- [Swift instalado](https://www.swift.org/install/linux)
- Alguma IDE que suporte Swift
  - Para este projeto, foi utilizado o [Visual Studio Code (VSCode)](https://code.visualstudio.com/download)
  - O ideal, caso você esteja em macOS, é utilizar o **Xcode**

### Próximos passos
1. **Clone o repositório:**
   ```bash
   git clone https://github.com/seu-usuario/jogo-swift.git
   cd jogo-swift
   ```
2. **Abra o VSCode e utilize o comando cd no terminal juntamente com o nome da pasta que você quer testar**
   Ex:
   ```bash
   cd jogoPOO
   ```
3. **Compile o código Swift para gerar um executável**
   Ex:
   ```bash
   swiftc jogoPOO.swift -o jogoPOO.exe
   ```
4. **Compile o código**
   Ex:
   ```bash
   .\jogoPOO.exe
   ```

Pronto! Os códigos estão funcionando

--- 

Este projeto é de autoria própria, desenvolvido com foco em aprimoramento técnico.
