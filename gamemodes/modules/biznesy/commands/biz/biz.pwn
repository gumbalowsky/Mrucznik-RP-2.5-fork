//------------------------------------------<< Generated source >>-------------------------------------------//
//                                                    biz                                                    //
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
// Kod wygenerowany automatycznie narz�dziem Mrucznik CTL

// ================= UWAGA! =================
//
// WSZELKIE ZMIANY WPROWADZONE DO TEGO PLIKU
// ZOSTAN� NADPISANE PO WYWO�ANIU KOMENDY
// > mrucznikctl build
//
// ================= UWAGA! =================


//-------<[ include ]>-------
#include "biz_impl.pwn"

//-------<[ initialize ]>-------
command_biz()
{
    new command = Command_GetID("biz");

    //aliases
    Command_AddAlt(command, "bizradio");
    Command_AddAlt(command, "radiobiz");
    

    //permissions
    Group_SetGlobalCommand(command, true);
    

    //prefix
    
}

//-------<[ command ]>-------
YCMD:biz(playerid, params[], help)
{
    if (help)
    {
        sendTipMessage(playerid, "Radio biznesowe.");
        return 1;
    }
    //fetching params
    new message[124];
    if(sscanf(params, "s[124]", message))
    {
<<<<<<< HEAD:gamemodes/modules/biznesy/commands/biz/biz.pwn
        sendTipMessage(playerid, "U�yj /biz [wiadomo��] ");
=======
        sendTipMessage(playerid, "U�yj /grafiti [stworz, edytuj, usun, sprawdz, lista] ");
>>>>>>> 5ac7cfa8... Dodanie /graffiti lista:gamemodes/modules/graffiti/commands/grafiti/grafiti.pwn
        return 1;
    }
    
    //command body
    return command_biz_Impl(playerid, message);
}