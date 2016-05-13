#!/usr/local/bin/perl
#file name emailback.pl
print "content-type: text/html\n\n";
read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
@pairs=split(/&/,$buffer);
foreach $pair(@pairs)
{
($name,$value)=split(/=/, $pair);
$value=~ tr/+/ /;
$value=~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C",hex($1))/eg;
$value=~ s/~!/ /g;
$FORM{$name}=$value;
if ($value eq "") 
{
&error;
}
}
sub error
{ 
print "<html>";
print "<h2>Warning</h2>";
print "<body>You have not completed all fields.<p>";
print "Return to the ";
print 
'<a href="http://hills.ccsf.edu/~jklaus1/homework8a.html">Form</a></p>';
print "</body></html>";
die;
}
$mailprog='/usr/sbin/sendmail';
$recipient='jklaus1\@mail.ccsf.edu';
open(MAIL,"|$mailprog $recipient") || die "Can't open $mailprog!\n";
print MAIL "Reply-to: $FORM{'email'}
($FORM{'name'})\n";
print MAIL "Subject: Form Data\n\n";
foreach $key (keys(%FORM))
{print MAIL "$key=$FORM{$key}\n";}
close(MAIL);
open(FORMFILE,">>../formdata.dat") || die "Can open file";
print FORMFILE $FORM{"name"},"\:",$FORM{"email"},"\:",$FORM{"science"},"\:",$FORM{"compos"},"\:",$FORM{"compsci1"},"\:",$FORM{"compsci2"},"\:",$FORM{"compsci3"},"\:",$FORM{"compsci4"},"\:",$FORM{"compsci5"},"\:",$FORM{"compsci6"},"\:",$FORM{"lang1"},"\:",$FORM{"lang2"},"\:",$FORM{"lang3"},"\:",$FORM{"lang4"},"\:",$FORM{"lang5"},"\:",$FORM{"lang6"},"\:",$FORM{"lang7"},"\:",$FORM{"lang8"},"\:",$FORM{"comments"},"\n";
close(FORMFILE);
print<<EndHTML;

<html>
<head>
<title>Thank you</title>

<style>
a:hover  {background-color: yellow;}
</style>

</head>
<body bgcolor="#8f0052" vlink="blue">
<pre>


</pre>
<div align="center">
<table cellpadding="20">
<tr>
<td>

<h3>Thank You, <span style="background-color: yellow;">$FORM{"name"}</span>,
for submitting your request.<br> Your form data was emailed to me.</h3>

<b>Return to the 
<a href="homework8a.html">Form</a>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

Return to 
<a href="index.html">Home</a>
</b>
</td>
</tr>
</table>
</div>

</body>
</html>
EndHTML