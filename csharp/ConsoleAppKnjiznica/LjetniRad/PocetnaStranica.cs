﻿namespace LjetniRad;

internal class PocetnaStranica
{
    private static obradaClana ObradaClana { get; set; }
    private static obradaKnjige ObradaKnjige { get; set; }
    private static ObradaEvidencije ObradaEvidencije { get; set; }

    public PocetnaStranica()
    {
        ObradaClana = new obradaClana();
        ObradaKnjige = new obradaKnjige();
        ObradaEvidencije = new ObradaEvidencije();
        IspisNazivaAplikacije();
        PrikaziPocetnu();

    }


    private void IspisNazivaAplikacije()
    {
        Console.WriteLine("-------------------------------------");
        Console.WriteLine("-----Knjiznica Console APP v 1.0-----");
        Console.WriteLine("-------------------------------------");
    }

    public static void PrikaziPocetnu()
    {
        Pomocno.dodajPrazanRed();
        Console.WriteLine("1. Clanovi");
        Console.WriteLine("2. Knjige");
        Console.WriteLine("3. Evidencije posudbe");
        Console.WriteLine("4. Izlaz iz programa");
        Pomocno.dodajPrazanRed();
        switch(Pomocno.ucitajBrojRaspon("Odaberite stavku izbornika:",
                   "Odabir treba biti od 1-4",1,4))
        {
            case 1:
                Pomocno.obrisiEkran();
                ObradaClana.PrikaziIzbornik();
                PrikaziPocetnu();
                break;

            case 2:
                Pomocno.obrisiEkran();
                ObradaKnjige.PrikaziIzbornik();
                PrikaziPocetnu();
                break;
            case 3:
                Pomocno.obrisiEkran();
                Console.WriteLine("Evidencija posudbe");
                ObradaEvidencije.PrikaziIzbornik();
                break;
            case 4:
                Pomocno.obrisiEkran();
                Console.WriteLine("Hvala na koristenju, dovidenja");
                break;

        }

    }
}