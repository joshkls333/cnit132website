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
	color: #273E10;
}

a:hover, a:active
{
	color: #ED6B00;
	background-color: #273E10;
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

<h2>Thanks <span style="color: #273E10; text-shadow: 1px 0px #CDF234; text-shadow: 1px 0px #CDF234; font-family: chalkboard, arial; font-weight: bold;">$in{'name'}</span> for submitting your information.</h2>

<!-- The above line substitutes the value associated with the name 'name' from the form, that was entered by the user-->

<input type="hidden" value="$in{'name'}" name="name">

<p>Your email address is  <span style="color: #273E10; text-shadow: 1px 0px #CDF234; text-shadow: 1px 0px #CDF234; font-family: chalkboard, arial; font-weight: bold;">$in{'email'}</span></p>

<!-- The above line substitutes the value associated with the name 'email'  from the form, that was entered by the user-->

<input type="hidden" value="$in{'email'}" name="email">

<p>You indicated that your favorite science subject is <span style="color: #273E10; text-shadow: 1px 0px #CDF234; text-shadow: 1px 0px #CDF234; font-family: chalkboard, arial; font-weight: bold;">$in{'science'}</span></p>

<!-- The above line substitutes the value associated with the name 'science'  from the form, that has been chosen by the user-->

<input type="hidden" value="$in{'science'}" name="science">

<p>You are interested in the following workshops:  <br /> 


<span style="color: #273E10; text-shadow: 1px 0px #CDF234; font-family: chalkboard, arial; font-weight: bold;">$in{'compsci1'}</span> 
<span style="color: #273E10; text-shadow: 1px 0px #CDF234; font-family: chalkboard, arial; font-weight: bold;">$in{'compsci2'}</span>
<span style="color: #273E10; text-shadow: 1px 0px #CDF234; font-family: chalkboard, arial; font-weight: bold;">$in{'compsci3'}</span>
<span style="color: #273E10; text-shadow: 1px 0px #CDF234; font-family: chalkboard, arial; font-weight: bold;">$in{'compsci4'}</span>
<span style="color: #273E10; text-shadow: 1px 0px #CDF234; font-family: chalkboard, arial; font-weight: bold;">$in{'compsci5'}</span>
<span style="color: #273E10; text-shadow: 1px 0px #CDF234; font-family: chalkboard, arial; font-weight: bold;">$in{'compsci6'}</span>

</p>

<!-- The above line substitutes the value(s) associated with the name 'compsci1', 'compsci2', 'compsci3', 'compsci4', 'compsci5', 'compsci6' from the form, that has been chosen by the user-->

<input type="hidden" value="$in{'compsci1'}" name="compsci1">
<input type="hidden" value="$in{'compsci2'}" name="compsci2">
<input type="hidden" value="$in{'compsci3'}" name="compsci3">
<input type="hidden" value="$in{'compsci4'}" name="compsci4">
<input type="hidden" value="$in{'compsci5'}" name="compsci5">
<input type="hidden" value="$in{'compsci6'}" name="compsci6">

<p>You indicated you have experience with the following computer languages:  <br /> 


<span style="color: #273E10; text-shadow: 1px 0px #CDF234; font-family: chalkboard, arial; font-weight: bold;">$in{'lang1'}</span>
<span style="color: #273E10; text-shadow: 1px 0px #CDF234; font-family: chalkboard, arial; font-weight: bold;">$in{'lang2'}</span>
<span style="color: #273E10; text-shadow: 1px 0px #CDF234; font-family: chalkboard, arial; font-weight: bold;">$in{'lang3'}</span>
<span style="color: #273E10; text-shadow: 1px 0px #CDF234; font-family: chalkboard, arial; font-weight: bold;">$in{'lang4'}</span>
<span style="color: #273E10; text-shadow: 1px 0px #CDF234; font-family: chalkboard, arial; font-weight: bold;">$in{'lang5'}</span>
<span style="color: #273E10; text-shadow: 1px 0px #CDF234; font-family: chalkboard, arial; font-weight: bold;">$in{'lang6'}</span>
<span style="color: #273E10; text-shadow: 1px 0px #CDF234; font-family: chalkboard, arial; font-weight: bold;">$in{'lang7'}</span>
<span style="color: #273E10; text-shadow: 1px 0px #CDF234; font-family: chalkboard, arial; font-weight: bold;">$in{'lang8'}</span>

</p>


<!-- The above line substitutes the value(s) associated with the name  'lang1', 'lang2', 'lang3', 'lang4', 'lang5', 'lang6', 'lang7', 'lang8' from the form, that has been chosen by the user-->

<input type="hidden" value="$in{'lang1'}" name="lang1">
<input type="hidden" value="$in{'lang2'}" name="lang2">
<input type="hidden" value="$in{'lang3'}" name="lang3">
<input type="hidden" value="$in{'lang4'}" name="lang4">
<input type="hidden" value="$in{'lang5'}" name="lang5">
<input type="hidden" value="$in{'lang6'}" name="lang6">
<input type="hidden" value="$in{'lang7'}" name="lang7">
<input type="hidden" value="$in{'lang8'}" name="lang8">

<p>You indicated that you prefer the <span style="color: #273E10; text-shadow: 1px 0px #CDF234; font-family: chalkboard, arial; font-weight: bold;">$in{'compos'}</span> operating system to work from</p>

<!-- The above line substitutes the value associated with the name 'compos'  from the form, that has been chosen by the user-->

<input type="hidden" value="$in{'compos'}" name="compos">

<p>Your comments: <span style="color: #273E10; text-shadow: 1px 0px #CDF234; font-family: chalkboard, arial; font-weight: bold;">$in{'comments'}</span></p>

<!-- The above line substitutes the value associated with the name 'comments'  from the form, that was entered by the user-->

<input type="hidden" value="$in{'comments'}" name="comments">

Press Submit to <b>SEND</b> the form to the Workshop Committee<br /><br />

<input type="submit" value="SUBMIT">&nbsp;&nbsp;&nbsp;	

<hr>

If you need to make changes please use the back button to return to the form for editing.<br><br>

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




