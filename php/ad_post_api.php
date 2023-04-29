<?php

$conditions  = [
  array(
    'package'  =>  'checkVal  <= parseInt(50)',
    'logic'    =>  'IF',
    'ikman'    => '150',
    'agent'    => '300'
  ),
  array(
    'package'  =>  'checkVal >= parseInt(50) && checkVal <= parseInt(150)',
    'logic'    =>  'ELSE IF',
    'ikman'    => '200',
    'agent'    => '400'
  ),
  array(
    'package'  =>  'checkVal > parseInt(150)',
    'logic'    =>  'ELSE IF',
    'ikman'    => '300',
    'agent'    => '600'
  )
];

$logic_builder = "";

foreach ($conditions as $key => $value) {
	if($value["logic"] == "IF"){
       $logic_builder .= "if(".$value["package"]."){";
       $logic_builder .=  "$('#ikman').text(".$value["ikman"].");";
	}

	if($value["logic"] == "ELSE IF"){
       $logic_builder .= "}else if(".$value["package"]."){";
        $logic_builder .=  "$('#ikman').text(".$value["ikman"].");";
	}


}

$logic_builder .= "}";

echo $logic_builder;