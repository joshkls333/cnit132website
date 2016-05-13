#!/usr/local/bin/perl

# The above statement must be the first statement and it tells the 
# server where to find the perl interpreter so that the script can run
# (NOTE: this statement is machine dependent) 


do  "cgi-lib.pl" ||die "Fatal Error: Can't load cgi library";

# The above statement calls subroutines in the cgi-lib.pl library, 
# which are needed to run a perl program
# If cgi-lib.pl fails to load, then an error message is printed 


&ReadParse;

# The above line reads the stream of name=value pairs from the form
# and puts the values in a perl table called  in


print "Content-type: text/html\n\n";

# The above line indicates the Mime type of the information
# that the script is sending back to the browser thru the Web server
# In perl, a \n is a "carriage return, next line"
# \n\n is required here



# The next line says to output the following information, until the
# the statement    _END_   is reached

print<<"_END_";


<html>

<head>
<title>Feedback Form</title>

<meta http-equiv="content-type" content="text/html; charset=utf-8" />


<style>

body {
	font-family: trebuchet, tahoma; 
	background-color: #4E7B2E;}

a{
	text-decoration: none;
	color: #1A3C1A;
}

a:hover, a:active
{
	color: #ED6B00;
	background-color: #1A3C1A;
	padding: 1px;
}

</style>

</head>

<body>


<div align="center">

<form method="post" action="emailback.pl">

<table bgcolor="#FF8825" cellpadding="5" border="4px solid black">
<tr>
<td>

<h2>Thanks <span style="color: #1A3C1A; font-family: chalkboard, arial; font-weight: bold;">$in{'name'}</span> for visiting my web site.</h2>

<!-- The above line substitutes the value associated with the name 'name' from the form, that was entered by the user-->

<input type="hidden" value="$in{'name'}" name="name">

<p>Your email address is  <span style="color: #1A3C1A; font-family: chalkboard, arial; font-weight: bold;">$in{'email'}</span></p>

<!-- The above line substitutes the value associated with the name 'email'  from the form, that was entered by the user-->

<input type="hidden" value="$in{'email'}" name="email">

<p>You indicated that your favorite science subject is <span style="color: #1A3C1A; font-family: chalkboard, arial; font-weight: bold;">$in{'science'}</span></p>

<!-- The above line substitutes the value associated with the name 'science'  from the form, that has been chosen by the user-->

<input type="hidden" value="$in{'science'}" name="science">

Press Submit to <b>SEND</b> the form <br /><br />

<input type="submit" value="SUBMIT">&nbsp;&nbsp;&nbsp;	

<hr>

If you need to make changes please use the back button to return to the form for editing.<br>

<!-- this script and many more avaliable from A1 javascripts all credit to A1javascripts. Please leave these comments intact thank you -->

<form>
<input type=button value="Back" onClick="history.back()">
</form>

</td>
</tr>
</table>
</form>
</div>
</body>
</html>

_END_
;

