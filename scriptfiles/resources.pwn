//resoursces.pwn

LoadDLSkins()
{
/*
SKIN_TYPE_DEFAULT	====> Domy�lnie 0, ustawia si� na skiny zwyk�e. 
SKIN_TYPE_PREMIUM	====> Domy�lnie 1, ustawia si� na skiny przeznaczone pod kupno premium
SKIN_TYPE_EVENT		====> Domy�lnie 2, ustawia si� na skiny przeznaczone pod eventy
SKIN_TYPE_ADMIN		====> Domy�lnie 3, s� to skiny tylko mo�liwe do wyboru dla @
SKIN_TYPE_FRACTION	====> Domy�lnie 4, s� to skiny wy��cznie do systemu frakcyjnego

AddNewSkin(type, newID, sex, color, cost) -  w przypadku darmowego skina, pozostawi� warto�� cost na 0
*/

	//SKINY PRZEZNACZONE POD EVENTY 20.000-20.099
	
	
	//SKINY PRZEZNACZONE DLA FRAKCJI 20.101-20.300
	AddNewSkin(SKIN_TYPE_FRACTION, 20101, SKIN_MEN, SKIN_WHITE, 0);// [FACET[LSMC]] [�REDNI] [By: https://vk.com/slivprivata/skins] [Added: 2.6.11]
	AddNewSkin(SKIN_TYPE_FRACTION, 20102, SKIN_WOMEN, SKIN_WHITE, 0);
	AddNewSkin(SKIN_TYPE_FRACTION, 20103, SKIN_MEN, SKIN_BLACK, 0); 
	AddNewSkin(SKIN_TYPE_FRACTION, 20104, SKIN_MEN, SKIN_WHITE, 0); 
	AddNewSkin(SKIN_TYPE_FRACTION, 20105, SKIN_MEN, SKIN_WHITE, 0); 
	AddNewSkin(SKIN_TYPE_FRACTION, 20106, SKIN_MEN, SKIN_WHITE, 0); 
	AddNewSkin(SKIN_TYPE_FRACTION, 20107, SKIN_MEN, SKIN_WHITE, 0);
	AddNewSkin(SKIN_TYPE_FRACTION, 20108, SKIN_WOMEN, SKIN_WHITE, 0); 

	//SKINY PRZEZNACZONE POD UNIKATY 20.301-20.400
	AddNewSkin(SKIN_TYPE_PREMIUM, 20301, SKIN_MEN, SKIN_BLACK, 0);//[By: Mrucznik-rp -> User mrN] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_PREMIUM, 20302, SKIN_MEN, SKIN_WHITE, 0);// [FACET[STALIN]] [STARY] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_PREMIUM, 20303, SKIN_MEN, SKIN_WHITE, 0);// [FACET] [�REDNI] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_PREMIUM, 20304, SKIN_WOMEN, SKIN_WHITE, 0);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By: https://vk.com/slivprivata/skins] [Added: 2.6.11] 
	AddNewSkin(SKIN_TYPE_PREMIUM, 20305, SKIN_MEN, SKIN_BLACK, 0);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By: https://vk.com/slivprivata/skins] [Added: 2.6.11]
	AddNewSkin(SKIN_TYPE_PREMIUM, 20306, SKIN_MEN, SKIN_WHITE, 0);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By: https://vk.com/slivprivata/skins] [Added: 2.6.11]
	AddNewSkin(SKIN_TYPE_PREMIUM, 20307, SKIN_MEN, SKIN_BLACK, 0);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By: https://vk.com/slivprivata/skins] [Added: 2.6.11]
	AddNewSkin(SKIN_TYPE_PREMIUM, 20308, SKIN_MEN, SKIN_BLACK, 0);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By: https://vk.com/slivprivata/skins] [Added: 2.6.11]
	AddNewSkin(SKIN_TYPE_PREMIUM, 20309, SKIN_WOMEN, SKIN_BLACK, 0);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By: https://vk.com/slivprivata/skins] [Added: 2.6.11]
	AddNewSkin(SKIN_TYPE_PREMIUM, 20310, SKIN_MEN, SKIN_BLACK, 0);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By: https://vk.com/slivprivata/skins] [Added: 2.6.11]
	AddNewSkin(SKIN_TYPE_PREMIUM, 20311, SKIN_MEN, SKIN_WHITE, 0);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By: https://vk.com/slivprivata/skins] [Added: 2.6.11]
	AddNewSkin(SKIN_TYPE_PREMIUM, 20312, SKIN_MEN, SKIN_WHITE, 0);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By: https://vk.com/slivprivata/skins] [Added: 2.6.11]
	AddNewSkin(SKIN_TYPE_PREMIUM, 20313, SKIN_WOMEN, SKIN_WHITE, 0);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By: https://vk.com/slivprivata/skins] [Added: 2.6.11]
	AddNewSkin(SKIN_TYPE_PREMIUM, 20314, SKIN_MEN, SKIN_WHITE, 0);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By: https://vk.com/slivprivata/skins] [Added: 2.6.11]
	AddNewSkin(SKIN_TYPE_PREMIUM, 20315, SKIN_MEN, SKIN_WHITE, 0);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.11]


	//ZWYK�E SKINY 20.401 - BRAK
	AddNewSkin(SKIN_TYPE_DEFAULT, 20401, SKIN_MEN, SKIN_WHITE, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20402, SKIN_WOMEN, SKIN_WHITE, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20403, SKIN_MEN, SKIN_BLACK, 7500);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20404, SKIN_MEN, SKIN_WHITE, 10000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20405, SKIN_WOMEN, SKIN_WHITE, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20406, SKIN_WOMEN, SKIN_BLACK, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20407, SKIN_MEN, SKIN_BLACK, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20408, SKIN_MEN, SKIN_WHITE, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20409, SKIN_MEN, SKIN_WHITE, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20410, SKIN_MEN, SKIN_WHITE, 12500);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20411, SKIN_MEN, SKIN_WHITE, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20412, SKIN_MEN, SKIN_YELLOW, 12500);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20413, SKIN_WOMEN, SKIN_WHITE, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20414, SKIN_WOMEN, SKIN_WHITE, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20415, SKIN_WOMEN, SKIN_WHITE, 20000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20416, SKIN_MEN, SKIN_WHITE, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20417, SKIN_MEN, SKIN_WHITE, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20418, SKIN_WOMEN, SKIN_WHITE, 20000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20419, SKIN_MEN, SKIN_ANOTHER, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20420, SKIN_MEN, SKIN_BLACK, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20421, SKIN_WOMEN, SKIN_WHITE, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20422, SKIN_MEN, SKIN_WHITE, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20423, SKIN_MEN, SKIN_WHITE, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20424, SKIN_MEN, SKIN_WHITE, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20425, SKIN_MEN, SKIN_WHITE, 20000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20426, SKIN_WOMEN, SKIN_WHITE, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20427, SKIN_WOMEN, SKIN_WHITE, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20428, SKIN_WOMEN, SKIN_WHITE, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20429, SKIN_MEN, SKIN_WHITE, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20430, SKIN_MEN, SKIN_ANOTHER, 15000);// [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20431, SKIN_ANOTHER, SKIN_ANOTHER, 15000); // [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20432, SKIN_ANOTHER, SKIN_ANOTHER, 15000); // [KOBIETA/FACET] [M�ODA/�REDNIA/STARA] [By:____] [Added: 2.6.1]
	AddNewSkin(SKIN_TYPE_DEFAULT, 20433, SKIN_MEN, SKIN_WHITE, 17500); 
	AddNewSkin(SKIN_TYPE_DEFAULT, 20434, SKIN_MEN, SKIN_WHITE, 15000); 
	AddNewSkin(SKIN_TYPE_DEFAULT, 20435, SKIN_WOMEN, SKIN_WHITE, 15000); 
	AddNewSkin(SKIN_TYPE_DEFAULT, 20436, SKIN_WOMEN, SKIN_WHITE, 20000); 
	AddNewSkin(SKIN_TYPE_DEFAULT, 20437, SKIN_WOMEN, SKIN_YELLOW, 17500); 
	AddNewSkin(SKIN_TYPE_DEFAULT, 20438, SKIN_WOMEN, SKIN_WHITE, 10000); 
	AddNewSkin(SKIN_TYPE_DEFAULT, 20439, SKIN_WOMEN, SKIN_YELLOW, 10000); 
	AddNewSkin(SKIN_TYPE_DEFAULT, 20440, SKIN_WOMEN, SKIN_WHITE, 15000); 
	AddNewSkin(SKIN_TYPE_DEFAULT, 20441, SKIN_WOMEN, SKIN_WHITE, 15000); 
	AddNewSkin(SKIN_TYPE_DEFAULT, 20442, SKIN_WOMEN, SKIN_WHITE, 15000); 
	AddNewSkin(SKIN_TYPE_DEFAULT, 20443, SKIN_WOMEN, SKIN_WHITE, 15500);
	AddNewSkin(SKIN_TYPE_DEFAULT, 20444, SKIN_WOMEN, SKIN_WHITE, 10500);
	AddNewSkin(SKIN_TYPE_DEFAULT, 20445, SKIN_WOMEN, SKIN_WHITE, 17500);
	AddNewSkin(SKIN_TYPE_DEFAULT, 20446, SKIN_WOMEN, SKIN_BLACK, 17500);
	AddNewSkin(SKIN_TYPE_DEFAULT, 20447, SKIN_WOMEN, SKIN_BLACK, 17500);
	AddNewSkin(SKIN_TYPE_DEFAULT, 20448, SKIN_MEN, SKIN_WHITE, 15500); 
	AddNewSkin(SKIN_TYPE_DEFAULT, 20449, SKIN_MEN, SKIN_WHITE, 55000); 
	AddNewSkin(SKIN_TYPE_DEFAULT, 20450, SKIN_WOMEN, SKIN_BLACK, 15500);
	AddNewSkin(SKIN_TYPE_DEFAULT, 20451, SKIN_WOMEN, SKIN_WHITE, 15500);
	AddNewSkin(SKIN_TYPE_DEFAULT, 20452, SKIN_WOMEN, SKIN_BLACK, 25000);
	AddNewSkin(SKIN_TYPE_DEFAULT, 20453, SKIN_WOMEN, SKIN_BLACK, 12000);
	AddNewSkin(SKIN_TYPE_DEFAULT, 20454, SKIN_WOMEN, SKIN_BLACK, 12000);
	AddNewSkin(SKIN_TYPE_DEFAULT, 20455, SKIN_MEN, SKIN_WHITE, 12000);
	AddNewSkin(SKIN_TYPE_DEFAULT, 20456, SKIN_WOMEN, SKIN_BLACK, 12000);
	AddNewSkin(SKIN_TYPE_DEFAULT, 20457, SKIN_WOMEN, SKIN_BLACK, 12000);
	AddNewSkin(SKIN_TYPE_DEFAULT, 20458, SKIN_MEN, SKIN_WHITE, 12000);
	return 0; 
}