state("neutron")
{
	byte Objective : 0x00003EF8 , 0x4; 
	int Cutscene	: 0xF8434;
	//value is 0 if cutscene is playing, 256 if menu is entered, 1 otherwise
	//todo: find good path there
	//actually pause + cutscene value
	byte redNeutronsCollected : 0x1418, 0x8;
	//byte redNeutronsCollected : 0x4F6860;
	//byte redNeutronsCollected : 0x004F7DC0;
	//alternatives are 004F83C1 and 4F83CC, hope this works3
}
init{ 
	int split;
	vars.split=0;
}
update{
	//print("red neutrons: "+ current.redNeutronsCollected.ToString());
	//print("value is "+current.Cutscene.ToString());
	/*if(current.Cutscene ==1){
		print("no cutscene Playing");
	}
	else {
		if(current.Cutscene == 0){
			print("it is");
		}
		else{
			print("value is "+current.Cutscene.ToString());
		}
	}*/
}
start
{
	//debug: 
	/*if(vars.split < 7){
	vars.split = 7;
	print("setting splits number to 7 for debug reasons");}*/
	//print("objective is: " + current.Objective.ToString());
	/*if(current.Cutscene ==1){
		print("no cutscene Playing");
	}
	else {
		print("It is");
	}//*/

	if(current.Objective == 0 && current.Cutscene == 1 && old.Cutscene != 1){
		vars.split = 0;
		print("run started");
		return true;
	}
}


split
{
	if(current.redNeutronsCollected>old.redNeutronsCollected){
		return true;
	}
	if(current.redNeutronsCollected == 64 && current.Cutscene == 0){
		return true;
	}
}