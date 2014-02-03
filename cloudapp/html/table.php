<?php

	error_reporting(E_ALL);
	
    include 'ChromePhp.php';
    ChromePhp::log('hello world');
	ChromePhp::log($_SERVER);
	

	Print "Hello, World!";
	
    //connect to mysql database
    $con = mysql_connect("127.0.0.1","root","1234");
    if (!$con)
    {
        die('Can not connect to mysql server'. mysql_error());
    }
    if(!mysql_select_db('test',$con))
    {
        die('Unable to use database'. mysql_error());
    }

    $tableResult = mysql_query('SHOW TABLES',$con) or die('Can not show tables');
    
    while($tableName = mysql_fetch_row($tableResult))
    {
        $table = $tableName[0];
        echo '<h2>',$table,'</h2>';
        $columnResult = mysql_query('SHOW COLUMNS FROM',$table) or die('Cant not show columns from'.$table);
        
        if(mysql_num_rows($columnResult))
        {
            echo '<table cellpadding="0" cellspacing="0" class="db-table">';
            echo '<tr><th>Field</th><th>Type</th><th>Null</th><th>Key</th><th>Default<th>Extra</th></tr>';      
        
        while($row = mysql_fetch_row($columnResult))
        {
            echo '<tr>';
            foreach($row as $key=>$value)
            {
                echo '<td>',$value,'</td>';
            }
            echo '<tr>';
        }
            echo '</table><br />';
        }
    }
    
    
    

?>