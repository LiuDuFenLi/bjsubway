<?php
header( "Content-type: text/html; charset=utf-8" );

//接收请求
$request = array('dist','line','zhans');

$action = $_GET['act'];
if(!in_array($action, $request)){
	$ret = array('err'=>10002,'err_msg'=>'无效的请求！');
	echo json_encode($ret);
	exit;
}


//连接数据库

$conn = mysql_connect(SAE_MYSQL_HOST_S.':'.SAE_MYSQL_PORT,SAE_MYSQL_USER,SAE_MYSQL_PASS);
if (!$conn) {
        echo "Unable to connect to DB: " . mysql_error();
        exit;
    }

mysql_select_db(SAE_MYSQL_DB);
mysql_query('set names utf8');;

//返回线路
if($action == 'line'){

	$line = array();
	$sql = "SELECT line_id,line_name FROM all_lines";
	$res = mysql_query($sql);
	while ($row = mysql_fetch_assoc($res)) {
		$line[$row['line_id']] =  $row['line_name'];
	}
	//print_r($zhans);
	echo json_encode($line);
	exit;
}

//返回站名
if($action == 'zhans'){

	$zhans = array();
	$sql = "SELECT zhan_name,line_id FROM zhans";
	$res = mysql_query($sql);
	while ($row = mysql_fetch_assoc($res)) {
		$zhans[$row['line_id']][] =  $row['zhan_name'];
	}
	//print_r($zhans);
	echo json_encode($zhans);
	exit;
}
//返回站站的信息
elseif($action == 'dist'){

	//根据苹果园这个站点的名称，找到是一号线
	$from = empty($_GET['from']) ? '' : $_GET['from'];
	$to = empty($_GET['to']) ? '' : $_GET['to'];
	
	if($from == $to){
		$ret = array('err'=>10003,'err_msg'=>'站点不能相同！');
		echo json_encode($ret);
		exit;
	}

	$filename = "./huanch.txt";
	$handle = fopen($filename,'r');
	$huanch_str = fread($handle,filesize($filename));
	fclose($handle);
	
	$all_huanch = unserialize($huanch_str);
	
	$zhans = array();
	$sql = "SELECT zhan_name FROM zhans";
	$res = mysql_query($sql);
	while ($row = mysql_fetch_assoc($res)) {
		$zhans[] =  $row['zhan_name'];
	}
	if(!in_array($from, $zhans) || !in_array($to, $zhans)){
		
		$ret = array('err'=>10001,'err_msg'=>'没有这些站点！');
		echo json_encode($ret);
		exit;
	}
	
	//如果这两个站点都不是换乘站，而且之间没有换乘站，肯定同一线路上，那么就要这样
	if(!in_array($from, $all_huanch) && !in_array($to, $all_huanch)){
		$flag_one = 0;
		$sql = "SELECT count(*) FROM zhans AS z INNER JOIN zhans AS z2 ON z.line_id = z2.line_id"
			." WHERE z.zhan_name = '$from' AND z2.zhan_name = '$to'";
		$res = mysql_query($sql);
		while ($row = mysql_fetch_row($res)) {
			$flag_one =  $row['0'];
			
		}
		//var_dump($flag_one);
		//说明两个站点在一条线路上
		if($flag_one > 0 ){
			$sql = "SELECT line_id FROM zhans WHERE zhan_name = '$from' ";
			$res = mysql_query($sql);
			while ($row = mysql_fetch_assoc($res)) {
				$one_line_id = $row['line_id']; 
				
			}
			
			$tb_name = 'line_'.$one_line_id;
			$sids = array();
			$sql = "select sid from $tb_name where zhan_name = '".$from."' or  zhan_name = '".$to."'";
			$res = mysql_query($sql);
			while ($row = mysql_fetch_assoc($res)) {
				$sids[] = $row['sid']; 
				
			}
	
			if($sids['0'] > $sids['1']){
				$tmp = $sids['0'];
				$sids['0'] = $sids['1'];
				$sids['1'] = $tmp;
			}
			
			//环路，
			if($line_id == 10 || $line_id == 2){
	
				$sql = "select count(*) from $tb_name where ( sid > $sids[0] and sid < $sids[1] ) and is_transfer = 1";
				$res = mysql_query($sql);
				while ($row = mysql_fetch_row($res)) {
					$fh1 = $row['0'];
				}
				
	
				$sql = "select count(*) from $tb_name where ( sid < $sids[0] or sid > $sids[1] ) and is_transfer = 1";
				$res = mysql_query($sql);
				while ($row = mysql_fetch_row($res)) {
					$fh2 = $row['0'];
				}
				
				//一条线路上的两个站点之间木有换乘站
				if($fh1 == 0 || $fh2 == 0 ){
				
					$dist = onOneLine($from,$to);
					$jine = jisuan($dist);
					$jine2 = jisuan2($dist);
					$ret = array('dist'=>$dist,'jine'=>$jine,'jine2'=>$jine2,'err'=>0,'err_msg'=>'查询成功！');
					echo json_encode($ret);
					exit;
					
				}
	
			}else{
	
				$sql = "select count(*) from $tb_name where ( sid > $sids[0] and sid < $sids[1] ) and is_transfer = 1";
				$res = mysql_query($sql);
				while ($row = mysql_fetch_row($res)) {
					$fh = $row['0'];
				}
				
				//一条线路上的两个站点之间木有换乘站
				if($fh == 0){
				
					$dist = onOneLine($from,$to);
					$jine = jisuan($dist);
					$jine2 = jisuan2($dist);
					$ret = array('dist'=>$dist,'jine'=>$jine,'jine2'=>$jine2,'err'=>0,'err_msg'=>'查询成功！');
					echo json_encode($ret);
					exit;
					
				}
			}

		}
	}
	
	
	if(!in_array($from, $all_huanch)){
		$from_zhans = nearbyHuanch($from);
	
	}else{
		$from_zhans = array($from);
	}
	
	if(!in_array($to, $all_huanch)){
		$to_zhans = nearbyHuanch($to);
	
	}else{
		$to_zhans = array($to);
	}
	
	$distance = array();
	foreach($from_zhans as $fval){
		//
		$fk = array_search($fval, $all_huanch);
		$step_1 = onOneLine($from,$fval);
		foreach($to_zhans as $tval){
			$tk = array_search($tval, $all_huanch);
			
			//同样的换乘站，之间的距离是0
			if($fk == $tk){
				$step_2 = 0;
			}else{
			
				$sql = "SELECT distance FROM transfer where from_id = $fk and to_id = $tk limit 1";
				$res = mysql_query($sql);
				while ($row = mysql_fetch_assoc($res)) {
					$step_2 = $row['distance']/10.0;
					
				}
			}
	
			$step_3 = onOneLine($tval,$to);
			$distance[] = $step_1 + $step_2 + $step_3;
	
		}
		
	}
	
	sort($distance, SORT_NUMERIC);
	//echo $distance['0'];echo '<br>';
	
	$jine = jisuan($distance['0']);
	$jine2 = jisuan2($distance['0']);
	
	$ret = array('dist'=>$distance['0'],'jine'=>$jine,'jine2'=>$jine2,'err'=>0,'err_msg'=>'查询成功！');
	echo json_encode($ret);
	exit;

}


//方案一：详情：起步3公里内每人次2元，3-6公里每人次3元，6-18公里每6公里加1元，18-42公里每12公里加1元，42公里以上每18公里加1元，票价不封顶。（北京市发改委）
function jisuan($dist){
	if($dist <= 3){
		$jine = 2;
	}elseif($dist > 3 && $dist <=6){
		$jine = 3;
	}elseif($dist > 6 && $dist <=18){
		$jine = 3 + ceil(($dist -6)/6) ;
	}elseif($dist >18 && $dist <=42){
		$jine = 3 + (18-6) / 6 +  ceil(($dist -18) / 12); 
	}elseif($dist >42){
		$jine = 3 + (18-6) / 6 + (42-18)/12 + ceil(($dist -42) / 18);
	}
	return $jine;
}

//方案二：详情：起步6公里内每人次3元，6-12公里每人次4元，12-32公里每10公里加1元，32公里以上每20公里加1元，票价不封顶。（北京市发改委）
function jisuan2($dist){
	if($dist <= 6){
		$jine = 3;
	}elseif($dist > 6 && $dist <=12){
		$jine = 4;
	}elseif($dist >12 && $dist <=32){
		$jine = 4 + ceil(($dist -12) / 10); 
	}elseif($dist >32){
		$jine = 4 + (32-12) / 10 + ceil(($dist -32) / 20);
	}
	return $jine;
}


	
function nearbyHuanch($zhan_name){
	//如果不是换乘站

	//这个站属于那些线路
	$sql = "SELECT line_id FROM zhans WHERE zhan_name = '".$zhan_name."'";
	$res = mysql_query($sql);
	while ($row = mysql_fetch_assoc($res)) {
		$from_lines[] =  $row['line_id'];
	}
	$line_id = $from_lines['0'];
	$line = 'line_'.$line_id;

	$sql = "select sid from $line where zhan_name = '$zhan_name'";
	$res = mysql_query($sql);
	while ($row = mysql_fetch_assoc($res)) {
		$sid =  $row['sid'];
	}
	$frontzhan = array();
	$behindzhan = array();
	//是环线时
	if($line_id == 10 || $line_id == 2){
		
		//前面的
		$sql = "select zhan_name from $line where sid < $sid  and is_transfer = 1 order by sid desc limit 1";
		$res = mysql_query($sql);
		while ($row = mysql_fetch_assoc($res)) {
			$frontzhan[] =  $row['zhan_name'];
		}

		if(empty($frontzhan)){
		
			$sql = "select max(sid) from $line";
			$res = mysql_query($sql);
			while ($row = mysql_fetch_row($res)) {
				$sid2 =  $row['0'];
			}

			$sql = "select zhan_name from $line where sid < $sid2  and is_transfer = 1 order by sid desc limit 1";
			$res = mysql_query($sql);
			while ($row = mysql_fetch_assoc($res)) {
				$frontzhan[] =  $row['zhan_name'];
			}
		}

		//后面的
		$sql = "select zhan_name from $line where sid > $sid  and is_transfer = 1 limit 1";
		$res = mysql_query($sql);
		while ($row = mysql_fetch_assoc($res)) {
			$behindzhan[] =  $row['zhan_name'];
		}

		if(empty($behindzhan)){
		
			$sql = "select min(sid) from $line";
			$res = mysql_query($sql);
			while ($row = mysql_fetch_row($res)) {
				$sid2 =  $row['0'];
			}

			$sql = "select zhan_name from $line where sid > $sid2  and is_transfer = 1 limit 1";
			$res = mysql_query($sql);
			while ($row = mysql_fetch_assoc($res)) {
				$behindzhan[] =  $row['zhan_name'];
			}
		}

	}else{

		//不是环线时
		$sql = "select zhan_name from $line where sid < $sid  and is_transfer = 1 order by sid desc limit 1";
		$res = mysql_query($sql);
		while ($row = mysql_fetch_assoc($res)) {
			$frontzhan[] =  $row['zhan_name'];
		}

		$sql = "select zhan_name from $line where sid > $sid  and is_transfer = 1 limit 1";
		$res = mysql_query($sql);
		while ($row = mysql_fetch_assoc($res)) {
			$behindzhan[] =  $row['zhan_name'];
		}

	}

	return  array_merge($frontzhan, $behindzhan);
	
}


//输入一条线路的两个站点，返回array('2',5.5)这个线路上走的距离
function onOneLine($from , $to){

	if($from == $to){
		return 0;
	}

	$sql = "SELECT line_id FROM zhans WHERE zhan_name = '".$from."'";
	$res = mysql_query($sql);
	while ($row = mysql_fetch_assoc($res)) {
		$from_lines[] =  $row['line_id'];
	}
	
	$sql = "SELECT line_id FROM zhans WHERE zhan_name = '".$to."'";
	$res = mysql_query($sql);
	while ($row = mysql_fetch_assoc($res)) {
		$to_lines[] = $row['line_id'];
	}
	$on_one_lines = array_intersect($from_lines, $to_lines);

	
	foreach( $on_one_lines as $one_line){
		
		$tb_name = 'line_'.$one_line;
		
		//（环线）
		
		$sql = "SELECT is_huan FROM all_lines WHERE line_id = $one_line";
		$res = mysql_query($sql);
		while ($row = mysql_fetch_row($res)) {
			$huan_flag = $row['0'];
		}
		
		//环线的总里程
		$sql = "SELECT SUM(aheadlen) FROM $tb_name";
		$res = mysql_query($sql);
		while ($row = mysql_fetch_row($res)) {
			$all_distance = $row['0'];
		}
		//echo $all_distance;
		
		
		
		$sql = "SELECT * FROM $tb_name WHERE zhan_name='".$from."' OR zhan_name='".$to."'";
		$res = mysql_query($sql);
		while ($row = mysql_fetch_assoc($res)) {
			if($row['zhan_name'] == $from){
				$from_zhan = $row;
			}elseif($row['zhan_name'] == $to){
				$to_zhan = $row;
			}
			
		}
	//print_r($from_zhan);print_r($to_zhan);
	$ji_zhans = $from_zhan['sid'] - $to_zhan['sid'] ;
	$distance = 0;
	if($ji_zhans < 0){
		$end_pos = $to_zhan['sid'] - 1 ;
		$sql2 = "SELECT SUM(aheadlen) FROM $tb_name WHERE sid BETWEEN ".$from_zhan['sid']." AND $end_pos";
		$res2 = mysql_query($sql2);
		while ($row = mysql_fetch_row($res2)) {
			$distance = $row['0'];
		}
		//echo '---',$all_distance,'----',$all_distance/2,'----';
		//环线处理路程，当计算出的路程大于总里程的一半；取总里程 减去 这个路程
		if( $huan_flag <> 0  && $distance > (int)($all_distance/2))
		{
			$distance = $all_distance - $distance;
		}
		
		
		
	}elseif($ji_zhans > 0 ){
		$start_pos = $to_zhan['sid'] + 1;
		$sql2 = "SELECT SUM(backlen) FROM $tb_name WHERE sid BETWEEN ".$start_pos." AND ".$from_zhan['sid'];
		$res2 = mysql_query($sql2);
		while ($row = mysql_fetch_row($res2)) {
			$distance = $row['0'];
		}
		//echo '---',$all_distance,'----',$all_distance/2,'----';
		//环线处理路程，当计算出的路程大于总里程的一半；取总里程 减去 这个路程
		if( $huan_flag <> 0 && $distance > (int)($all_distance/2))
		{
			$distance = $all_distance - $distance;
		}
		
	}
	//echo '-----2222222222222222222222222------';
	$many_distance[] = $distance/10.0;
		//Array ( [0] => Array ( [id] => 1 [sid] => 1 [name] => 苹果园 [backlen] => 0 [aheadlen] => 25 [is_transfer] => 0 ) [1] => Array ( [id] => 23 [sid] => 11 [name] => 南礼士路 [backlen] => 12 [aheadlen] => 15 [is_transfer] => 0 ) ) 
	}//end foreach
	
	//print_r($many_distance);
	sort($many_distance,SORT_NUMERIC);
	

	return $many_distance['0'];
	//print_r($many_distance);
}


?>
