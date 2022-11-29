<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Contact Form</title>
<style>
body, html {
height: 100%;
font-family: Arial, Helvetica, sans-serif;
}
* {
box-sizing: border-box;
}
.bg-img {
/* The image used */
background-image: url("demo.jpg");
min-height: 800px;
/* Center and scale the image nicely */
background-position: left;
background-repeat: no-repeat;
background-size: cover;
position:relative;
}

/* Add styles to the form container */
.container {
position: absolute;
right: 100;
margin: 50px;
max-width: 550px;
padding: 16px;
background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
width: 100%;
padding: 15px;
margin: 5px 0 22px 0;
border: none;
background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
background-color: #ddd;
outline: none;
}

/* Set a style for the submit button */
.btn {
background-color: Indigo;
color: white;
padding: 16px 20px;
border: none;
cursor: pointer;
width: 80%;
opacity: 0.9;
}
.btn:hover {
opacity: 1;
}
</style>
</head>
<p align="right">
<div style="background-image:url('bb.jpg');width:2100px;height:900px;background-repeat: no-repeat;background-size:cover;">
<link rel="stylesheet" href="proj1.css">
<p align="center">
<br/></br></br></br><span style='font-size:40px;color:red;'> &nbsp;  &nbsp;  &nbsp; <b> &nbsp;  &nbsp;  THANK YOU FOR ENTERING</span></p>
</br></br><h1><span style='font-size:40px;color:black;'>&nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  Here is the information displaying list of Donor:</span></h1>


<?php
include 'mysql_connect.php';
if(isset($_POST['search']))
{
    $valueToSearch = $_POST['valueToSearch'];
	
 //echo  $valueToSearch;
    // search in all table columns
    // using concat mysql function?>
    
       <table class="styled-table">	 &nbsp;&nbsp;  &nbsp;  &nbsp;  &nbsp; <h1>BLOOD BANK MANAGEMENT SYSTEM</h1>
    <thead>
      &nbsp;    <tr>
            <th> Did</th>
            <th>Dname</th>
            <th>rid</th>
            <th>rname</th>
        </tr>
    </thead><?php
   $query ="select dId,dName,rId,rName from donar d, bloodr br, reg_staff where db_grp = rb_grp AND dreg_date = r_regdate AND d.rs_id = br.rs_id AND rs_name = '$valueToSearch'";
$result = $conn->query($query);
    if ($result->num_rows > 0) 
    {
        // OUTPUT DATA OF EACH ROW
        while($row = $result->fetch_assoc())
        {
         ?>
            <tbody>
            <tr>
                <td> <?php echo $row["dId"] ?> </td>
                <td><?php echo $row ["dName"] ?></td>
                <td><?php echo $row ["rId"] ?></td>
				<td><?php echo $row ["rName"] ?></td>
            </tr>
            <?php
 }}}?>
 </tbody>
</table>

<html lang="en">

<head>

	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <title>CUSTOMER_DETAILS</title>
	<!-- CSS FOR STYLING THE PAGE -->
	<style>
		table {
			margin: 0 auto;
			font-size: large;
			border: 3px solid black;
		}

		h1 {
			text-align: center;
			color: #006600;
			font-size: xx-large;
			font-family: 'Gill Sans', 'Gill Sans MT',
			' Calibri', 'Trebuchet MS', 'sans-serif';
		}

		td {
			background-color:#F2F4F4 ;
			border: 1.5px solid black;
		}

		th,
		td {
			font-weight: bold;
			border: 2px solid black;
			padding: 15px;
			text-align: center;
		}

		td {
			font-weight: lighter;
		}
	</style>

</head>

<body>
	<section>


</body>

