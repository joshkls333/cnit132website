<?php
$msg = "E-MAIL sent from the Giants front office\n";
$msg .= "Sender's Name:    $_POST[sender_name]\n";
$msg .= "Sender's E-mail:  $_POST[sender_email]\n";
$msg .= "Sender's Preferred Seating Area:     $_POST[area]\n";

$msg .= "Sections sender has sat in: $_POST[seats1] $_POST[seats2] $_POST[seats3] $_POST[seats4] $_POST[seats5] $_POST[seats6]\n";

$msg .= "Favorite Player: ";


	$status=$_POST['players'];
	if ($status){
	 foreach ($status as $f) {$msg .=  "$f  ";}
	}



$msg .= "\nSender's Experience:     $_POST[experience]\n";
$to = "jklaus1@mail.ccsf.edu";
$subject = "Web Site Feedback - Giants Fan Submission";
$mailheaders = "From: $_POST[sender_email]\n";
$mailheaders .= "Reply-To: $_POST[sender_email]\n\n";
mail($to, $subject, $msg, $mailheaders);

if (mail($to, $subject, $msg, $mailheaders)) {
   echo("<p>Email successfully sent!</p>");
  } else {
   echo("<p>Email delivery failed</p>");
  }



?>


<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<title>The following email has been sent to Josh Klaus</title>

<style>
body {
 	background: orange; 
 	background: -webkit-linear-gradient(orange,black); 
 	background: -o-linear-gradient(orange,black); 
 	background: -moz-linear-gradient(orange,black); 
 	background: linear-gradient(orange,black); 
}

#contents {
	
	margin: 0px auto; padding: 15px;
	text-align: left; /* Counteract to IE/Win Hack */	
	border: 1px solid;
	font-family: chalkboard, arial;
	font-weight: bold;
	width: 630px; border: solid; padding: 10px; background-color: #FF9B15;}

</style>

</head>
<body>

<section>

<br><br>

<div id="contents">


<h3>The following email has been sent to Josh Klaus:
<br>(php script uses multiple select items)
</h3>


<div id="box">

<p><b>Your Name: </b>
<?php echo "$_POST[sender_name]"; ?>
<br><br>

<b>Your E-mail Address: </b>
<?php echo "$_POST[sender_email]"; ?>
<br><br>

<b>Your Preferred Area: </b>
<?php echo "$_POST[area]"; ?>
<br><br>


<b>Sections you have sat in before: </b>
<?php echo "$_POST[seats1]"; ?>
<?php echo " "; ?>
<?php echo "$_POST[seats2]"; ?>
<?php echo " "; ?>
<?php echo "$_POST[seats3]"; ?>
<?php echo " "; ?>
<?php echo "$_POST[seats4]"; ?>
<?php echo " "; ?>
<?php echo "$_POST[seats5]"; ?>
<?php echo " "; ?>
<?php echo "$_POST[seats6]"; ?>
<br><br>


<b>Your Favorite Player: </b><br>

<?php
	$status=$_POST['players'];
	if ($status){
	 foreach ($status as $f) {echo $f,'<br>';}
	}

?>

<br><br>


<b>Your Experience:</b>
<?php echo "$_POST[experience]"; ?>
</p>


</div> 

</section>
</body>
</html>