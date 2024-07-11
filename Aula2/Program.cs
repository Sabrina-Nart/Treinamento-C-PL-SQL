using Aula2;
using static System.Net.Mime.MediaTypeNames;

//Objetos mais complexos = pode ter blocos maiores de códigos

Funcao geraAleatorios = new Funcao();

int parada = 0;
int contador = 0;

int resultado = geraAleatorios.GeraAleatorios(parada, "Sabrina"); //Enviar dados para lá


///////////////////////////


//Defina um valor, a partir de um cálculo 

do
{
    int[] numerosAleatorios = new int[3];

    //Coleções = Listas, pilhas e fulas - já se présupõe que é um array

    //Listas = lista de elementos - dinâmica - armazena quantos elementos eu quiser
    List<int> listaNumerosAleatorios = new List<int>();
    listaNumerosAleatorios.Add(3);
    listaNumerosAleatorios.Add(5);
    listaNumerosAleatorios.Add(6);

    foreach(var item in listaNumerosAleatorios) //Vai receber o valor da lista
    {
        Console.WriteLine("Número: " + item);
    }

    //Pilha = coloco valores e quando tendo obter, eu tenho que pegar o último valor que foi colocado

    //Fila = a primeira informação que eu coloquei, é a primeira que irá sair

    //Números aleátorios com base nos segundos do relógio da máquina
    
    contador++;

    if (contador > 3 || contador < 1)
    {
        contador = 1;
    }

    int aleatorioGerado = geraAleatorios.GeraAleatorios(parada);

    Console.WriteLine("Número aleatório: " + aleatorioGerado);

    int erro;
    do
    {
        erro = 0;

        try //Tente (fazer o que está aqui dentro)
        {
            Console.WriteLine("Informe 1 para finalizar, 2 para opróximo número ou 3 para gerar vários números aleatórios.");
            parada = Convert.ToInt16(Console.ReadLine()); //Converter o que está sendo digitado de string para inteiro
        }
        catch (Exception e) //Pegue o erro
        {
            erro = 1;
            Console.WriteLine("Número inválido!");
        }
    }while (erro != 0);

    var x = 0;

} while (parada != 1 && parada != 3);

//////////////////////////////////////////////

if (parada == 3)
{
    Console.WriteLine("Informe quantos números aleatórios você gostaria de gerar. Limite a 5 números");
    int qtdAleatorios = Convert.ToInt16(Console.ReadLine());

    for (int gerador = 1; gerador <= qtdAleatorios; gerador++)
    {

        contador++;

        if (contador > 3 || contador < 1)
        {
            contador = 1;
        }

        int valorFinal = geraAleatorios.GeraAleatorios(parada);

        switch (gerador)
        {
            case 1:
                Console.WriteLine("Primeiro aleatório: " + valorFinal);
                break;
            case 2:
                Console.WriteLine("Segundo aleatório: " + valorFinal);
                break;
            case 3:
                Console.WriteLine("Terceiro aleatório: " + valorFinal);
                break;
            case 4:
                Console.WriteLine("Quarto aleatório: " + valorFinal);
                break;
            case 5:
                Console.WriteLine("Quinto aleatório: " + valorFinal);
                break;
        }
    }
}


