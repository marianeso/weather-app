# Weather APP

## Ideia do aplicativo
Apresentar a temperatura em uma determinada cidade.


https://user-images.githubusercontent.com/101711941/206421208-3ec17c48-ebb9-48e1-b1f3-0c2d2e5ade4d.mp4



## Principais Tecnologias
* Swift e UIKit
* Requisições para API de temperatura
* Gerenciador de dependências:  Cocoapods
* SDWebImage para baixar imagens de forma assíncrona e cache em memória.

## Como rodar
* Utilizar o Xcode para abrir o arquivo Weather.xcodeproj

## Sobre o aplicativo
* O aplicativo possui 2 telas: 

* Tela de Home: 
    * Utilizando um Searchbar, o usuário pode digitar a cidade que deseja.
    * Foi utilizado um UIAlertController para tratar o caso do usuário apertar o botão de “Buscar” e não ter nada digitado.
    * Detecção de clique no botão de search para abrir a tela de Lista de Cidades

* Tela de Lista de cidades
    * Utilização da URLSession para fazer request e apresentar a lista de cidades a partir de uma palavra digitada na searchBar
    * Utilização de uma table view que mostra todas as cidades buscadas
    * Detecção de clique na tableview e utilização do dismiss para voltar para a tela de Home 

* Trabalhamos com completion e delegate para treinar diferentes maneiras de transporte de dados no aplicativo.
