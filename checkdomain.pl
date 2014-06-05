#!/usr/bin/perl
# by ..:: crazyjunkie ::.. 2014
use HTTP::Request;
use LWP::Simple;
$|=1;
print '[+] Avaribale domain checker';
print "\n[+] Enter Domains File : ";
$host=<STDIN>;
chomp($host);
open (tt, "<$host") || die "[-] Can't open Domains List !";
my @tt = <tt>;
close tt;
foreach $domain (@tt) 
{
chomp $domain;
$url = "http://www.checkdomain.com/cgi-bin/checkdomain.pl?domain=".$domain ;
$request = HTTP::Request->new(GET=>$url);
$useragent = LWP::UserAgent->new();
$useragent->timeout(5);
$response = $useragent->request($request);
if ($response->content=~m/is still available!/g)
{
print "[.] Avariable => $domain\n";
open(BEN,">>avariable-domains.txt");
print BEN "$domain\n";
close(BEN);
} else { 
print "[.] $domain Has been Registered \n";
}
next;
}
