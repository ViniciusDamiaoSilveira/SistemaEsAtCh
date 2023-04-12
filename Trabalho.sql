#include <stdio.h>
#define ANDARES 10
#define APTOS 4

int predio[ANDARES][APTOS];

void inicializarPredio() {
    for(int i = 0; i < ANDARES; i++) {
        for(int j = 0; j < APTOS; j++) {
            predio[i][j] = 0;
        }
    }
}

void informarMoradores(int andar, int unidade, int numero) {
    predio[andar-1][unidade-1] = numero;
}

int main()
{
    int opcao = 0;
    
    do {
        //retorno da flecha
        printf("\n1) Inicializar o predio");
        printf("\n2) Alterar o numero de moradores de uma unidade");
        printf("\n3) Consultar o numero de moradores de uma unidade");
        printf("\n4) Imprimir o numero de moradores de cada unidade");
        printf("\n5) Imprimir o numero de moradores do predio");
        printf("\n6) Imprimir o numero total de moradores de cada andar");
        printf("\n7) Informar quais apartamentos estao vazios (ou seja, sem moradores)");
        printf("\n8) Identificar a unidade com o maior numero de moradores");
        printf("\n9) Finalizar programa.");
        printf("\nDigite a opcao desejada: ");
        scanf("%d", &opcao);
        
        switch(opcao) {
            case 1:
                inicializarPredio();
                break;
            case 2:
                int andar, unidade, numero;
                printf("Digite o andar: ");
                scanf("%d", &andar);
                printf("Digite a unidade: ");
                scanf("%d", &unidade);
                printf("Digite o numero de moradores: ");
                scanf("%d", &numero);
                informarMoradores(andar, unidade, numero);
                break;
            case 3:
                printf("Digite o andar: ");
                scanf("%d", &andar);
                printf("Digite a unidade: ");
                scanf("%d", &unidade);
                printf("O numero de moradores do apartamento %d %d eh: %d", andar, unidade, predio[andar-1][unidade-1]);
                break;
            case 4:
                printf("Andar");
                for(int i = 0; i < APTOS; i++)
                    printf("\tUnd %d", i+1);
                printf("\n");
                for(int i = ANDARES-1; i >= 0; i--) {
                    printf("%d\t", i+1);
                    for(int j = 0; j < APTOS; j++) {
                        printf("%d\t", predio[i][j]);    
                    }
                    printf("\n");
                }
                break;
            case 5:
                int total = 0;
                for(int i = 0; i < ANDARES; i++) {
                    for(int j = 0; j < APTOS; j++) {
                        total += predio[i][j];
                    }
                }
                printf("\nTotal de moradores: %d", total);
                break;
            case 6:
                for(int i = 0; i < ANDARES; i++) {
                    int total = 0;
                    for(int j = 0; j < APTOS; j++) {
                        total += predio[i][j];
                    }
                    printf("\nTotal de moradores do andar %d: %d",i+1, total);
                }
                
                break;
            case 7:
                for(int i = 0; i < ANDARES; i++) {
                    for(int j = 0; j < APTOS; j++) {
                        if(predio[i][j] == 0)
                            printf("\nAndar %d Unidade %d esta vazia\t", i+1, j+1);    
                    }
                }
                break;
            case 8:
                int uniMaior = 0, andarMaior = 0, nMoradores = predio[0][0];
                for(int i =0; i < ANDARES; i++) {
                    for(int j = 0; j < APTOS; j++) {
                        if(nMoradores < predio[i][j]) {
                            uniMaior = j;
                            andarMaior = i;
                            nMoradores = predio[i][j];
                        }
                    }
                }
                printf("O andar %d unidade %d tem o maior numero de moradores %d", 
                    andarMaior+1, uniMaior+1, nMoradores);
                break;
            case 9:
                break;
            default:
            printf("\nDigite um numero valido (1 a 9).");
        }
    } while (opcao != 9);
    
    return 0;
}