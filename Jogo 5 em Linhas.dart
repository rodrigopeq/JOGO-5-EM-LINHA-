import 'dart:convert';
import "dart:io";

int i = 0;
int j = 0;

typedef Matriz = List<List<String>>;

int testar(Matriz matriz, String letra) {
  int b = 0;

  for (i = 1; i <= 6; i++) {
    for (j = 1; j <= 6; j++) {
      if (matriz[i][j] == letra) {
        b++;
        if (matriz[i][2] != letra ||
            matriz[i][3] != letra ||
            matriz[i][4] != letra ||
            matriz[i][5] != letra) {
          break;
        }
      }
    }
    if (b >= 5) {
      return 1;
    }
    b = 0;
  }

  int c = 0;

  for (i = 1; i <= 6; i++) {
    for (j = 1; j <= 6; j++) {
      if (matriz[j][i] == letra) {
        c++;
        if (matriz[2][i] != letra ||
            matriz[3][i] != letra ||
            matriz[4][i] != letra ||
            matriz[5][i] != letra) {
          break;
        }
      }
    }
    if (c >= 5) {
      return 1;
    }
    c = 0;
  }

  return 0;
}

void transforma3x3(
    Matriz matriz, Matriz aux1, Matriz aux2, Matriz aux3, Matriz aux4) {
  for (i = 1; i <= 3; i++) {
    for (j = 1; j <= 6; j++) {
      if (j <= 3)
        aux1[i][j] = matriz[i][j];
      else if (j >= 4) aux2[i][j - 3] = matriz[i][j];
    }
  }

  for (i = 4; i <= 6; i++) {
    for (j = 1; j <= 6; j++) {
      if (j <= 3)
        aux3[i - 3][j] = matriz[i][j];
      else if (j >= 4) aux4[i - 3][j - 3] = matriz[i][j];
    }
  }
}

void transforma6x6(
    Matriz matriz, Matriz aux1, Matriz aux2, Matriz aux3, Matriz aux4) {
  for (i = 1; i <= 6; i++) {
    for (j = 1; j <= 6; j++) {
      if (i <= 3 && j <= 3)
        matriz[i][j] = aux1[i][j];
      else if (i <= 3 && j <= 6) matriz[i][j] = aux2[i][j - 3];
      if (i >= 4 && j <= 3)
        matriz[i][j] = aux3[i - 3][j];
      else if (i >= 4 && j <= 6) matriz[i][j] = aux4[i - 3][j - 3];
    }
  }
}

void giradireita(Matriz matriz) {
  Matriz aux = gerarMatriz(3);

  aux[1][3] = matriz[1][1];
  aux[2][3] = matriz[1][2];
  aux[3][3] = matriz[1][3];
  aux[1][2] = matriz[2][1];
  aux[2][2] = matriz[2][2];
  aux[3][2] = matriz[2][3];
  aux[1][1] = matriz[3][1];
  aux[2][1] = matriz[3][2];
  aux[3][1] = matriz[3][3];

  for (i = 1; i <= 3; i++) {
    for (j = 1; j <= 3; j++) {
      matriz[i][j] = aux[i][j];
    }
  }
}

void giraesquerda(Matriz matriz) {
  Matriz aux = gerarMatriz(3);

  aux[3][1] = matriz[1][1];
  aux[2][1] = matriz[1][2];
  aux[1][1] = matriz[1][3];
  aux[3][2] = matriz[2][1];
  aux[2][2] = matriz[2][2];
  aux[1][2] = matriz[2][3];
  aux[3][3] = matriz[3][1];
  aux[2][3] = matriz[3][2];
  aux[1][3] = matriz[3][3];

  for (i = 1; i <= 3; i++) {
    for (j = 1; j <= 3; j++) {
      matriz[i][j] = aux[i][j];
    }
  }
}

void imprimirtoda(
    Matriz matriz1, Matriz matriz2, Matriz matriz3, Matriz matriz4) {
  int k;

  for (i = 1; i <= 3; i++) {
    for (j = 1; j <= 3; j++) {
      stdout.write(
        "[${matriz1[i][j]}]",
      );
      if (j == 3) stdout.write("|");
    }
    for (k = 1; k <= 3; k++) {
      stdout.write(
        "[${matriz2[i][k]}]",
      );
      if (k == 3) stdout.write("\n");
    }
  }
  stdout.write("---------+---------\n");
  for (i = 1; i <= 3; i++) {
    for (j = 1; j <= 3; j++) {
      stdout.write(
        "[${matriz3[i][j]}]",
      );
      if (j == 3) stdout.write("|");
    }
    for (k = 1; k <= 3; k++) {
      stdout.write(
        "[${matriz4[i][k]}]",
      );
      if (k == 3) stdout.write("\n");
    }
  }
  stdout.write("\n");
  // getch();
}

void jogador(Matriz matriz, String nome, String letra) {
  int resultado = 0;
  late int linha;
  late int coluna;
  int quadran;
  String lado;

  Matriz matriz1 = gerarMatriz(3);
  Matriz matriz2 = gerarMatriz(3);
  Matriz matriz3 = gerarMatriz(3);
  Matriz matriz4 = gerarMatriz(3);

  for (i = 1; i <= 3; i++) {
    for (j = 1; j <= 3; j++) {
      matriz1[i][j] = ' ';
      matriz2[i][j] = ' ';
      matriz3[i][j] = ' ';
      matriz4[i][j] = ' ';
    }
  }

  stdout.write("É a vez de $nome\n");
  stdout.write("Qual a posição ?\n");

  do {
    stdout.write("Linha:");
    var l = stdin.readLineSync(encoding: utf8);
    linha = int.tryParse(l ?? '') ?? 0;

    stdout.write("Coluna:");
    var c = stdin.readLineSync(encoding: utf8);
    coluna = int.tryParse(c ?? '') ?? 0;

    while (linha < 1 || linha > 6) {
      stdout.write("Linha Inválida\nInserir novamente a linha\n");
      var l = stdin.readLineSync(encoding: utf8);
      linha = int.tryParse(l ?? '') ?? 0;
    }

    while (coluna < 1 || coluna > 6) {
      stdout.write("Coluna Inválida\nInserir novamente a coluna\n");
      var c = stdin.readLineSync(encoding: utf8);
      coluna = int.tryParse(c ?? '') ?? 0;
    }

    if (matriz[linha][coluna] != ' ') {
      stdout.write("Posição já esta ocupada, favor inserir outra.\n");
    }
  } while (matriz[linha][coluna] != ' ');

  matriz[linha][coluna] = letra;

  transforma3x3(matriz, matriz1, matriz2, matriz3, matriz4);

  stdout.write(
      "\nEscolha um quadrante para virar ou 5 para sair do jogo:\n 1 - Primeiro\n 2 - Segundo\n 3 - Terceiro\n 4 - Quarto\n");
  var q = stdin.readLineSync(encoding: utf8);
  quadran = int.tryParse(q ?? '') ?? 0;

  while (quadran < 1 || quadran > 5) {
    stdout.write("\nQuadrante Inválido\nFavor inserir novamente.\n");
    var q = stdin.readLineSync(encoding: utf8);
    quadran = int.tryParse(q ?? '') ?? 0;
  }

  if (quadran == 5) {
    stdout.write("\nObrigado por jogar.\n");
    exit(0);
  }

  stdout.write(
      "\nEscolha para qual lado rotacionar:\nD - Direita\nE - Esquerda\n");
  lado = stdin.readLineSync(encoding: utf8) ?? '';

  lado = lado.toUpperCase();

  while (lado != 'D' && lado != 'E') {
    stdout.write("Lado Inválido\nFavor inserir novamente.\n");
    lado = stdin.readLineSync(encoding: utf8) ?? '';
    lado = lado.toUpperCase();
  }

  if (lado == 'D') {
    switch (quadran) {
      case 01:
        giradireita(matriz1);
        break;
      case 02:
        giradireita(matriz2);
        break;
      case 03:
        giradireita(matriz3);
        break;
      case 04:
        giradireita(matriz4);
        break;
    }
  } else {
    if (lado == 'E') {
      switch (quadran) {
        case 01:
          giraesquerda(matriz1);
          break;
        case 02:
          giraesquerda(matriz2);
          break;
        case 03:
          giraesquerda(matriz3);
          break;
        case 04:
          giraesquerda(matriz4);
          break;
      }
    }
  }

  clear();

  imprimirtoda(matriz1, matriz2, matriz3, matriz4);
  transforma6x6(matriz, matriz1, matriz2, matriz3, matriz4);
}

void main() {
  stdout.write("     Seja bem-vindo ao JOGO DE 5 EM LINHA\n");
  stdout.write("OBJETIVO: É formar uma sequencia de cinco ( O ou X ).\n");
  stdout.write("COMO JOGAR: O jogo � composto por um tabuleiro de 6x6,\n");
  stdout.write("sendo 4 de 3x3 como vocês podem ver a seguir:\n\n");
  stdout.write(
      "            1  2  3  |  4  5  6  \n         1 [ ][ ][ ] | [ ][ ][ ]\n         2 [ ][ ][ ] | [ ][ ][ ]\n         3 [ ][ ][ ] | [ ][ ][ ]\n");
  stdout.write("           ----------+----------\n");
  stdout.write(
      "         4 [ ][ ][ ] | [ ][ ][ ]\n         5 [ ][ ][ ] | [ ][ ][ ]\n         6 [ ][ ][ ] | [ ][ ][ ]\n\n");
  stdout.write("Dessa forma, você escolher� a posição(LINHA COLUNA), e logo\n");
  stdout.write(
      "depois escolher� o quadrante (1-4), e também para qual lado deseja.\n");
  stdout.write("rotacionar o quadrante escolhido.");

  clear();

  String primeiro;
  String segundo;

  stdout.write("Qual o nome do Primeiro jogador?\n");
  primeiro = stdin.readLineSync(encoding: utf8) ?? '';
  stdout.write("Qual o nome do Segundo jogador?\n");
  segundo = stdin.readLineSync(encoding: utf8) ?? '';

  clear();

  String j1 = 'O';
  String j2 = 'X';
  Matriz tabuleiro = gerarMatriz(6);

  for (i = 1; i <= 6; i++) {
    for (j = 1; j <= 6; j++) {
      tabuleiro[i][j] = ' ';
    }
  }

  int g = 0;
  int resultado = 0;

  while (g < 18) {
    jogador(tabuleiro, primeiro, j1);
    resultado = testar(tabuleiro, j1);
    if (resultado == 1) {
      stdout.write("\nParabéns $primeiro, você foi o ganhador !\n");
      break;
    }
    jogador(tabuleiro, segundo, j2);
    resultado = testar(tabuleiro, j2);
    if (resultado == 1) {
      stdout.write("\nParabéns $segundo, você foi o ganhador !\n");
      break;
    }
    g++;
  }

  if (g >= 18) {
    stdout.write("\nParabéns ao dois jogadores, os dois foram vencedores !\n");
    pause();
  }

  pause();
}

Matriz gerarMatriz(int n) {
  return List.generate(n + 1, (_) => List.generate(n + 1, (_) => ''));
}

void pause() {
  stdin.readLineSync();
}

void clear() {
  stdout.write("\x1B[2J\x1B[H");
}
