#!/usr/local/bin/perl
#file name emailz.pl
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
'<a href="http://fog.ccsf.edu/~srubin/h8xsamp5.html">Form</a></p>';
print "</body></html>";
die;
}
$mailprog='/usr/sbin/sendmail';
$recipient='joshklaus333\@gmail.com';
open(MAIL,"|$mailprog $recipient") || die "Can't open $mailprog!\n";
print MAIL "Reply-to: $FORM{'email'}
($FORM{'name'})\n";
print MAIL "Subject: Form Data\n\n";
foreach $key (keys(%FORM))
{print MAIL "$key=$FORM{$key}\n";}
close(MAIL);
open(FORMFILE,">>../formdata.dat") || die "Can open file";
print FORMFILE $FORM{"name"},"\:",$FORM{"email"},"\:",$FORM{"fan"},"\:",$FORM{"occup"},"\n";
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
<table background="pinkdotbg.jpg" cellpadding="20">
<tr>
<td>

<h3>Thank You, <span style="background-color: yellow;">$FORM{"name"}</span>,
for submitting your request.<br> Your form data was emailed to me.</h3>

<b>Return to the 
<a href="h8xsamp5.html">Form</a>

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