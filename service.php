<?php
ini_set('display_errors', 0);
ini_set('display_startup_errors', 0);
$_input_post = filter_input_array(INPUT_POST);
if (isset($_input_post["task"])) {
    $task = $_input_post["task"];
    switch ($task) {
    	case 'getPersons':

	        require("classes/content.class.php");
	        $content = new Contents();
	        $persons_info = $content->getPersons();
	        return $persons_info;
		
        break;

        case 'insertVote':

	        require("classes/content.class.php");
	        $content = new Contents();
	        $id_person = $_input_post['id_person'];
	        $vote = $_input_post['vote'];
	        $persons_info = $content->insertVote($id_person, $vote);
		
        break;

        default:
        echo "No task!";
        break;
	}
}
	