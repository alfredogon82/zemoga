document.addEventListener("DOMContentLoaded", function(){

	var xhr = new XMLHttpRequest();
	xhr.open('POST', 'service.php', true);
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhr.onload = function() {

	    obj = JSON.parse(this.responseText);
	    console.log(obj);

	    var i;
        var divCreator ='';
        
        for (i=0; i<obj.length; ++i) {

        	if (i%2===0){
				var direction = "character-left";
			} else {
				var direction = "character-right";
			}

        	divCreator+='<div class="character '+direction+'" style="background-image: url('+obj[i].image+');">';
			divCreator+='<div class="character-name-container">';
			var maxValue = Math.max(obj[i].up_percent,obj[i].down_percent);
			if(maxValue==obj[i].up_percent){
				divCreator+='<div class="thumb-container thumb-up">';
				divCreator+='<i class="fas fa-thumbs-up"></i>';
			} else {
				divCreator+='<div style="float:left;" class="thumb-container thumb-down">';
				divCreator+='<i class="fas fa-thumbs-down"></i>';
			}
			
			divCreator+='</div>';
			divCreator+='<div class="character-name">';
			divCreator+=obj[i].name;
			divCreator+='</div>';
			divCreator+='</div>';
			divCreator+='<div class="character-info">';
			divCreator+=obj[i].description;
			divCreator+='</div>';	
			divCreator+='<div class="button-container">';
			divCreator+='<div id="voting_'+obj[i].id+'"  class="voting-content">';
			divCreator+='<div id="up_'+obj[i].id+'" class="thumb-container thumb-up-vote voteUp">';
			divCreator+='<i class="fas fa-thumbs-up"></i>';
			divCreator+='</div>';
			divCreator+='<div id="down_'+obj[i].id+'" class="thumb-container thumb-down-vote voteDown">';
			divCreator+='<i class="fas fa-thumbs-down"></i>';
			divCreator+='</div>';
			divCreator+='</div>';
			divCreator+='<div id="button_'+obj[i].id+'" class="button">';
			divCreator+='Vote now';
			divCreator+='</div>';

			divCreator+='<div style="display:none;" id="again_'+obj[i].id+'" class="button_vote_again">';
			divCreator+='Vote again';
			divCreator+='</div>';

			divCreator+='<div class="text-info">';
			divCreator+='1 month ago<br>';
			divCreator+='In Entertainment';
			divCreator+='</div>';

			divCreator+='</div>';

			divCreator+='<div id="score_'+obj[i].id+'" class="score-container">';
			divCreator+='<div class="up-score" style="width:'+obj[i].up_percent+'%">';
			divCreator+='<div class="up-thumb">';
			divCreator+='<i class="fas fa-thumbs-up"></i><span>'+obj[i].up_percent+'%</span>';
			divCreator+='</div>';
			divCreator+='</div>';
			divCreator+='<div class="down-score" style="width:'+obj[i].down_percent+'%">';
			divCreator+='<div class="down-thumb">';
			divCreator+='<span>'+obj[i].down_percent+'%</span><i class="fas fa-thumbs-down"></i>';
			divCreator+='</div>';
			divCreator+='</div>';
			divCreator+='</div>';
			divCreator+='<div class="clear"></div>';
			divCreator+='</div>';

			

			

		};

		document.getElementById('personsCont').innerHTML = divCreator;

	}

	xhr.send('task=getPersons');

	document.addEventListener('click',function(e){
		if (e.target.matches('.voteUp')) {
			id_person = e.target.id;

			var realPerson = id_person.split("_");
			id_per = realPerson[1];

			var element = document.getElementById("down_"+id_per);
  			element.classList.remove("selected");

			var d = document.getElementById(id_person);
			d.className += " selected";

		}

		if (e.target.matches('.voteDown')) {
			id_person = e.target.id;
			
			var realPerson = id_person.split("_");
			id_per = realPerson[1];

			var element = document.getElementById("up_"+id_per);
  			element.classList.remove("selected");

			var d = document.getElementById(id_person);
			d.className += " selected";
		}
	}, false);

	document.addEventListener('click',function(e){
		if (e.target.matches('.button')) {
			id_button = e.target.id;
			//alert(id_button);
			var realVote = id_button.split("_");
			vote = realVote[1];

			var elementToCheckUp = document.getElementById("up_"+vote);

			if (elementToCheckUp.matches('.selected')) {
				sendVote(elementToCheckUp.id, "up");
			}

			var elementToCheckDown = document.getElementById("down_"+vote);

			if (elementToCheckDown.matches('.selected')) {
				sendVote(elementToCheckUp.id, "down");
			}

			alert("Thank you for voting!");
		}
	}, false);

	document.addEventListener('click',function(e){
		if (e.target.matches('.button_vote_again')) {
			id_button = e.target.id;
			var realValue = id_button.split("_");

			valueToShow = "voting_"+realValue[1];
			var elementToShowVoting = document.getElementById(valueToShow);
			elementToShowVoting.style.display = 'block';

			valueToShowAgain = "again_"+realValue[1];
			var elementToShowAgain = document.getElementById(valueToShowAgain);
			elementToShowAgain.style.display = 'none';

			buttonToShow = "button_"+realValue[1];
			var elementToShowButton = document.getElementById(buttonToShow);
			elementToShowButton.style.display = 'block';
		}
	}, false);

	function sendVote(id_person, vote){

		var realPerson = id_person.split("_");
		id_per = realPerson[1];

		var xhr = new XMLHttpRequest();
		xhr.open('POST', 'service.php', true);
		xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhr.onload = function() {
			//console.log(this.responseText);

			obj = JSON.parse(this.responseText);

			var voting_id = "voting_"+obj['id_person'];
	    	var myVoting = document.getElementById(voting_id);
			myVoting.style.display = 'none';

			var button_id = "button_"+obj['id_person'];
	    	var myButton = document.getElementById(button_id);
			myButton.style.display = 'none';

			var again_id = "again_"+obj['id_person'];
	    	var myButtonAgain = document.getElementById(again_id);
			myButtonAgain.style.display = 'block';

	    	var score_id = "score_"+obj['id_person'];
	    	var myScore = document.getElementById(score_id);
			myScore.innerHTML = '';

			divScore="";
	    	
	    	divScore+='<div class="up-score" style="width:'+obj['up']+'%">';
			divScore+='<div class="up-thumb">';
			divScore+='<i class="fas fa-thumbs-up"></i><span>'+obj['up']+'%</span>';
			divScore+='</div>';
			divScore+='</div>';
			divScore+='<div class="down-score" style="width:'+obj['down']+'%">';
			divScore+='<div class="down-thumb">';
			divScore+='<span>'+obj['down']+'%</span><i class="fas fa-thumbs-down"></i>';
			divScore+='</div>';
			divScore+='</div>';
			divScore+='</div>';
			divScore+='<div class="clear"></div>';

			myScore.innerHTML = divScore;
			
		}
		xhr.send('task=insertVote&id_person='+id_per+'&vote='+vote);
	}

});