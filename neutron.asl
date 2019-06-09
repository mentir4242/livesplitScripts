state("neutron")
{
	byte Objective : 0x00003EF8 , 0x4; 
	int Cutscene	: 0xF8434;
	//value is 0 if cutscene is playing, 256 if menu is entered, 1 otherwise
	//todo: find good path there
	//actually pause + cutscene value
}
state("neutronSW")
{
	byte Objective : 0xF8194;
	int Cutscene	: 0xF8434;
	//value is 0 if cutscene is playing, 256 if menu is entered, 1 otherwise
	//todo: find good path there
	//actually pause + cutscene value
}
init{ 
	int split;
	vars.split=0;
}
update{
	if(current.Objective != old.Objective){
		print(current.Objective.ToString()+" it is now");
	}
	
	//print("value is "+current.Cutscene.ToString());
	/*if(current.Cutscene ==1){
		print("no cutscene Playing");
	}
	else {
		if(current.Cutscene == 0 && current.Cutscene == 1)){
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

	if(current.Objective == 0 && current.Cutscene == 1){
		vars.split = 0;
		print("run started xVVV");
		return true;
	}
}


split
{
	if(current.Objective == 1 && vars.split == 0){
		vars.split++;
		print("objective 1 started");
		return true;
		//mission 1
	}
	if(current.Objective == 2 && vars.split == 1){
		vars.split++;
		print("objective 2 started");
		return true;
		//mission 2
	}
	if(current.Objective == 3 && vars.split == 2){
		vars.split++;
		print("objective 3 started");
		return true;
		//mission 3
	}
	if(current.Objective == 4 && vars.split == 3){
		vars.split++;
		print("objective 4 started");
		return true;
		//mission 4
	}
	if(current.Objective == 5 && vars.split == 4){
		vars.split++;
		print("objective 5 started");
		return true;
		//mission 5;;
	}
	if(current.Objective == 6 && vars.split == 5){
		vars.split++;
		print("objective 6 started");
		return true;
		//mission 6
	}
	if(current.Objective == 7 && vars.split == 6){
		vars.split++;
		print("objective 7 started");
		return true;
		//mission 7
	}
	if(current.Objective == 0 && vars.split == 7){
		vars.split++;
		print("objective 0 kinda started");
		return true;
		//mission 0 again
	}
	if(current.Objective == 42 && vars.split == 8){
		vars.split++;
		print("objective 42 (kinda) started");
		return true;
		//wrong load gone right
	}
	if(vars.split == 9 ){
		if(current.Cutscene == 0)
		{vars.split++;
		print("first one hit");}
		//first cuttscene on yokian ship hit
		//not splitting because we are not done with this yet
	}
	if(vars.split == 10){
		if(current.Cutscene != 0)
		{vars.split++;
		print("first one ended");
		return true;}
		//first cuttscene on yokian ship ended
		//splitting because why not
	}
	if(vars.split == 11){
		if(current.Cutscene == 0){
		vars.split++;
		print("second one hit, lettsssss gooooooooooo");
		return true;
		//final cutscene on yokian ship hit, game over
		}
	}
}