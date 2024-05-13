#!/usr/bin/perl

use strict; use warnings;

# External libraries
use Getopt::Long; # Get options supplied by the user

my $program = "get_genename_from_segment_overlap.pl";

# Initialize option variables
my $help = '';

my $usage = "
Program:	$program
Author:		Thomas Koed Doktor - SDU, Denmark - thomaskd\@bmb.sdu.dk
Description:	Reads a bedtools intersect output file produced by:
		bedtools intersect -s -f 1.0 -r -loj -a novel.gff -b known.gff > novel_overlap_known.gff

Usage:		$program [OPTIONS] novel_overlap_known.gff > novel2known_from_overlap.tsv

Options:	-h/--help		Print this help screen.
		-q/--quiet		Quiet mode, don't output statistics or any other messages.

";

# Read the options supplied by the user
GetOptions (	'help' => \$help);
die $usage if $help;


# Check file input
if (not $ARGV[0]) {
	print STDERR "\n*********\n";
	error("********* Please supply an input file!\n");
	print STDERR "*********\n".$usage."\n";
	exit;
}
else {
	print STDERR "Using file: $ARGV[0]\n";
}
my $input_file = $ARGV[0];

my %novel2known_genes;
my %novel2known_introns;
my %novel2known_segments;


my $current_gene = "";
my $processed_genes = 0;
open(INPUT, "<$input_file") || die "\n*********\n********* Failed to open $input_file!\n*********\n".$usage;
progress("Reading file...");
while (<INPUT>) {
	next if substr($_,0,1) eq '#'; # skip header or comment lines
	progress(".") if $processed_genes % 1000 == 0;
	chomp;
	my @fields = split /\t/;
	my $feature = $fields[2];
        if ($feature eq "gene") {
                my ($gene) = $fields[8] =~ /gene_id=([^";]+)/;
                $current_gene = $gene;
                $processed_genes++;
		my ($known_gene) = $fields[17] =~ /gene_id=([^";]+)/;
		if (defined $known_gene) {
			if (!exists $novel2known_genes{$gene}) {$novel2known_genes{$gene} = []}
			push(@{$novel2known_genes{$gene}}, $known_gene);
		}
                next;
        }
        elsif ($feature eq "segment") {
                my ($gene) = $fields[8] =~ /gene_id=([^";]+)/;
                #print STDOUT "Gene: $gene\n";
                my ($number) = $fields[8] =~ /segment_id=$gene.s(\d+)/;
                my $segment = $gene.".s".$number;
                #print STDOUT "Segment: $segment\n";
		my ($known_gene) = $fields[17] =~ /gene_id=([^";]+)/;
		if (defined $known_gene) {
			if (!exists $novel2known_segments{$segment}) {$novel2known_segments{$segment} = []}
			push(@{$novel2known_segments{$segment}}, $known_gene);
		}
                next;
        }
        elsif ($feature eq "intron") {
                my ($gene) = $fields[8] =~ /gene_id=([^";]+)/;
                my ($number) = $fields[8] =~ /intron_id=$gene.i(\d+)/;
                my $intron = $gene.".i".$number;
		my ($known_gene) = $fields[17] =~ /gene_id=([^";]+)/;
		if (defined $known_gene) {
			if (!exists $novel2known_introns{$intron}) {$novel2known_introns{$intron} = []}
			push(@{$novel2known_introns{$intron}}, $known_gene);
		}
                next;
        }
}
close(INPUT) || die "\n*********\n********* Failed to close $input_file!\n*********\n";
done();

my $total_genes = $processed_genes;
progress("Total genes: $total_genes\n");

progress("Analyzing genes...");
for my $gene (keys %novel2known_genes) {
	my @known = do { my %seen; grep { !$seen{$_}++ } @{$novel2known_genes{$gene}}}; # get only the unique gene id's
	my $known = join(',', @known);
	print $gene."\t".$known."\n";
}
for my $segment (keys %novel2known_segments) {
	my @known = do { my %seen; grep { !$seen{$_}++ } @{$novel2known_segments{$segment}}}; # get only the unique gene id's
	my $known = join(',', @known);
	print $segment."\t".$known."\n";
}
for my $intron (keys %novel2known_introns) {
	my @known = do { my %seen; grep { !$seen{$_}++ } @{$novel2known_introns{$intron}}}; # get only the unique gene id's
	my $known = join(',', @known);
	print $intron."\t".$known."\n";
}
done();

sub progress {
	my ($message) = @_;
	print STDERR $message;
}


sub done {
	print STDERR "done\n";
}
