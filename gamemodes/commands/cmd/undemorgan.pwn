//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ undemorgan ]----------------------------------------------//
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

YCMD:undemorgan(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if(PlayerInfo[playerid][pAdmin] >= 1 || IsAScripter(playerid))
        {
            
        
			new giveplayerid;
			if( sscanf(params, "k<fix>", giveplayerid))
			{
				sendTipMessage(playerid, "U�yj /prisonoff [id/nick]");
				return 1;
			}

			if(IsPlayerConnected(giveplayerid))
			{
				if(giveplayerid != INVALID_PLAYER_ID)
				{
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					new typ[12];
					switch(PlayerInfo[giveplayerid][pJailed])
					{
						case 1:
							typ = "wi�zienia";
						case 2:
							typ = "DeMorgan";
						default:
							typ = "wi�zienia";
					}
					format(string, sizeof(string), "* Uwolni�e� %s z %s.", giveplayer, typ);
					SendClientMessage(playerid, COLOR_LIGHTRED, string);
					format(string, sizeof(string), "* Zosta�e� uwolniony z %s przez admina %s.", typ, sendername);
					SendClientMessage(giveplayerid, COLOR_LIGHTRED, string);
					format(string, sizeof(string), "* %s zosta� uwolniony z %s przez admina %s.", giveplayer, typ, sendername);
					SendPunishMessage(string, giveplayerid);
					UnJailDeMorgan(giveplayerid);
					poscig[giveplayerid] = 0;
				}
			}
			else
			{
				sendErrorMessage(playerid, "Ten gracz jest offline!");
				return 1;
			}
		}
		else
		{
			noAccessMessage(playerid);
		}
    }
    return 1;
}
