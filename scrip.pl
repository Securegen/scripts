#!/usr/bin/perl
use strict;
use warnings;
use File::Copy 'move';

my $num_args = $#ARGV + 1;

open my $packagefile, '>' , "android_packages_raw" or die "could not create packagefile: $!";
#print $packagefile "PRODUCT_PACKAGES := \\\n";

for (my $i = 0; $i < $num_args; $i++) {
        my $inputfilename = $ARGV[$i];
        my $tempfilename = "/tmp/MAKE$i";

        open my $inputfile, '<' , $inputfilename or die "could not open file: $!";
        open my $tempfile, '>' , $tempfilename or die "could not create tempfile $tempfilename: $!";

        my $notReadingPackages = 1;

        while (my $line = <$inputfile>) {
                # If it isnt reading packages
                if($notReadingPackages){
                        # Started reading packages
                        #if ($line =~ /^[\sP]+RODUCT_PACKAGES\s[:+]=/ ){
                        if ($line =~ /^\s*PRODUCT_PACKAGES\s*[:+]=/ ){
				if ($line =~ /\\\s*$/){
                                	$notReadingPackages = 0;
				}
                                print $tempfile "#".$line;
                                print $packagefile $line;
                        }
			# Keep not reading packages
                        else {
                                print $tempfile $line;
                        }
                }
		# If it is reading packages
                else{
			# Comment out the package from origin
                        print $tempfile "#".$line;
			# If it isnt the last package listed
                        if ($line !~ /\\\s*$/){
                                chop $line;
                                print $packagefile "$line \\\n";
                                $notReadingPackages = 1;
                        }
			# Get the last package listed
                        else {
                                print $packagefile $line;
                        }
                }

        }
        close $inputfile;
        close $tempfile;
        move $tempfilename, $inputfilename or WriteLog ("move $tempfilename, $inputfilename failed: $!");
}
close $packagefile;
