state("neutron"){
	byte Objective : 0x00003EF8 , 0x4; 
	byte redNeutronsCollected : 0x1418, 0x8;
	int Cutscene	: 0xF8434;
	//value is 0 if cutscene is playing, 256 if menu is entered, 1 otherwise
}
state("neutronSW"){
	byte Objective : 0xF8194;
	byte redNeutronsCollected : 0x1418, 0x8;
	int Cutscene	: 0xF8434;
	//value is 0 if cutscene is playing, 256 if menu is entered, 1 otherwise
}
startup{
	// true if we split on mission change
	settings.Add("SplitMission", true, "split after mission value change?");
	
	// true if they want their any% runs ended
	settings.Add("endRunAnyP", true, "end the any% run for you?");
	
	// true if we split on red neutron collections
	settings.Add("SplitRed", false, "split after Red neutron collected?");

	// true if they want their allRed% runs ended
	settings.Add("endRunAllRed", false, "end the allRed% run for you?");
}
update{
	if(old.Objective!=current.Objective){
		print("current objective is "+current.Objective.ToString());
	}
	if(old.Cutscene!=current.Cutscene){
		print("current Cutscene is "+current.Cutscene.ToString());
	}
	if(old.redNeutronsCollected!=current.redNeutronsCollected){
		//print("current redNeutronsCollected is "+current.redNeutronsCollected.ToString());
	}
}
init{ 
	int counter;
	vars.counter=0;
}
start{
	if(current.Objective == 0 && current.Cutscene == 1 && old.Cutscene != 1){
		vars.counter = 0;
		print("run started");
		return true;
	}
}
split{
	if(settings["SplitMission"]){
		if(current.Objective == old.Objective+1){
			//print("split Mission");
			return true; 
		}
	}
	if(settings["SplitRed"]){
		if(current.redNeutronsCollected>old.redNeutronsCollected){
			print("split Red");
			return true;
		}
	}
	if(settings["endRunAllRed"]){
		//this is where the number of neutrons needs to be updated if we find new ones, currently we have 66
		if (current.redNeutronsCollected == 66 && current.Cutscene == 0){
			print("all Reds end");
			return true;
		}
	}
	if(settings["endRunAnyP"]){
		if(old.Objective==7 && current.Objective==0){
			//split after the school load	
			return true; 
		}
		
		if(vars.counter==0 && current.Objective==42) {
			print("arrived on yokian ship after wrongload I guess");
			vars.counter++;
			return true; 
		} else if(vars.counter==1 && old.Cutscene == 0 && current.Cutscene != 0) {
			print("first cutscene on yokian ship ended");
			vars.counter++;
		} else if(vars.counter==2 && current.Cutscene==0){
			print("final cutscene entered");
			vars.counter++;
			return true; 
		}
		
	}
}