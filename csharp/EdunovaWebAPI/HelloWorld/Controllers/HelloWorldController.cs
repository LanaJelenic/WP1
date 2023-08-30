﻿
using Microsoft.AspNetCore.Mvc;
namespace HelloWorld.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class HelloWorldController:ControllerBase
    {
        [HttpGet]
        public string Hello()
        {
            return "Hello world";
        }
        [HttpGet]
        [Route("pozdrav")]
        public string DrugaMetoda()
        {
            return "Pozdrav svijetu";
        }
        [HttpGet]
        [Route("pozdravParametar")]
        public string DrugbMetoda(string s) 
        {
            return "Hello" + s;
        }
        [HttpGet]
        [Route("pozdravViseParametara")]
        public string DrugaMetoda(string s="",int i=0)
        {
            return "Hello" + s + " " + i;
        }
        [HttpGet]
        [Route("zad1")]
        public string Metoda()
        {
            return "Lana";
        }
        [HttpGet]
        [Route("zad2")]
        public int DrugaMetoda(int x,int y)
        {
            return x+ y;
        }

        // DZ

        //  Kreirajte rutu /HelloWorld/zad3
        //  koja prima parametar brojPonavljanja
        //  Ruta vraća niz znakova "Osijek" koji
        //  ima onoliko elemenata koliko smo primili u
        //  brojPonavljanja
        [HttpGet]
        [Route("zad3")]
        public string DrugaMetoda(int brojPonavljanja)
        {
            string s = "";
            for (int i = 0; i < brojPonavljanja; i++)
            {
                s += "Osijek ";
            }

            return s;



            [HttpGet]
            [Route("ciklicna")]
            public int[,] DrugaMetoda(int x, int y)
            {
                // Kreirati rutu /HelloWorld/ciklicna
                // koja prima dva parametra (x i y) a vraća
                // cikličnu matricu kao dvodimenzionalni niz brojeva

                int[,] matrica = new int[x, y];
                int pocetniRed = 0, pocetniStupac = 0, broj = 1;
                int zadnjiRed = matrica.GetLength(0) - 1;
                int zadnjiStupac = matrica.GetLength(1) - 1;



                while (pocetniRed <= zadnjiRed && pocetniStupac <= zadnjiStupac)
                {
                    // *************************** desno ***********************************
                    for (int i = pocetniStupac; i <= zadnjiStupac; i++)
                    {
                        matrica[pocetniRed, i] = broj++;
                    }

                    pocetniRed++;

                    // *************************** dolje ***********************************
                    for (int j = pocetniRed; j <= zadnjiRed; j++)
                    {
                        matrica[j, zadnjiStupac] = broj++;
                    }

                    zadnjiStupac--;

                    // *************************** lijevo ***********************************
                    if (pocetniRed <= zadnjiRed)
                    {
                        for (int j = zadnjiStupac; j >= pocetniStupac; j--)
                        {
                            matrica[zadnjiRed, j] = broj++;
                        }
                    }

                    zadnjiRed--;

                    // *************************** gore ***********************************
                    if (pocetniStupac <= zadnjiStupac)
                    {
                        for (int i = zadnjiRed; i >= pocetniRed; i--)
                        {
                            matrica[i, pocetniStupac] = broj++;
                        }
                    }

                    pocetniStupac++;
                }

                return (matrica);




            }
}
