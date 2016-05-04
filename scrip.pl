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
        my $flag = 0;
        while (my $line = <$inputfile>) {
                # Se NAO esta listando pacotes
                if($flag eq 0){
                        # Se vai começar a listar os pacotes
                        #if ($line =~ /^[\sP]+RODUCT_PACKAGES\s[:+]=/ ){
                        if ($line =~ /^\s*PRODUCT_PACKAGES\s*[:+]=/ ){
                                $flag = 1;
                                print $tempfile "#".$line;
                                print $packagefile $line;
                        }
                        else {
                                print $tempfile $line;
                        }
                }
                elsif($flag eq 1){
                                print $tempfile "#".$line;
                        if ($line !~ /\\$/){
                                chop $line;
                                print $packagefile "$line \\\n";
                                        $flag = 0;
                        }
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

