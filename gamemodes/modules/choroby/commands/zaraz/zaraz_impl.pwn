//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                   zaraz                                                   //
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
// Data utworzenia: 07.02.2020


//

//------------------<[ Implementacja: ]>-------------------
command_zaraz_Impl(playerid, giveplayerid, disease[32])
{
    if (PlayerInfo[playerid][pAdmin] < 100)
    {
        noAccessMessage(playerid);
        return 1;
    }

    if(strcmp(disease, "wylecz", true) == 0) 
    {
        CureFromAllDiseases(giveplayerid);
        Log(adminLog, INFO, "Admin %s wyleczy� %s z wszystkich chor�b", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid));
        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, "   Admin wyleczy� Ci� z chor�b.");
        SendClientMessage(playerid, COLOR_LIGHTBLUE, sprintf("   Wyleczy�e� gracza %s ze wszystkich chor�b.", GetNick(giveplayerid)));
    }

    new eDiseases:diseaseID = GetDiseaseID(disease);
    if(diseaseID == eDiseases:NONE) 
    {
        ShowDiseaseList(playerid);
        SendClientMessage(playerid, COLOR_WHITE, "Lub wpisz \"/zaraz [id] wylecz\", aby wyleczy�");
        return 1;
    }

    InfectPlayer(giveplayerid, diseaseID);
    Log(adminLog, INFO, "Admin %s zarazi� %s chorob� %s", GetPlayerLogName(playerid), GetPlayerLogName(giveplayerid), disease);
    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, "   Zarazi�e� si� chorob�");
    SendClientMessage(playerid, COLOR_LIGHTBLUE, sprintf("   Zarazi�e� gracza %s chorob� %s.", GetNick(giveplayerid), disease));
    return 1;
}

//end