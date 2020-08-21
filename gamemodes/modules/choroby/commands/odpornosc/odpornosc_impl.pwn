//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                 odpornosc                                                 //
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
// Autor: Sanda�
// Data utworzenia: 18.06.2020


//

//------------------<[ Implementacja: ]>-------------------
command_odpornosc_Impl(playerid)
{
    if(Odpornosc_PlayerBarToggle[playerid] == 0)
    {
        ShowPlayerProgressBar(playerid, PlayerImmunityBar[playerid]);
        Odpornosc_PlayerBarToggle[playerid] = 1;
    }
    else
    {
        HidePlayerProgressBar(playerid, PlayerImmunityBar[playerid]);
        Odpornosc_PlayerBarToggle[playerid] = 0;
    }
    return 1;
}

//end