//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ fskin ]-------------------------------------------------//
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

// Opis:
/*
	
*/


// Notatki skryptera:
/*
	
*/

YCMD:fskin(playerid, params[], help)
{
    if(IsPlayerConnected(playerid))
    {
		if(GetPlayerAdminDutyStatus(playerid) == 1)
		{
			sendErrorMessage(playerid, "Nie mo�esz tego u�y�  podczas @Duty! Zejd� ze s�u�by u�ywaj�c /adminduty");
			return 1;
		}
		if (IsAtClothShop(playerid) || (GetPlayerOrg(playerid) == FAMILY_RSC && 
            IsPlayerInRangeOfPoint(playerid, 4.0, 1636.9476,-1813.6195,13.5263)) ||
            IsPlayerInRangeOfPoint(playerid, 4.0, 1147.3623,-1314.4891,13.6743) || //duty ers
            IsPlayerInRangeOfPoint(playerid, 4.0, GetPVarFloat(playerid,"xposspawn"),GetPVarFloat(playerid,"yposspawn"),GetPVarFloat(playerid,"zposspawn")))
		{
            new frac = GetPlayerFraction(playerid);
            new fam = GetPlayerOrg(playerid);
            if(frac != 0)
            {
                //FRAC_SKINS
                return SendClientMessage(playerid, COLOR_GRAD2, "Twoja frakcja nie ma w�asnych skin�w.");
            }
            else if(fam != 0)
            {
                //FAM_SKINS
                return SendClientMessage(playerid, COLOR_GRAD2, "Twoja rodzina nie ma w�asnych skin�w.");
            }
            else return SendClientMessage(playerid, COLOR_GRAD2, "Nie mo�esz tego u�y�.");
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "Nie jeste� w sklepie z ubraniami lub na miejscu spawnu!");
			return 1;
		}
	}
	return 1;
}
