<?php
header( "Content-type: text/html; charset=utf-8" );

//连接数据库

$conn = mysql_connect(SAE_MYSQL_HOST_S.':'.SAE_MYSQL_PORT,SAE_MYSQL_USER,SAE_MYSQL_PASS);
if (!$conn) {
        echo "Unable to connect to DB: " . mysql_error();
        exit;
    }

mysql_select_db(SAE_MYSQL_DB);
mysql_query('set names utf8');

//根据苹果园这个站点的名称，找到是一号线
$from = empty($_GET['from']) ? '前门' : $_GET['from'];
$to = empty($_GET['to']) ? '南礼士路' : $_GET['to'];
//$from = '前门';
//$to = '南礼士路';

//这个站属于那些线路
$sql = "SELECT line_id FROM zhans WHERE zhan_name = '".$from."'";
$res = mysql_query($sql);
while ($row = mysql_fetch_assoc($res)) {
	$from_lines[] =  $row['line_id'];
}
//这个站属于那些线路
$sql = "SELECT line_id FROM zhans WHERE zhan_name = '".$to."'";
$res = mysql_query($sql);
while ($row = mysql_fetch_assoc($res)) {
	$to_lines[] = $row['line_id'];
}

//print_r($from_lines);print_r($to_lines);
//如果两个站所属于同一条线路，那么是在一条线路上
$on_one_lines = array_intersect($from_lines, $to_lines);


//情况1，在一条线路上
if($on_one_lines){
	$step_one = onOneLine($from, $to);
	//echo '总里程：';print_r($step_one);
	echo array_sum($step_one);
	exit;
}

//todo两点不在一条线上时，八通线，大兴线，亦庄线和15号线，房山线，与之唯一相连的线路的相连站点作为始发站。以便简化复杂度


$zhijiexiangjiao = 0;	//直接相交
//情况2
//不在同一条线路上，但是相交的情况
if(empty($on_one_lines)){
	foreach($from_lines as $fline){
		foreach($to_lines as $tline){
			//找到两条线路的直接换成站
			$sql = "SELECT zhan_name , COUNT(line_id) AS huan FROM zhans  WHERE line_id = $fline OR line_id = $tline GROUP BY zhan_name HAVING huan >=2";
			$res = mysql_query($sql);
			$huan_zhan = array();	//每次循环了，初始化一下
			while ($row = mysql_fetch_assoc($res)) {
				$huan_zhan[] = $row['zhan_name'];	
			}
			//print_r($huan_zhan);
			//不在同一条线路上，但是相交的情况
			if(!empty($huan_zhan)){
			
				$zhijiexiangjiao = 1;	//此时说明直接相交，
				//找到了这两个线路的可以换乘站$huan_zhan
				//计算出从$from 到这些换乘站的距离，比较出短的。
				foreach($huan_zhan as $huanch_zhan){
					$step_1 = onOneLine($from, $huanch_zhan);
					$step_2 = onOneLine($huanch_zhan, $to);
					//echo '总里程：';print_r($step_1);print_r($step_2);
					//echo '总里程数：';
					$distance_arr[] = array_sum(array_merge($step_1,$step_2));
				}
			}
			
			
		}
	}
	
	if(!empty($distance_arr)){
		sort($distance_arr, SORT_NUMERIC);
		
		echo $distance_arr['0'];
		exit;
	}
	
	
}

$no_situlation4 = 0;	//比这个更复杂的情况
//不在同一条线路上，不直接相交的情况
if($zhijiexiangjiao == 0){
	foreach($from_lines as $fline){
		foreach($to_lines as $tline){
				//***** todo 优化，应该在上面直接相交的情况循环完成，在执行下面的情况
				//不在同一条线路上，不直接相交的情况
				$tbf_name = 'line_'.$fline;
				$tbt_name = 'line_'.$tline;
				$sql = "SELECT zhan_name FROM $tbf_name WHERE is_transfer = 1 ";
				$res = mysql_query($sql);
				
				while ($row = mysql_fetch_assoc($res)) {
					$huan2_zhan[$tbf_name][] = $row['zhan_name'];	
				}
				
				$sql = "SELECT zhan_name FROM $tbt_name WHERE is_transfer = 1 ";
				$res = mysql_query($sql);
				while ($row = mysql_fetch_assoc($res)) {
					$huan2_zhan[$tbt_name][] = $row['zhan_name'];	
				}
				//print_r($huan2_zhan[$tbf_name]);
				foreach($huan2_zhan[$tbf_name] as $fname){
					foreach($huan2_zhan[$tbt_name] as $tname){
						//检验这两个站是否在一条线路上
						//$sql = "SELECT line_id FROM zhans WHERE zhan_name='".$fname."' OR zhan_name = '".$tname."'";
						$sql = "SELECT COUNT(id) AS twoline FROM zhans WHERE zhan_name='".$fname."' OR zhan_name = '".$tname."'"
							." GROUP BY line_id ORDER BY twoline DESC LIMIT 1";
						$res = mysql_query($sql);
						$two = 1;
						while ($row = mysql_fetch_assoc($res)) {
							$two = $row['twoline'];
							//找出$huan2_lines这个数组中重复2次的值。重复2次的都是经过的线路
							//如果找到了重复2次的，那么说明$fname和$tname就是换乘站，换乘的线路就是：$huan2_lines这个数组中重复2次的值
							//其实把上面的sql写成一条可以证明line_id相等就行了。
							if($two == 2){
							
								$no_situlation4 = 1;//说明没有更复杂的情况了
								//站点所在的两条线路，不相交，但相较于另一条线路
								$step_1 = onOneLine($from, $fname);
								$step_2 = onOneLine($fname, $tname);
								$step_3 = onOneLine($tname, $to);
								//echo '总里程：';print_r($step_1);print_r($step_2);print_r($step_3);
								//echo '总里程数：';
								$distance_arr[] = array_sum(array_merge($step_1,$step_2,$step_3));
							}
						}
						
						
					}
				}
				
		}		
	}	
	if(!empty($distance_arr)){
		sort($distance_arr, SORT_NUMERIC);
		
		echo $distance_arr['0'];
		exit;
	}
}

$no_situlation5 == 0;	//定义一种情况，更复杂的，需要换乘4次，5段路程。

//换乘3次的情况，4段路程。所在线路换乘站，都在换乘后交叉
if($no_situlation4 == 0){

	foreach($from_lines as $fline){
		foreach($to_lines as $tline){
				
				//不在同一条线路上，不直接相交的情况
				$tbf_name = 'line_'.$fline;
				$tbt_name = 'line_'.$tline;
				$sql = "SELECT zhan_name FROM $tbf_name WHERE is_transfer = 1 ";
				$res = mysql_query($sql);
				
				while ($row = mysql_fetch_assoc($res)) {
					$huan2_zhan[$tbf_name][] = $row['zhan_name'];	
				}
				
				$sql = "SELECT zhan_name FROM $tbt_name WHERE is_transfer = 1 ";
				$res = mysql_query($sql);
				while ($row = mysql_fetch_assoc($res)) {
					$huan2_zhan[$tbt_name][] = $row['zhan_name'];	
				}
				print_r($huan2_zhan[$tbf_name]);
				foreach($huan2_zhan[$tbf_name] as $fname){
					foreach($huan2_zhan[$tbt_name] as $tname){
					
						//找到经过这些站的线路，$fname得到的线路，去掉$fline； $tname得到的线路去掉$tline；
						$sql = "SELECT line_id FROM zhans WHERE zhan_name = '".$fname."'";
						$res = mysql_query($sql);
						while ($row = mysql_fetch_assoc($res)) {
							if($row['line_id'] == $fline){
								continue;
							}
							$from2_lines[] =  $row['line_id'];
						}
						
						$sql = "SELECT line_id FROM zhans WHERE zhan_name = '".$tname."'";
						$res = mysql_query($sql);
						while ($row = mysql_fetch_assoc($res)) {
							//$fname得到的线路，去掉$fline； 减少不必要的判断
							if($row['line_id'] == $tline){
								continue;
							}
							$to2_lines[] =  $row['line_id'];
						}
						
						foreach($from2_lines as $f2line){
							foreach($to2_lines as $t2line){
								//检验这两个站是否在一条线路上
								//找到两条线路的直接换成站
								$sql = "SELECT zhan_name , COUNT(line_id) AS huan FROM zhans  WHERE line_id = $f2line OR line_id = $t2line GROUP BY zhan_name HAVING huan >=2";
								$res = mysql_query($sql);
								$huan3_zhan = array();	//每次循环了，初始化一下
								while ($row = mysql_fetch_assoc($res)) {
									$huan3_zhan[] = $row['zhan_name'];	
								}
								
													//不在同一条线路上，但是相交的情况
								if(!empty($huan3_zhan)){
									
									//说明没有更复杂的情况了
									$no_situlation5 == 1;
									
									//找到了这两个线路的可以换乘站$huan_zhan
									//计算出从$from 到这些换乘站的距离，比较出短的。
									foreach($huan3_zhan as $huanch_zhan){
										$step_1 = onOneLine($from, $fname);
										$step_2 = onOneLine($fname, $huanch_zhan);
										$step_3 = onOneLine($huanch_zhan, $tname);
										$step_4 = onOneLine($tname, $to);
										//echo '总里程：';print_r($step_1);print_r($step_2);print_r($step_3);print_r($step_4);
										//echo '总里程数：';
										$distance_arr[] = array_sum(array_merge($step_1,$step_2,$step_3));
									}
								} 
							}
						}
						
						
						
					}
				}
				
		
		}		
	}	

	if(!empty($distance_arr)){
		sort($distance_arr, SORT_NUMERIC);
		echo $distance_arr['0'];
		exit;
	}

}


$no_situlation6 == 0;	//定义一种情况，更复杂的，需要换乘5次，6段路程。

//换乘4次的情况，5段路程。所在线路换乘站，都在换乘后无交叉点，但有在一条线路上的点。
if($no_situlation5 == 0){

	foreach($from_lines as $fline){
		foreach($to_lines as $tline){
				
				//不在同一条线路上，不直接相交的情况
				$tbf_name = 'line_'.$fline;
				$tbt_name = 'line_'.$tline;
				$sql = "SELECT zhan_name FROM $tbf_name WHERE is_transfer = 1 ";
				$res = mysql_query($sql);
				
				while ($row = mysql_fetch_assoc($res)) {
					$huan2_zhan[$tbf_name][] = $row['zhan_name'];	
				}
				
				$sql = "SELECT zhan_name FROM $tbt_name WHERE is_transfer = 1 ";
				$res = mysql_query($sql);
				while ($row = mysql_fetch_assoc($res)) {
					$huan2_zhan[$tbt_name][] = $row['zhan_name'];	
				}
				//print_r($huan2_zhan[$tbf_name]);
				foreach($huan2_zhan[$tbf_name] as $fname){
					foreach($huan2_zhan[$tbt_name] as $tname){
					
						//找到经过这些站的线路，$fname得到的线路，去掉$fline； $tname得到的线路去掉$tline；
						$sql = "SELECT line_id FROM zhans WHERE zhan_name = '".$fname."'";
						$res = mysql_query($sql);
						while ($row = mysql_fetch_assoc($res)) {
							if($row['line_id'] == $fline){
								continue;
							}
							$from2_lines[] =  $row['line_id'];
						}
						
						$sql = "SELECT line_id FROM zhans WHERE zhan_name = '".$tname."'";
						$res = mysql_query($sql);
						while ($row = mysql_fetch_assoc($res)) {
							//$fname得到的线路，去掉$fline； 减少不必要的判断
							if($row['line_id'] == $tline){
								continue;
							}
							$to2_lines[] =  $row['line_id'];
						}
						
						foreach($from2_lines as $f2line){
							foreach($to2_lines as $t2line){
								
								//不在同一条线路上，不直接相交的情况
								$tbf2_name = 'line_'.$f2line;
								$tbt2_name = 'line_'.$t2line;
								$sql = "SELECT zhan_name FROM $tbf2_name WHERE is_transfer = 1 ";
								$res = mysql_query($sql);
								
								while ($row = mysql_fetch_assoc($res)) {
									$huan3_zhan[$tbf2_name][] = $row['zhan_name'];	
								}
								
								$sql = "SELECT zhan_name FROM $tbt2_name WHERE is_transfer = 1 ";
								$res = mysql_query($sql);
								while ($row = mysql_fetch_assoc($res)) {
									$huan3_zhan[$tbt2_name][] = $row['zhan_name'];	
								}
								print_r($huan3_zhan[$tbf2_name]);
								foreach($huan3_zhan[$tbf2_name] as $f2name){
									foreach($huan3_zhan[$tbt2_name] as $t2name){
										//检验这两个站是否在一条线路上
										//$sql = "SELECT line_id FROM zhans WHERE zhan_name='".$fname."' OR zhan_name = '".$tname."'";
										$sql = "SELECT COUNT(id) AS twoline FROM zhans WHERE zhan_name='".$f2name."' OR zhan_name = '".$t2name."'"
											." GROUP BY line_id ORDER BY twoline DESC LIMIT 1";
										$res = mysql_query($sql);
										$two = 1;
										while ($row = mysql_fetch_assoc($res)) {
											$two = $row['twoline'];
											//找出$huan2_lines这个数组中重复2次的值。重复2次的都是经过的线路
											//如果找到了重复2次的，那么说明$fname和$tname就是换乘站，换乘的线路就是：$huan2_lines这个数组中重复2次的值
											//其实把上面的sql写成一条可以证明line_id相等就行了。
											if($two == 2){
											
												$no_situlation6 = 1;//说明没有更复杂的情况了
												//站点所在的两条线路，不相交，但相较于另一条线路
												$step_1 = onOneLine($from, $fname);
												$step_2 = onOneLine($fname, $f2name);
												$step_3 = onOneLine($f2name, $t2name);
												$step_4 = onOneLine($t2name, $tname);
												$step_5 = onOneLine($tname, $to);
												//echo '总里程：';print_r($step_1);print_r($step_2);print_r($step_3);print_r($step_4);print_r($step_5);
												//echo '总里程数：';
												$distance_arr[] = array_sum(array_merge($step_1,$step_2,$step_3,$step_4,$step_5));
												
											}
										}
										
										
									}
								}
							}
						}
						
						
						
					}
				}
				
		
		}		
	}	

	if(!empty($distance_arr)){
		sort($distance_arr, SORT_NUMERIC);
		echo $distance_arr['0'];
		exit;
	}

}



//如果是环线，就要考虑取模，
$huan_flag = 0;
//如果两个点在一条线路上，查看是否在多条线路上，如果是了，就要比较了
if($zhan_start == $zhan_end){
	//比较同一条线路上的点，做减法就行了。
}
//如果不在同一条线路上，而是直接相交
//根据站点所在的线路zhans表，查找line_x出共同的换乘站；如果有的，说明直接相交。（可能有多个相交的点，需要比较距离了。）
//没有直接相交，查看一下有共同相交的线路吗？这种情况是换乘2次。
//超过3次换乘的，就是递归取的相交的线路，然后连成线路。


//如果站点
//shujuku 站点 表设计：站点序列（从1开始），站名，后退距离，前进距离，是否换乘站

//从苹果园到八角游乐园，如果站点都在一号线，那么就把站点sid相减，n 小于零了，该站点前进方向的前进距离相加n次；反之，都退方向相加n次
//array_key_exist('pingguoyuan', $m1);
//输入一条线路的两个站点，返回array('2',5.5)这个线路上走的距离
function onOneLine($from , $to){



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
	$many_distance[$one_line] = $distance/10.0;
		//Array ( [0] => Array ( [id] => 1 [sid] => 1 [name] => 苹果园 [backlen] => 0 [aheadlen] => 25 [is_transfer] => 0 ) [1] => Array ( [id] => 23 [sid] => 11 [name] => 南礼士路 [backlen] => 12 [aheadlen] => 15 [is_transfer] => 0 ) ) 
	}//end foreach
	
	//print_r($many_distance);
	asort($many_distance,SORT_NUMERIC);
	$nums = count($many_distance);
	for($i=0;$i<$nums-1;$i++){
		array_pop($many_distance);
	}

	return $many_distance;
	//print_r($many_distance);
}


?>