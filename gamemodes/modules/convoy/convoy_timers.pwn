//-----------------------------------------------<< Timers >>------------------------------------------------//
//                                                   convoy                                                  //
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
// Data utworzenia: 20.10.2019
//Opis:
/*
	System konwoj�w.
*/

//

//-----------------<[ Timery: ]>-------------------
task ConvoyTimer[1000]()
{
	if(convoyCar != -1)
	{
		new Float:health;
		GetVehicleHealth(convoyCar, Float:health);

		//utrata hp przez pojazd konwojowy
		if(health < convoyCarHP)
		{
			convoyCarHPAcc += convoyCarHP - health;
			convoyCarHP = health;

			if(convoyCarHPAcc >= 1000)
			{
				convoyCarHPAcc = 0;

				DropBoxFromCar(convoyCar);
			}
		}

		//zniszczenie pojazdu konwojowego
		if(health < 300) {
			StopConvoy();
		}
	}
}

//end