    <?php 
    require_once("classes/database.class.php");

    class Contents {

        public function getPersons(){ 

            try{ 
                
                $db   = new database();
                $conn = $db->conn();

                $sql = "SELECT * FROM persons";
                $query = $conn->prepare($sql);
                $executed = $query->execute(); 
                $result = $query->fetchAll();

                $_complete_reslt = array();
                $i=0;
                foreach ($result as $rst) {
                    $_complete_reslt[$i]['id'] = $rst['id'];
                    $_complete_reslt[$i]['name'] = $rst['name'];
                    $_complete_reslt[$i]['image'] = $rst['image'];
                    $_complete_reslt[$i]['description'] = $rst['description'];
                    $total = $this->getTotalNumberOfVotes($rst['id']);
                    $_complete_reslt[$i]['total'] = $total;
                    $up = $this->getIndividualVotes($rst['id'], "up");
                    $down = $this->getIndividualVotes($rst['id'], "down");

                    $_complete_reslt[$i]['up_percent'] = $this->calculatePercentage($up, $total);
                    $_complete_reslt[$i]['down_percent'] = $this->calculatePercentage($down, $total);

                    $i++;
                }

                $rslt_encoded = json_encode($_complete_reslt);

                echo $rslt_encoded;

            } catch( PDOException $e ) {
                echo 'Caught exception: ', $e->getMessage(), "\n";
                return false;
            }
        }

        public function getTotalNumberOfVotes($id_person){ 

            try{ 
                
                $db   = new database();
                $conn = $db->conn();

                $sql = "SELECT count(*) FROM votes where id_person='".$id_person."'";
                $query = $conn->prepare($sql);
                $executed = $query->execute(); 
                $result = $query->fetch();

                return $result['count(*)'];

            } catch( PDOException $e ) {
                echo 'Caught exception: ', $e->getMessage(), "\n";
                return false;
            }
        }

        public function getIndividualVotes($id_person, $type){ 

            try{ 
                
                $db   = new database();
                $conn = $db->conn();

                $sql = "SELECT count(*) FROM votes where id_person='".$id_person."' and vote='".$type."'";
                $query = $conn->prepare($sql);
                $executed = $query->execute(); 
                $result = $query->fetch();

                return $result['count(*)'];

            } catch( PDOException $e ) {
                echo 'Caught exception: ', $e->getMessage(), "\n";
                return false;
            }
        }

        public function calculatePercentage($number_votes, $total){ 

            try{ 
                
                $check = (int)$number_votes*100;
                $value = (int)$check/(int)$total;

                if(is_nan($value)){
                    $value="";
                } else {
                    $value = number_format($value, 1);
                }

                return $value;

            } catch( PDOException $e ) {
                echo 'Caught exception: ', $e->getMessage(), "\n";
                return false;
            }
        }

        public function insertVote($id_person, $vote){
        
            $db   = new database();
            $conn = $db->conn();

            try {

                $queryInsert = "INSERT INTO votes (id_person, vote) VALUES ('".$id_person."','".$vote."')";
                $query = $conn->prepare($queryInsert);
                $check = $query->execute();
                
                $total = $this->getTotalNumberOfVotes($id_person);

                $upVotes = $this->getIndividualVotes($id_person, "up");
                $downVotes = $this->getIndividualVotes($id_person, "down");

                $up = $this->calculatePercentage($upVotes, $total);
                $down = $this->calculatePercentage($downVotes, $total);

                $_percentage = array("id_person"=>$id_person,"up"=>$up, "down"=>$down);
                        
                if($check=="true"){
                    $rslt_encoded = json_encode($_percentage);
                    echo $rslt_encoded;
                    //echo 1;
                } else {
                    echo 0;
                }
            
            } catch( PDOException $e ) {
                    echo 'Caught exception: ', $e->getMessage(), "\n";
                    return false;
                }
        }


    }