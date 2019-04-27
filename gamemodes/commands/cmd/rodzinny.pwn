//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ rodzinny ]-----------------------------------------------//
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

CMD:family(playerid, params[]) return cmd_rodzinny(playerid, params);
CMD:f(playerid, params[]) return cmd_rodzinny(playerid, params);
CMD:rodzinny(playerid, params[])
{
	new string[256];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
	    if(PlayerInfo[playerid][pMuted] == 1)
		{
			sendTipMessageEx(playerid, TEAM_CYAN_COLOR, "Nie mo�esz pisa� poniewa� jeste� wyciszony");
			return 1;
		}
		if(GetPlayerAdminDutyStatus(playerid) == 1)
		{
			sendErrorMessage(playerid, "Dobry admin nie powinien robi� OOC w IC! Pisz poprzez /fo [tre��]");
			return 1;
		}
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(isnull(params))
		{
			sendTipMessage(playerid, "U�yj (/f)amily [tekst]");
			return 1;
		}
        if (GetPlayerOrg(playerid) != 0 || MozeMowicNaFamily(playerid) || PlayerInfo[playerid][pTajniak] >= 1)
		{
            new member = GetPlayerFraction(playerid);
		    if(member>0 && PlayerInfo[playerid][pTajniak] == 0)
		    {
                format(string, sizeof(string), "** %s %s: %s **", FracRang[member][PlayerInfo[playerid][pRank]],sendername, params);
    			SendFamilyMessage(member, TEAM_AZTECAS_COLOR, string);

                //Tajniacy
                if(member == 5) SendTajniakMessage(3, TEAM_AZTECAS_COLOR, string);
                else if(member == 6) SendTajniakMessage(4, TEAM_AZTECAS_COLOR, string);
                else if(member == 12) SendTajniakMessage(1, TEAM_AZTECAS_COLOR, string);
                else if(13 <= member <= 14) SendTajniakMessage(2, TEAM_AZTECAS_COLOR, string);
            }
            else if(PlayerInfo[playerid][pTajniak] == 1)
			{
                format(string, sizeof(string), "** %s %s: %s **", FracRang[FRAC_GROOVE][PlayerInfo[playerid][pRank]],sendername, params);
                SendFamilyMessage(FRAC_GROOVE, TEAM_AZTECAS_COLOR, string);
                SendTajniakMessage(1, TEAM_AZTECAS_COLOR, string);
			}
			else if(PlayerInfo[playerid][pTajniak] == 2)
			{
                format(string, sizeof(string), "** %s %s: %s **", FracRang[FRAC_BALLAS][PlayerInfo[playerid][pRank]],sendername, params);
                SendFamilyMessage(FRAC_BALLAS, TEAM_AZTECAS_COLOR, string);
                SendTajniakMessage(2, TEAM_AZTECAS_COLOR, string);
			}
			else if(PlayerInfo[playerid][pTajniak] == 3)
			{
                format(string, sizeof(string), "** %s %s: %s **", FracRang[FRAC_LCN][PlayerInfo[playerid][pRank]],sendername, params);
                SendFamilyMessage(FRAC_LCN, TEAM_AZTECAS_COLOR, string);
				SendTajniakMessage(3, TEAM_AZTECAS_COLOR, string);
			}
			else if(PlayerInfo[playerid][pTajniak] == 4)
			{
                format(string, sizeof(string), "** %s %s: %s **", FracRang[FRAC_YKZ][PlayerInfo[playerid][pRank]],sendername, params);
                SendFamilyMessage(FRAC_YKZ, TEAM_AZTECAS_COLOR, string);
				SendTajniakMessage(4, TEAM_AZTECAS_COLOR, string);
			}
			else if(PlayerInfo[playerid][pTajniak] == 5)
			{
                format(string, sizeof(string), "** %s %s: %s **", FracRang[FRAC_VAGOS][PlayerInfo[playerid][pRank]],sendername, params);
                SendFamilyMessage(FRAC_VAGOS, TEAM_AZTECAS_COLOR, string);
				SendTajniakMessage(5, TEAM_AZTECAS_COLOR, string);
			}
			else if(GetPlayerOrg(playerid) != 0)
		    {
                member = GetPlayerOrg(playerid);
                //Przypisane rangi
                if(strlen(FamRang[member][PlayerInfo[playerid][pRank]]) > 1) format(string, sizeof(string), "** %s %s: %s **", FamRang[member][PlayerInfo[playerid][pRank]],sendername, params);
                //Rangi podstawowe
                else format(string, sizeof(string), "** %s %s: %s **", FamRang[0][PlayerInfo[playerid][pRank]],sendername, params);
				SendNewFamilyMessage(member, TEAM_AZTECAS_COLOR, string);
			}
            format(string, sizeof(string), "%s m�wi przez radio: %s", sendername, params);
			ProxDetector(10.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
			format(string, sizeof(string), "%s m�wi przez radio: %s", sendername, params);
			SetPlayerChatBubble(playerid,string,COLOR_YELLOW,10.0,8000);
			printf("%s", string);
			return 1;
		}
        else if(GetPlayerFraction(playerid) == FRAC_GOV || GetPlayerFraction(playerid) == FRAC_BOR|| GetPlayerOrg(playerid) == 1) //DMV i BOR po�aczenie + S�d
        {
            new member = GetPlayerFraction(playerid);
            format(string, sizeof(string), "** %s %s: %s **", FracRang[member][PlayerInfo[playerid][pRank]],sendername, params);
    		SendFamilyMessage(FRAC_GOV, TEAM_AZTECAS_COLOR, string);
            SendFamilyMessage(FRAC_BOR, TEAM_AZTECAS_COLOR, string);
			SendNewFamilyMessage(FAMILY_SAD, TEAM_BLUE_COLOR, string);
            printf("%s", string);
			
			format(string, sizeof(string), "%s m�wi przez radio: %s", sendername, params);
			ProxDetector(10.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
			format(string, sizeof(string), "%s m�wi przez radio: %s", sendername, params);
			SetPlayerChatBubble(playerid,string,COLOR_YELLOW,10.0,8000);
        }
      /*  else if(GetPlayerFraction(playerid) == FRAC_BOR)
        {
            new member = GetPlayerFraction(playerid);
            format(string, sizeof(string), "** %s %s: %s **", FracRang[member][PlayerInfo[playerid][pRank]],sendername, params);
    		SendFamilyMessage(FRAC_GOV, TEAM_AZTECAS_COLOR, string);
            SendFamilyMessage(FRAC_BOR, TEAM_AZTECAS_COLOR, string);
            SendNewFamilyMessage(FAMILY_SAD, TEAM_BLUE_COLOR, string);
            printf("%s", string);
        }*/
		else
		{
			sendTipMessageEx(playerid, COLOR_GRAD2, "Nie jeste� we frakcji!");
			return 1;
		}
	}//not connected
	return 1;
}