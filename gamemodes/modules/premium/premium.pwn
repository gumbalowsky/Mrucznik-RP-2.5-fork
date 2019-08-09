//-----------------------------------------------<< Source >>------------------------------------------------//
//----------------------------------------------------*------------------------------------------------------//
//----[                                                                                                 ]----//
//----[         |||||             |||||                       ||||||||||       ||||||||||               ]----//
//----[        ||| |||           ||| |||                      |||     ||||     |||     ||||             ]----//
//----[       |||   |||         |||   |||                     |||       |||    |||       |||            ]----//
//----[       ||     ||         ||     ||                     |||       |||    |||       |||            ]----//
//----[      |||     |||       |||     |||                    |||     ||||     |||     ||||             ]----//
//----[      ||       ||       ||       ||     __________     ||||||||||       ||||||||||               ]----//
//----[     |||       |||     |||       |||                   |||    |||       |||                      ]----//
//----[     ||         ||     ||         ||                   |||     ||       |||                      ]----//
//----[    |||         |||   |||         |||                  |||     |||      |||                      ]----//
//----[    ||           ||   ||           ||                  |||      ||      |||                      ]----//
//----[   |||           ||| |||           |||                 |||      |||     |||                      ]----//
//----[  |||             |||||             |||                |||       |||    |||                      ]----//
//----[                                                                                                 ]----//
//----------------------------------------------------*------------------------------------------------------//
// Autor: Mrucznik
// Data utworzenia: 04.05.2019
//Opis:
/*
	Monetyzacja, us�ugi premium.
*/

//

//-----------------<[ Include: ]>-------------------
#include "premium_dialogs.pwn"

//-----------------<[ Funkcje: ]>-------------------
premium_ConvertToNewSystem(playerid)
{
	if(PlayerInfo[playerid][pDonateRank] != 0)
	{
		DajKP(playerid, gettime()+KP_3_MIESIACE, false); // KP na 3 msc dla os�b, kt�re mieli premiuma na starym systemie
		DajMC(playerid, 500); // i jeszcze prezent...

		_MruGracz(playerid, "Uwaga! Twoje premium zosta�o przeniesione na nowy system!");
		_MruGracz(playerid, "Otrzyma�e� Konto Premium na 3 miesi�ce i dodatkowe 500 MC do wykorzystania.");

		Log(premiumLog, INFO, "%s otrzyma� konwersje KP %d na nowy system", GetPlayerLogName(playerid), PlayerInfo[playerid][pDonateRank]);
		PlayerInfo[playerid][pDonateRank] = 0;
	}
}

premium_clearCache(playerid)
{
	PremiumInfo[playerid][pMC] = 0;
	PremiumInfo[playerid][pKP] = 0;
	PremiumInfo[playerid][pExpires] = 0;

	for(new i; i<MAX_PREMIUM_SKINS; i++)
	{
		UniqueSkins[playerid][i] = false;
	}
}

premium_loadForPlayer(playerid)
{
	if(PlayerInfo[playerid][pDonateRank] != 0)
	{
		premium_ConvertToNewSystem(playerid);
	}

	new kpMC, kpStarted, kpEnds, kpLastLogin, kpActive;
	MruMySQL_LoadPremiumData(playerid, kpMC, kpEnds, kpStarted, kpLastLogin, kpActive);

	if(kpActive)
	{
		new shouldEnd = kpEnds-(gettime()+3600);
		if(kpEnds != 0 && shouldEnd <= 0)
		{
			sendErrorMessage(playerid, "Twoje konto premium wygas�o!");
			PremiumInfo[playerid][pKP] = 0;
			ZabierzKP(playerid);
		}
		else
		{
			new expirationTime = kpEnds-gettime();
			if(expirationTime < KP_TYDZIEN)
			{
				_MruAdmin(playerid, 
					sprintf("UWAGA! Twoje konto premium wygasa za %d dni i %d godzin", 
						floatround(floatdiv(expirationTime, 86400), floatround_floor), 
						floatround(floatdiv(expirationTime, 3600), floatround_floor)%24
					)
				);
			}
			else
			{
				_MruAdmin(playerid, "Jeste� posiadaczem konta premium! :)");
			}
			PremiumInfo[playerid][pKP] = 1;
		}
		if(IsPlayerPremium(playerid)) 
		{
			PremiumInfo[playerid][pExpires] = kpEnds;
		}
	}

	if(kpMC > 0) PremiumInfo[playerid][pMC] = kpMC;

	MruMySQL_LoadPlayerUniqueSkins(playerid);
}

premium_printMcBalance(playerid)
{
	return _MruGracz(playerid, sprintf("Aktualnie na Twoim koncie znajduje si� %d MruCoins.", PremiumInfo[playerid][pMC]));
}

//---< Private >---
ZabierzKP(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		Log(premiumLog, E_LOGLEVEL:DEBUG, "%s zabrano KP", GetPlayerLogName(playerid));
		PremiumInfo[playerid][pKP] = 0;
		MruMySQL_RemoveKP(playerid);
	}
}

DajKP(playerid, time, bool:msg=true)
{
	if(IsPlayerConnected(playerid))
    {
		Log(premiumLog, E_LOGLEVEL:DEBUG, "%s nadano KP na %d", GetPlayerLogName(playerid), time);
        MruMySQL_SetKP(playerid, time);

        new expirationTime = time-gettime();
        if(expirationTime > 0 && time != 0)
        {
        	if(msg)
        	{
	            _MruAdmin(playerid, 
					sprintf("Otrzyma�e� Konto Premium. Wygasa ono za %d dni i %d godzin.", 
						floatround(floatdiv(expirationTime, 86400), floatround_floor), 
						floatround(floatdiv(expirationTime, 3600), floatround_floor)%24
					)
				);
        	}

			PremiumInfo[playerid][pExpires] = time;
            PremiumInfo[playerid][pKP] = 1;
        }
        else if(time == 0)
        {
            _MruAdmin(playerid, "Otrzyma�e� konto Premium na czas nieokre�lony.");
            PremiumInfo[playerid][pKP] = 1;
        }
    }
}

DajMC(playerid, mc)
{
	Log(premiumLog, E_LOGLEVEL:DEBUG, "%s nadano %dMC", GetPlayerLogName(playerid), mc);
	if(mc <= 0)
	{
		Log(premiumLog, ERROR,"ERROR: funkcja DajMC miala ujemna wartosc dla %s Wartosc: %d", GetPlayerLogName(playerid), mc);
		return 0;
	}

	PremiumInfo[playerid][pMC] += mc;
	MruMySQL_SaveMc(playerid);
	return 1;
}

ZabierzMC(playerid, mc)
{
	Log(premiumLog, E_LOGLEVEL:DEBUG, "%s zabrano %dMC", GetPlayerLogName(playerid), mc);
	if(mc <= 0)
	{
		Log(premiumLog, ERROR, "ERROR: funkcja ZabierzMC miala ujemna wartosc dla %s", GetPlayerLogName(playerid), mc);
		return 0;
	}

	PremiumInfo[playerid][pMC] -= mc;
	MruMySQL_SaveMc(playerid);
	return 1;
}

KupKP(playerid)
{
	ZabierzMC(playerid, MIESIAC_KP_CENA);
	DajKP(playerid, gettime()+KP_MIESIAC);
	SendClientMessage(playerid, COLOR_LIGHTGREEN, "Gratulacj�! Zakupi�e� konto premium. Od teraz masz dost�p do mo�liwo�ci premium. Dzi�kujemy za wspieranie serwera!"); 
}

PrzedluzKP(playerid)
{
	ZabierzMC(playerid, PRZEDLUZ_KP_CENA);
	DajKP(playerid, PremiumInfo[playerid][pExpires]+KP_MIESIAC);
	SendClientMessage(playerid, COLOR_LIGHTGREEN, "Konto premium przed�u�one :D!"); 
}

KupPojazdPremium(playerid, id)
{
	if(!(id < MAX_PREMIUM_VEHICLES && id >= 0))
	{
		DialogPojazdyPremium(playerid);
		return 1;
	}
	if(PremiumInfo[playerid][pMC] < PojazdyPremium[id][Cena])
	{
		sendErrorMessage(playerid, "Nie sta� Ci� na ten pojazd");
		return DialogPojazdyPremium(playerid);
	}
	MRP_ShopPurchaseCar(playerid, PojazdyPremium[id][Model], PojazdyPremium[id][Cena]);
	Log(premiumLog, INFO, "%s kupil pojazd premium %s za %dMC",
		GetPlayerLogName(playerid), 
		VehicleNames[PojazdyPremium[id][Model]-400], 
		PojazdyPremium[id][Cena]);
	premium_printMcBalance(playerid);
	DialogMenuDotacje(playerid);
	return 1;
}

KupPrzedmiotPremium(playerid, id)
{
	if(PremiumInfo[playerid][pMC] < PrzedmiotyPremium[id][Cena])
	{
		sendErrorMessage(playerid, "Nie sta� Ci� na ten przedmiot!");
		return DialogPrzedmioty(playerid);
	}

	MruMySQL_InsertPremiumItem(playerid, id);

	Log(premiumLog, INFO, "%s kupi� unikatowy przedmiot %d za %dMC",
		GetPlayerLogName(playerid), 
		PrzedmiotyPremium[id][Model], 
		PrzedmiotyPremium[id][Cena]);

	ZabierzMC(playerid, PrzedmiotyPremium[id][Cena]);
	//TODO: doda� item do posiadanych
	//TODO: dodac nazwy przedmiotow
	_MruAdmin(playerid, sprintf("Gratulujemy dobrego wyboru. Kupi�e� przedmiot o ID %d za %d MC.", SkinyPremium[id][Model], PrzedmiotyPremium[id][Cena]));
	_MruAdmin(playerid, "List� swoich przedmiot�w premium znajdziesz pod komend� /przedmioty");

	premium_printMcBalance(playerid);
	return 1;
}

KupSlotPojazdu(playerid)
{
	if(!IsPlayerConnected(playerid)) return 1;

	if(PremiumInfo[playerid][pMC] < CAR_SLOT_CENA)
	{
		sendErrorMessage(playerid, "Nie sta� Ci� na zakup dodatkowego slotu.");
		return DialogSlotyPojazdu(playerid);
	}

	if(MRP_GetPlayerCarSlots(playerid) >= 10)
	{
		sendErrorMessage(playerid, "Masz ju� maksymaln� ilo�� slot�w.");
		return DialogMenuDotacje(playerid);
	}

	ZabierzMC(playerid, CAR_SLOT_CENA);
	MRP_SetPlayerCarSlots(playerid, MRP_GetPlayerCarSlots(playerid)+1);

	Log(premiumLog, INFO, "%s kupi� slot wozu za "#CAR_SLOT_CENA"MC",
		GetPlayerLogName(playerid));
	_MruAdmin(playerid, sprintf("Kupi�e� sobie slot na auto za %d MC. Masz teraz %d slot�w.", CAR_SLOT_CENA, MRP_GetPlayerCarSlots(playerid)));

	premium_printMcBalance(playerid);
	DialogMenuDotacje(playerid);
	return 1;
}

KupZmianeNicku(playerid)
{
	if(!IsPlayerConnected(playerid)) return 1;

	if(PremiumInfo[playerid][pMC] < ZMIANA_NICKU_CENA)
	{
		sendErrorMessage(playerid, "Nie sta� Ci� na zakup dodatkowej zmiany nicku");
		return DialogZmianyNicku(playerid);
	}

	ZabierzMC(playerid, ZMIANA_NICKU_CENA);
	MRP_SetPlayerNickChanges(playerid, MRP_GetPlayerNickChanges(playerid)+1);

	Log(premiumLog, INFO, "%s kupil zmiane nicku za "#ZMIANA_NICKU_CENA"MC",
		GetPlayerLogName(playerid));
	_MruAdmin(playerid, sprintf("Kupi�e� sobie zmian� nicku za %d MC. Masz teraz %d zmian nicku.", ZMIANA_NICKU_CENA, MRP_GetPlayerNickChanges(playerid)));

	premium_printMcBalance(playerid);
	DialogMenuDotacje(playerid);
	return 1;
}

KupSkinPremium(playerid, id)
{
	if(PremiumInfo[playerid][pMC] < SkinyPremium[id][Cena])
	{
		sendErrorMessage(playerid, "Nie sta� Ci� na ten skin");
		return DialogSkiny(playerid);
	}

	MruMySQL_InsertSkin(playerid, id);

	Log(premiumLog, INFO, "%s kupi� unikatowy skin %d za %dMC",
		GetPlayerLogName(playerid), 
		SkinyPremium[id][Model], 
		SkinyPremium[id][Cena]);

	UniqueSkins[playerid][id] = true;

	ZabierzMC(playerid, SkinyPremium[id][Cena]);

	_MruAdmin(playerid, sprintf("Gratulujemy dobrego wyboru. Kupi�e� skin o ID %d za %d MC.", SkinyPremium[id][Model], SkinyPremium[id][Cena]));
	_MruAdmin(playerid, "List� swoich skin�w premium znajdziesz pod komend� /skiny");

	premium_printMcBalance(playerid);
	return 1;
}

KupNumerTelefonu(playerid, string:_numer[])
{
	if(!IsPlayerConnected(playerid)) return 1;
	if(strlen(_numer) < 1) return DialogTelefon(playerid);
	if(strlen(_numer) > 9) return DialogTelefon(playerid);

	new numer = strval(_numer);

	if(!MRP_IsPhoneNumberAvailable(numer))
	{

		new cena;

		if(strlen(_numer) == 1)
			cena = TELEFON_CENA_1;
		else if(strlen(_numer) == 2)
			cena = TELEFON_CENA_2;
		else if(strlen(_numer) == 3)
			cena = TELEFON_CENA_3;
		else if(strlen(_numer) == 4)
			cena = TELEFON_CENA_4;
		else
			cena = TELEFON_CENA_5;

		if(PremiumInfo[playerid][pMC] < cena)
		{
			sendErrorMessage(playerid, "Nie sta� Ci� na ten numer telefonu");
			return DialogTelefon(playerid);
		}

		ZabierzMC(playerid, cena);
		MRP_SetPlayerPhone(playerid, numer);

		_MruAdmin(playerid, sprintf("Tw�j nowy numer telefonu: %d.", numer));
		Log(premiumLog, INFO, "%s kupil numer telefonu %d za %dMC.",
			GetPlayerLogName(playerid), numer, cena);

		premium_printMcBalance(playerid);
		DialogMenuDotacje(playerid);
	}
	else
	{
		sendErrorMessage(playerid, "Ten numer jest ju� zaj�ty!");
		return DialogTelefon(playerid);
	}

	return 1;
}

//---< Is >---
IsPlayerPremium(playerid)
{
	if(PremiumInfo[playerid][pKP] == 1)
		return 1;
	return 0;
}

IsPlayerPremiumOld(playerid)
{
	if(PremiumInfo[playerid][pKP] == 1)
		return 1;
	if(PlayerInfo[playerid][pDonateRank] != 0)
		return 1;
	return 0;
}

IsAUnikat(modelid)
{
	for(new i; i<MAX_PREMIUM_VEHICLES; i++)
		if(modelid == PojazdyPremium[i][Model])
			return 1;
	return 0;
}

PlayerHasSkin(playerid, skinid)
{
	for(new i; i<MAX_PREMIUM_SKINS; i++)
	{
		if(SkinyPremium[i][Model] == skinid)
		{
			return UniqueSkins[playerid][i];
		}
	}
	return false;
}

PlayerHasPremiumItem(playerid, item)
{
	//TODO: impl
	return false;
}

// returns -1 if skin is not premium skin,
// returns id of premium skin othervise
GetPremiumSkinSlot(skin)
{
	for(new i; i<MAX_PREMIUM_SKINS; i++)
	{
		if(SkinyPremium[i][Model] == skin)
		{
			return i;
		}
	}
	return -1;
}

//end