#!/usr/local/bin/perl
#file name emailback.pl
print "content-type: text/html\n\n";
read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
@pairs=split(/&/,$buffer);
foreach $pair(@pairs)

{
($name,$value)=split(/=/, $pair);  
  
if ($value eq "")    
{	    
$value = 'none';
}	

else	
{	
$value=~ tr/+/ /;
    
$value=~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C",hex($1))/eg;

$value=~ s/~!/ /g;    

$FORM{$name}=$value;    
}

}
$mailprog='/usr/sbin/sendmail';
$recipient='jklaus1\@mail.ccsf.edu';
open(MAIL,"|$mailprog $recipient") || die "Can't open $mailprog!\n";
print MAIL "Reply-to: $FORM{'email'} ($FORM{'name'})\n";

print MAIL "Subject: Form Data\n\n";

foreach $key (keys(%FORM))
{print MAIL "$key=$FORM{$key}\n";}
close(MAIL);

open(FORMFILE,">>../formdata.dat") || die "Can open file";
print FORMFILE $FORM{"name"},"\:",$FORM{"email"},"\:",$FORM{"science"},"\:",$FORM{"compos"},"\:",$FORM{"compsci1"},"\:",$FORM{"compsci2"},"\:",$FORM{"compsci3"},"\:",$FORM{"compsci4"},"\:",$FORM{"compsci5"},"\:",$FORM{"compsci6"},"\:",$FORM{"lang1"},"\:",$FORM{"lang2"},"\:",$FORM{"lang3"},"\:",$FORM{"lang4"},"\:",$FORM{"lang5"},"\:",$FORM{"lang6"},"\:",$FORM{"lang7"},"\:",$FORM{"lang8"},"\:",$FORM{"comments"},"\n";
print<<"_END_";

<html>
<head>
<title>Thank you</title>

<style>

body {
	font-family: trebuchet, tahoma; 
	background-color: #4E7B2E;}

a {
	text-decoration: none;
	color: #273E10;
	text-shadow: 1px 0px #CDF234
}

a:hover, a:active {
	color: #ED6B00;
	background-color: #1A3C1A;
	padding: 1px;
}

</style>

</head>
<body>
<pre>


</pre>
<div align="center">
<table bgcolor="#FF8825" cellpadding="5" border="4px solid black">
<tr>
<td>

<h3>Thank You <span style="color: #273E10; text-shadow: 1px 0px #CDF234; font-family: chalkboard, arial; font-weight: bold;">$FORM{"name"}</span>,
for submitting your information.<br> Your form data was sent to the Science Discovery Workshop committee.<br>
We will make every effort to accommodate a custom experience for you.</h3>

<b>Return to the 
<a href="homework8a.html">Form</a>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

Return to 
<a href="homework8.html">Home</a>
</b>
</td>
</tr>
</table>
</div>

</body>
</html>
_END_
;