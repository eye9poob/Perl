#!/Perl/bin/perl
#     __                                           _             __   _
#    / /_  __  __   ______________ _____  __  __  (_)_  ______  / /__(_)__
#   / __ \/ / / /  / ___/ ___/ __ `/_  / / / / / / / / / / __ \/ //_/ / _ \
#  / /_/ / /_/ /  / /__/ /  / /_/ / / /_/ /_/ / / / /_/ / / / / ,< / /  __/
# /_.___/\__, /   \___/_/   \__,_/ /___/\__, /_/ /\__,_/_/ /_/_/|_/_/\___/
#       /____/                         /____/___/
#
###############################################################################
# Download huge collections of wordlist:#
#http://ul.to/folder/j7gmyz#
##########################################################################
#
####################################################################
# Need daylie updated proxies?#
#http://j.mp/Y7ZZq9#
################################################################
#
######################################################
#### MD5 Hash Brute Force Cracker ######
###################################################
# 03-03-14
# v.0.0.2



$dbgtmr = "1"; #Intervall of showing the current speed + lastpassword in seconds.



if ($dbgtmr<=0){ die "Set dbgtmr to a value >=1 !\n";};

use Digest::MD5 qw(md5_hex);

use Time::HiRes qw(gettimeofday);



if ($ARGV[0]=~"a") {

$alpha = "abcdefghijklmnopqrstuvwxyz";}

if ($ARGV[0]=~"A") {

$alpha = $alpha. "ABCDEFGHIJKLMNOPQRSTUVWXYZ";}

if ($ARGV[0]=~"n") {

$alpha = $alpha."1234567890";}

if ($ARGV[0]=~"s") {

$alpha = $alpha. "!\"\$%&/()=?-.:\\*'-_:.;,";}



if ($alpha eq "" or $ARGV[3] eq "") {usage();};

if (length($ARGV[3]) != 32) { die "Sorry but it seems that the MD5 is not valid!\n";};



print "Selected charset for attack: '$alpha\'\n";

print "Going to Crack '$ARGV[3]'...\n";



for (my $t=$ARGV[1];$t<=$ARGV[2];$t++){

crack ($t);

}



sub usage{

print "\n";
print " #############################################################################\n";
print " # MD5 Hash Brute Force Cracker - v 0.0.2 | 03-03-14                         #\n";
print " #                                                                           #\n";
print " # find me on: twitter:            @crazyjunkie1		                             #\n";
print " #             github/gist.github: eye9poop                                  #\n";
print " #             pastebin:           gelbeseiten                               #\n";
print " #             google +:           crazyjunkie                               #\n";
print " #             youtube:            crazyjunkie (old artikel08)               #\n";
print " #             (channel not up to date | no time sorry)                      #\n";
print " # by ..:: crazyjunkie ::..                                                  #\n";
print " # good source from good people for your profit working                      #\n";
print " #                                                                           #\n";
print " # Usage: ./md5crack.pl <setkarakter> <minkarakter> <maxkarakter> <hashMD5>  #\n";
print " # Character options: a - small letters # a,b,c                              #\n";
print " #                    A - big letters   # A,B,C                              #\n";
print " #                    n - numbers       # 1,2,3                              #\n";
print " #                    s - symbols       # !,#,@                              #\n";
print " # Example: ./md5crack.pl an 1 3 1bc29b36f623ba82aaf6724fd3b16718            #\n";
print " #                                                                           #\n";
print " #############################################################################\n";
sys.exit(1)

}



sub crack{

$CharSet = shift;

@RawString = ();

for (my $i =0;$i<$CharSet;$i++){ $RawString[i] = 0;}

$Start = gettimeofday();

do{

  for (my $i =0;$i<$CharSet;$i++){

   if ($RawString[$i] > length($alpha)-1){

    if ($i==$CharSet-1){

    print "Bruteforcing done with $CharSet Chars. No Results.\n";

    $cnt=0;

    return false;

   }

   $RawString[$i+1]++;

   $RawString[$i]=0;

   }

  }

###################################################

   $ret = "";

   for (my $i =0;$i<$CharSet;$i++){ $ret = $ret . substr($alpha,$RawString[$i],1);}

   $hash = md5_hex($ret);

   $cnt++;

   $Stop = gettimeofday();

   if ($Stop-$Start>$dbgtmr){

    $cnt = int($cnt/$dbgtmr);

    print "$cnt hashes\\second.\tLast Pass '$ret\'\n";

    $cnt=0;

    $Start = gettimeofday();

   }

            print "$ARGV[3] != $hash ($ret)\n";

   if ($ARGV[3] eq $hash){

    die "\nPassword Cracked! => $ret\n";

   }

###################################################

  #checkhash($CharSet)."\n";



  $RawString[0]++;

}while($RawString[$CharSet-1]<length($alpha));

}



sub checkhash{

$CharSet = shift;

$ret = "";

for (my $i =0;$i<$CharSet;$i++){ $ret = $ret . substr($alpha,$RawString[$i],1);}

$hash = md5_hex($ret);

$cnt++;

$Stop = gettimeofday();

if ($Stop-$Start>$dbgtmr){

  $cnt = int($cnt/$dbgtmr);

  print "$cnt hashes\\second.\tLast Pass '$ret\'\n";

  $cnt=0;

  $Start = gettimeofday();

}



if ($ARGV[3] eq $hash){

  die "\nPassword Cracked! => $ret\n";

}




}
