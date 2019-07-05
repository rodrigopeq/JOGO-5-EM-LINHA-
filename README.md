# Projeto do  JOGO “5 EM LINHA”

## Descrição do jogo:

O jogo 5 EM LINHA é um jogo composto por um tabuleiro de 6x6, divido em 4 quadrantes(3x3) como a imagem a seguir:

![PROJETO1](https://user-images.githubusercontent.com/23217960/60698424-a37af100-9ec5-11e9-945a-8a5123c550d6.png)
Os jogadores devem escolher uma posição do tabuleiro onde o primeiro jogador marcará com “O” e o segundo com “X”, após um jogador escolher a posição ele terá que escolher um quadrante e o lado em que ele quiser virar (direita ou esquerda), dessa maneira ele tem que para formar cinco em linha (horizontal ou vertical) como segue o exemplo abaixo:

![Projjeto2](https://user-images.githubusercontent.com/23217960/60698499-ffde1080-9ec5-11e9-8e94-e83d8fb1dcd2.png)

## Descrição do programa :
Iniciamos pela ideia que de usar 1 matriz e 4 submatriz, dessa forma temos que o jogador deverá escolher qual a submatriz irá ser virada, tanto para esquerda, quanto para direita em um ângulo de 90º. Antes de cada jogada existe a necessidade de se mostrar a atual situação do tabuleiro, possibilitando assim maior facilidade para cada jogador fazer sua jogada. Além disso, é necessário verificar após a jogada se a posição não está ocupada, impossibilitando sobrescrever no mesmo lugar do tabuleiro.
Dessa forma, para verificar o vencedor, analisamos todas as linhas e colunas á procura de uma sequência de cinco “X” ou “O”.

### Autores:
Bernardo Andrade de Carvalho,
Rodrigo dos Santos Pequeno
