#!/usr/bin/perl -w

use strict;

#----------------------------------------------------------------------#
#Set initial and final processing dates
#----------------------------------------------------------------------#
my $t_initial				= "20090617";

#----------------------------------------------------------------------#
#Set final date - Leave final date year set at 2018
#----------------------------------------------------------------------#
my $t_final				= "20180729";

#----------------------------------------------------------------------#
#Set user to begin creating transactions with:
#----------------------------------------------------------------------#
my $tickticker 		       		= 3300001;

#----------------------------------------------------------------------#
#Srt user to stop creating transaction with:
#----------------------------------------------------------------------#
my $tickticker_sto			= 3300500;

#----------------------------------------------------------------------#
#Used to set the twice monthly frequency date values. t_frequency=3
#----------------------------------------------------------------------#
my $date1				= "17";
my $date2				= "30";

#----------------------------------------------------------------------#
#FREQ-NUM1th-OCCUR-OFTHE-NUM2-WEEKDY - not typically set. Not used in
# or supported in production
#----------------------------------------------------------------------#
my $num1a				= "2";
my $num2a				= "5";

#----------------------------------------------------------------------#
#FREQ-EVRY-NUM1-WKS-ON-NUM2-DY - Used to set bi-weekly frequency's
#t_frequency=4
#----------------------------------------------------------------------#
my $num1b				= "3";
my $num2b				= "3";

#----------------------------------------------------------------------#
#Email address of where to send notifications
#For large batches use: testmail@qa.digitalinsight.com
#----------------------------------------------------------------------#
my $email_add				= "amzad.hossain\@digitalinsight.com";
#my $email_add				= "srtqa1\@gmail.com";
#my $email_add				= "testmail\@qa.digitalinsight.com";

#----------------------------------------------------------------------#
#Toggle r notifications & count per user
#----------------------------------------------------------------------#
my $check_clear				= "true";
my $check_clear_itm_cnt			= "1";

#----------------------------------------------------------------------#
#Toggle maturity date notifications
#----------------------------------------------------------------------#
my $maturity_date			= "true";
my $maturity_date_itm_cnt		= "1";

#----------------------------------------------------------------------#
#Toggle payment due notifications & count per user
#----------------------------------------------------------------------#
my $payment_due				= "true";
my $payment_due_itm_cnt			= "1";

#----------------------------------------------------------------------#
#Toggle payment past due notifications & count per user
#----------------------------------------------------------------------#
my $payment_past			= "true";
my $payment_past_itm_cnt		= "1";

#----------------------------------------------------------------------#
#Toggle reminder alert notifications
#----------------------------------------------------------------------#
my $reminder				= "true";

#----------------------------------------------------------------------#
#Toggle less than / greater than notifications
#----------------------------------------------------------------------#
my $lt_gt_bal				= "true";

#----------------------------------------------------------------------#
#Toggle periodic balance notifications
#----------------------------------------------------------------------#
my $periodic_balance			= "true";

###########################################################################
#Begin creating SRT Migration flat file - DO NOT EDIT BELOW
###########################################################################
my $values_inc				= 1;
my $values_ticker			= $tickticker;
my $values_sto				= $tickticker_sto;
my $item_cnt				= "1";

print "The Dictionary contains ".($tickticker_sto - 3300000)." entries.\n";
print "[VALUES]\n";

while ( $values_ticker <=  $values_sto)
{
	print "$values_inc = $values_ticker\n";
	$values_inc++;
	$values_ticker++;
	
}	
	print "\n\n";
	print "[TABLES]\n";
	
while ( $tickticker <=  $tickticker_sto)
{
	print "\n";
	print "_NAME_:$tickticker\n";
	print "SERVICE,TEST,ACTION,T_INITIAL,T_FINAL,T_FREQUENCY,T_NUM1,T_NUM2,A_AATTRIB,T_AATTRIB,T_AATTRIBADJ,T_TESTTYPE,T_THRESHOLD,T_CHKNM,A_ANUM,T_ANUM,A_ATYP,T_ATYP,A_TUSR,T_USR,T_AATTRIBTYPE,A_EMAIL,A_SUBJECT,A_MESSAGE,A_MPRIORITY,A_ALERTTYPE,PIN\n";
	
	if ($reminder eq "true"){
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,0,0,7,,,,,,,,,0,,$tickticker,,,$email_add,One Time - Periodic Reminder Notification Subject,Periodic Reminder Notification Message~nBreak~nBreak~m Double Break~mYou should not see user values here:(~n~a~u)~mFooter Text,0,1,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,1,$date1,0,AABAL,,,,,,,,0,,$tickticker,,,$email_add,Once a Month on a Given Date - Periodic Reminder Notification Subject,Periodic Reminder Notification Message~nBreak~nBreak~m Double Break~mYou should not see user values here:(~n~a~u)~mFooter Text,0,1,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,2,$num1a,$num2a,AABAL,,,,,,,,0,,$tickticker,,,$email_add,On the X occurance of the Y week in a month - Periodic Reminder Notification Subject,Periodic Reminder Notification Message~nBreak~nBreak~m Double Break~mYou should not see user values here:(~n~a~u)~mFooter Text,0,1,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,3,$date1,$date2,AABAL,,,,,,,,0,,$tickticker,,,$email_add,Every X and Y Dates in a Month - Periodic Reminder Notification Subject,Periodic Reminder Notification Message~nBreak~nBreak~m Double Break~mYou should not see user values here:(~n~a~u)~mFooter Text,0,1,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,4,$num1b,$num2b,AABAL,,,,,,,,0,,$tickticker,,,$email_add,Every X number of weeks on the Y day of the week - Periodic Reminder Notification Subject,Periodic Reminder Notification Message~nBreak~nBreak~m Double Break~mYou should not see user values here:(~n~a~u)~mFooter Text,0,1,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,5,0,0,AABAL,,,,,,,,0,,$tickticker,,,$email_add,Annually on Date Created - Periodic Reminder Notification Subject,Periodic Reminder Notification Message~nBreak~nBreak~m Double Break~mYou should not see user values here:(~n~a~u)~mFooter Text,0,1,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,6,0,0,AABAL,,,,,,,,0,,$tickticker,,,$email_add,Daily - Periodic Reminder Notification Subject,Periodic Reminder Notification Message~nBreak~nBreak~m Double Break~mYou should not see user values here:(~n~a~u)~mFooter Text,0,1,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,7,2,3,AABAL,,,,,,,,0,,$tickticker,,,$email_add,Bi-Weekly - Periodic Reminder Notification Subject,Periodic Reminder Notification Message~nBreak~nBreak~m Double Break~mYou should not see user values here:(~n~a~u)~mFooter Text,0,1,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,8,0,0,AABAL,,,,,,,,0,,$tickticker,,,$email_add,Quarterly (Every 3 Months) - Periodic Reminder Notification Subject,Periodic Reminder Notification Message~nBreak~nBreak~m Double Break~mYou should not see user values here:(~n~a~u)~mFooter Text,0,1,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,9,0,0,AABAL,,,,,,,,0,,$tickticker,,,$email_add,Semi-Annually (Every 6 Months) - Periodic Reminder Notification Subject,Periodic Reminder Notification Message~nBreak~nBreak~m Double Break~mYou should not see user values here:(~n~a~u)~mFooter Text,0,1,1234\n";
	}
	
	if ($lt_gt_bal eq "true"){
		print "0,SWEEPITEM,ALERT,$t_initial,$t_final,,,,AABAL,AABAL,,GT,100,,2758248117,2758248117,1,1,,$tickticker,MONEY,$email_add,Account Balance Alert GT Subject,Test Alert GT Message~nBreak~nDouble Break~n~nBalance (AABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,,0,1234\n";
		print "0,SWEEPITEM,ALERT,$t_initial,$t_final,,,,ABAL,ABAL,,GT,200,,2758248117,2758248117,1,1,,$tickticker,MONEY,$email_add,Account Balance Alert GT Subject,Test Alert GT Message~nBreak~nDouble Break~n~nBalance (ABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,,0,1234\n";



		print "0,SWEEPITEM,ALERT,$t_initial,$t_final,,,,AABAL,AABAL,,LT,2000000,,717550591,717550591,0,0,,$tickticker,MONEY,$email_add,Account Balance Alert LT Subject,Test Alert LT Message~nBreak~nDouble Break~n~nBalance (AABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,,0,1234\n";
		print "0,SWEEPITEM,ALERT,$t_initial,$t_final,,,,ABAL,ABAL,,LT,2000000,,717550591,717550591,0,0,,$tickticker,MONEY,$email_add,Account Balance Alert LT Subject,Test Alert LT Message~nBreak~nDouble Break~n~nBalance (ABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,,0,1234\n";


		print "0,SWEEPITEM,ALERT,$t_initial,$t_final,,,,LABAL,LABAL,,GT,100,,365077,365077,32,32,,$tickticker,MONEY,$email_add,Account Balance Alert GT Subject,Test Alert GT Message~nBreak~nDouble Break~n~nBalance (LABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,,0,1234\n";
		print "0,SWEEPITEM,ALERT,$t_initial,$t_final,,,,LBAL,LBAL,,GT,100,,365077,365077,32,32,,$tickticker,MONEY,$email_add,Account Balance Alert GT Subject,Test Alert GT Message~nBreak~nDouble Break~n~nBalance (LBAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,,0,1234\n";


		print "0,SWEEPITEM,ALERT,$t_initial,$t_final,,,,LABAL,LABAL,,LT,2000000,,365179,365179,64,64,,$tickticker,MONEY,$email_add,Account Balance Alert LT Subject,Test Alert LT Message~nBreak~nDouble Break~n~nBalance (LABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,,0,1234\n";
		print "0,SWEEPITEM,ALERT,$t_initial,$t_final,,,,LBAL,LBAL,,LT,2000000,,365179,365179,64,64,,$tickticker,MONEY,$email_add,Account Balance Alert LT Subject,Test Alert LT Message~nBreak~nDouble Break~n~nBalance (LBAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,,0,1234\n";


		print "0,SWEEPITEM,ALERT,$t_initial,$t_final,,,,IABAL,IABAL,,GT,100,,465855,465855,16,16,,$tickticker,MONEY,$email_add,Account Balance Alert GT Subject,Test Alert GT Message~nBreak~nDouble Break~n~nBalance (IABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,,0,1234\n";
		print "0,SWEEPITEM,ALERT,$t_initial,$t_final,,,,IBAL,IBAL,,GT,100,,465855,465855,16,16,,$tickticker,MONEY,$email_add,Account Balance Alert GT Subject,Test Alert GT Message~nBreak~nDouble Break~n~nBalance (IBAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,,0,1234\n";


		print "0,SWEEPITEM,ALERT,$t_initial,$t_final,,,,IABAL,IABAL,,LT,2000000,,688779,688779,4096,4096,,$tickticker,MONEY,$email_add,Account Balance Alert LT Subject,Test Alert LT Message~nBreak~nDouble Break~n~nBalance (IABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,,0,1234\n";
		print "0,SWEEPITEM,ALERT,$t_initial,$t_final,,,,IBAL,IBAL,,LT,2000000,,688779,688779,4096,4096,,$tickticker,MONEY,$email_add,Account Balance Alert LT Subject,Test Alert LT Message~nBreak~nDouble Break~n~nBalance (IBAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,,0,1234\n";
	}
	
	if ($periodic_balance eq "true"){
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,0,0,7,AABAL,,,,,,2758248117,,1,,$tickticker,,,$email_add,One Time - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (AABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,1,$date1,0,AABAL,,,,,,717550591,,0,,$tickticker,,,$email_add,Once a Month on a Given Date - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (AABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,2,$num1a,$num2a,AABAL,,,,,,2758248117,,1,,$tickticker,,,$email_add,On the X occurance of the Y week in a month - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (AABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,3,$date1,$date2,AABAL,,,,,,717550591,,0,,$tickticker,,,$email_add,Every X and Y Dates in a Month - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (AABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,4,$num1b,$num2b,AABAL,,,,,,2758248117,,1,,$tickticker,,,$email_add,Every X number of weeks on the Y day of the week - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (AABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,5,0,0,AABAL,,,,,,717550591,,0,,$tickticker,,,$email_add,Annually on Date Created - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (AABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,6,0,0,AABAL,,,,,,2758248117,,1,,$tickticker,,,$email_add,Daily - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (AABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,7,2,3,AABAL,,,,,,717550591,,0,,$tickticker,,,$email_add,Bi-Weekly - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (AABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,8,0,0,AABAL,,,,,,2758248117,,1,,$tickticker,,,$email_add,Quarterly (Every 3 Months) - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (AABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,9,0,0,AABAL,,,,,,717550591,,0,,$tickticker,,,$email_add,Semi-Annually (Every 6 Months) - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (AABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,0,0,7,ABAL,,,,,,2758248117,,1,,$tickticker,,,$email_add,One Time - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (ABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,1,$date1,0,ABAL,,,,,,717550591,,0,,$tickticker,,,$email_add,Once a Month on a Given Date - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (ABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,2,$num1a,$num2a,ABAL,,,,,,2758248117,,1,,$tickticker,,,$email_add,On the X occurance of the Y week in a month - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (ABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,3,$date1,$date2,ABAL,,,,,,717550591,,0,,$tickticker,,,$email_add,Every X and Y Dates in a Month - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (ABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,4,$num1b,$num2b,ABAL,,,,,,2758248117,,1,,$tickticker,,,$email_add,Every X number of weeks on the Y day of the week - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (ABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,5,0,0,ABAL,,,,,,717550591,,0,,$tickticker,,,$email_add,Annually on Date Created - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (ABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,6,0,0,ABAL,,,,,,2758248117,,1,,$tickticker,,,$email_add,Daily - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (ABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,7,2,3,ABAL,,,,,,717550591,,0,,$tickticker,,,$email_add,Bi-Weekly - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (ABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,8,0,0,ABAL,,,,,,2758248117,,1,,$tickticker,,,$email_add,Quarterly (Every 3 Months) - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (ABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,9,0,0,ABAL,,,,,,717550591,,0,,$tickticker,,,$email_add,Semi-Annually (Every 6 Months) - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (ABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,0,0,7,LABAL,,,,,,365077,,32,,$tickticker,,,$email_add,One Time - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (LABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,1,$date1,0,LABAL,,,,,,365179,,64,,$tickticker,,,$email_add,Once a Month on a Given Date - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (LABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,2,$num1a,$num2a,LABAL,,,,,,365077,,32,,$tickticker,,,$email_add,On the X occurance of the Y week in a month - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (LABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,3,$date1,$date2,LABAL,,,,,,365179,,64,,$tickticker,,,$email_add,Every X and Y Dates in a Month - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (LABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,4,$num1b,$num2b,LABAL,,,,,,365077,,32,,$tickticker,,,$email_add,Every X number of weeks on the Y day of the week - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (LABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,5,0,0,LABAL,,,,,,365179,,64,,$tickticker,,,$email_add,Annually on Date Created - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (LABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,6,0,0,LABAL,,,,,,365077,,32,,$tickticker,,,$email_add,Daily - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (LABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
		print "0,SCHEDULEDITEM,ALERT,$t_initial,$t_final,7,2,3,LABAL,,,,,,365179,,64,,$tickticker,,,$email_add,Bi-Weekly - Periodic Balance Notification Subject,Periodic Balance Notification Alert message~nBreak~nDouble Break~n~nBalance (LABAL) :~b~mYou should not see user values here:(~n~a~u)~mFooter Text,0,0,1234\n";
         }	
	$tickticker++;
}
