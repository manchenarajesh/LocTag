function checkdate(input){
	
	var validformat=/^\d{2}\/\d{2}\/\d{4}$/ //Basic check for format validity
	var returnval=false

	
	if (!validformat.test(input.value)){
		returnval=false;
		
	}
	else{ //Detailed check for valid date ranges
		var monthfield=input.value.split("/")[0]
		var dayfield=input.value.split("/")[1]
		var yearfield=input.value.split("/")[2]
		var dayobj = new Date(yearfield, monthfield-1, dayfield)
		if ((dayobj.getMonth()+1!=monthfield)||(dayobj.getDate()!=dayfield)||(dayobj.getFullYear()!=yearfield)){
			returnval=false
	}

		else
			returnval=true
	}

	if (returnval==false){
		input.select()
		return returnval
	}

	

		//check if date is in the past
		var vDate = Date.parse(input.value);
		var today = new Date().getTime();

		if(vDate < today){
			returnval=false
		}	
		else {
			returnval=true
		}



		if (returnval==false) input.select()

		return returnval

}