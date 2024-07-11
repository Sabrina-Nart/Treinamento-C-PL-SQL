using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aula2
{
    public class Funcao //Fazer algo que eu não quero repetir - Devinir se irá ou não retornar algo
    {
        //Passar valores de um lado para outro
        //Void = vázio
        //() = Serve para receber informação - depositar algo - Chama a função, que deverá ter uma variável para receber
        public int GeraAleatorios(int contador) //Função acessada por outros, que retornará um iteiro, que será o número aleatório e tem um nome
        {
            int segundos = System.DateTime.Now.Second;
            int valorFinal = segundos * contador;

            return valorFinal; //Retornar um valor inteiro aleatório
        }

        public int GeraAleatorios(int contador, string nome)
        {
            int segundos = System.DateTime.Now.Second;
            int valorFinal = segundos * contador;

            return valorFinal; //Retornar um valor inteiro aleatório
        }

        //Envio esse valor e recebo em uma caixinha

        public int ValidaNumero(int numero)
        {
            int novoNumero = numero + 5;

            return novoNumero;
        }

        //Posso ter mais de uma função com o mesmo nome, desde que os parametros sejam diferentes
    }
}
