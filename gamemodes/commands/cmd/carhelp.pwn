//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ carhelp ]------------------------------------------------//
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

CMD:autopomoc(playerid) return cmd_carhelp(playerid);
CMD:pojazdpomoc(playerid) return cmd_carhelp(playerid);
CMD:samochodpomoc(playerid) return cmd_carhelp(playerid);
CMD:carhelp(playerid)
{
    if(GUIExit[playerid] == 0)
    {
    	ShowPlayerDialogEx(playerid, 449, DIALOG_STYLE_MSGBOX, "Komendy auta", "/parkuj\n/auto\n/autoklucze\n/dajklucze\n/oddajklucze\n/dajauto\n/sprzedajlodz\n/sprzedajheli\n/lwymiana\n/hwymiana\n/garazuj\n/wywalklucze", "Wyjd�", "Wyjdz");
	}
	return 1;
}
