﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LjetniRad
{
    internal class obradaKnjige
    {
        public static List<Knjiga> Knjige { get; set; }

        public obradaKnjige() 
        {
          Knjige = new List<Knjiga>();
            if(Pomocno.dev)
            {
                TestniPodaci();
            }
        }

        public void PrikaziIzbornik()
        {
            Console.WriteLine("Izbornik za rad s knjigama");
            Console.WriteLine(" 1. Pregled postojecih knjiga");
            Console.WriteLine(" 2. Unos nove knjige:");
            Console.WriteLine(" 3. Promjena postojece knjige");
            Console.WriteLine(" 4. Brisanje knjige:");
            Console.WriteLine(" 5. Povratak na pocetnu stranicu");

            switch(Pomocno.ucitajBrojRaspon("Odaberite stavku izbornika knjiga:",
                "Odabir treba biti od 1-5",1,5))
            {
                case 1:
                    PregledKnjiga();
                    PrikaziIzbornik();
                    break;
                case 2:
                    UnosKnjige();
                    PrikaziIzbornik();
                    break;
                case 3:
                    PromjenaKnjige();
                    PrikaziIzbornik();
                    break;
                case 4:
                    BrisanjeKnjige();
                    PrikaziIzbornik();
                    break;
                case 5:
                    Pomocno.obrisiEkran();
                    PocetnaStranica.PrikaziPocetnu();
                    Console.WriteLine("Zavrsen rad s knjigama");
                    break;
            }
        }

        public static void PregledKnjiga()
        {
            Console.WriteLine("-----------------");
            Console.WriteLine("------Knjige-----");
            Console.WriteLine("-----------------");
            int b = 1;

            foreach(Knjiga knjiga in Knjige)
            {
                Console.WriteLine("{0}. {1},{2} {3},br. stranica-{4}",b++,knjiga.Naslov,knjiga.ImeAutora,knjiga.PrezimeAutora,knjiga.BrojStranica);
            }
            Console.WriteLine("-----------------");
        }

        private void UnosKnjige()
        {
            var k = new Knjiga();
            int id = Pomocno.UcitajBroj("Unesite ID clana:", "Unos bi trebao biti pozitivni cijeli broj");
            while (ProvjeriId(id))
            {
                Console.WriteLine("ID: {0} već postoji u evidenciji!!",id);
                id = Pomocno.UcitajBroj("Unesite id knjige:", "Unos bi trebao biti pozitivni cijeli broj!");
                k.Id = id;
            }
            k.Naslov = Pomocno.UcitajString("Unesite naslov knjige:", "Naslov je obavezan!!");
            k.ImeAutora = Pomocno.UcitajString("Unesite ime autora:", "Ime je obavezno!!");
            k.PrezimeAutora = Pomocno.UcitajString("Unesite prezime autora:", "Prezime je obavezno!!");
            k.Sazetak = Pomocno.UcitajString("Unesite sazetak:", "Sazetak bi trebao biti unesen");
            k.BrojStranica = Pomocno.UcitajBroj("Unesite broj stranica:", "Broj stranica bi trebao biti upisan");
            if (Pomocno.spremiPromjene())
            {
                Knjige.Add(k);
            }
        }

        private bool ProvjeriId(int id)
        {
            foreach (var knjiga in Knjige)
            {
                if (knjiga.Id==id)
                {
                    return true;
                }
            }

            return false;
        }

        private void PromjenaKnjige()
        {
            PregledKnjiga();
            int br = Pomocno.ucitajBrojRaspon("Odaberite ID knjige:", "Error!", 1, Knjige.Count());
            var k = Knjige[br - 1];
            var stariPodatci = SacuvajPodatke();
           
            k.Naslov = Pomocno.UcitajString("Unesite naslov knjige(" + k.Naslov + "):", "Naslov je obavezan!!");
            k.ImeAutora=Pomocno.UcitajString("Unesite ime autora(" + k.ImeAutora +"):", "Ime je obavezno!!");
            k.PrezimeAutora=Pomocno.UcitajString("Unesite prezime autra(" + k.PrezimeAutora + "):", "Prezime je obavezno!!");
            k.Sazetak=Pomocno.UcitajString("Unesite sazetak(" + k.Sazetak +"):", "Sazetak bi trebao biti unesen");
            k.BrojStranica=Pomocno.UcitajBroj("Unesite broj stranica(" + k.BrojStranica +"):", "Broj stranica bi trebao biti upisan");
            if (!Pomocno.spremiPromjene())
            {
                Knjige[br - 1] = stariPodatci[0];
            }
        }

        private List<Knjiga> SacuvajPodatke()
        {
            List<Knjiga> podatci = new List<Knjiga>();
            foreach (var knjiga in Knjige)
            {
                podatci.Add(knjiga);
            }

            return podatci;
        }

        private void BrisanjeKnjige()
        {
            PregledKnjiga();
            int br = Pomocno.ucitajBrojRaspon("Odaberite ID knjige:", "Error!!", 1, Knjige.Count());
            if (Pomocno.spremiPromjene())
            {
                Knjige.RemoveAt(br-1);
            }
        }

        public static List<Knjiga> SveKnjige()
        {
            return Knjige;
        }

        private void TestniPodaci()
        {
            Knjige.Add(new Knjiga
            {
                        
                Id=1,
                Naslov="Wayward pines",
                ImeAutora="Blake",
                PrezimeAutora="Crouch",
                Sazetak= "Gradić Wayward Pines okružen je elektrificiranom ogradom s bodljikavom žicom na vrhu..",
                BrojStranica=335
            });

            Knjige.Add(new Knjiga
            {
                Id = 2,
                Naslov="Mrtva priroda",
                ImeAutora="Joy",
                PrezimeAutora="Fielding",
                Sazetak= "Od teških ozljeda Casey pada u komu. Cijelo je vrijeme svjesna svoje okoline..",
                BrojStranica=328
            });

            Knjige.Add(new Knjiga
            {
                Id = 3,
                Naslov="Institut",
                ImeAutora="Stephen",
                PrezimeAutora="King",
                Sazetak= "Usred noći, u obiteljskoj kući u predgrađu Minneapolisa nepoznati provalnici ubijaju roditelje Lukea Ellisa..",
                BrojStranica=656

            });
        }
    }
}
