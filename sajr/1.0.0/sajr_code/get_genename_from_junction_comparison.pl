#!/usr/bin/perl

use strict; use warnings;

# External libraries
use Getopt::Long; # Get options supplied by the user



my $program = "get_genename_from_junction_comparison.pl";

# Initialize option variables
my $help = '';
my $accepted_classes = "=,c,j,e";

my $usage = "
Program:	$program
Author:		Thomas Koed Doktor - SDU, Denmark - thomaskd\@bmb.sdu.dk
Description:	Reads a comparison file produced by SAJR and outputs likely gene IDs for the novel genes found by SAJR.

Usage:		$program [OPTIONS] sajr.comp > sajr.novel2known.tsv

Options:	-c/--classes STRING	Comma-separated list of accepted classes [default: $accepted_classes]
		-h/--help		Print this help screen.

Overlap classes:
		= - both genes have exactly the same set of junctions
		c - junctions of one gene are subset of junctions of other one
		j - genes share some junctions
		e - genes overlap by exons in sense
		i - one gene is within intron of other one (in sense)
		a - one gene is within intron of other one (in antisense)
		x - genes overlap by exons in antisense

";

# Read the options supplied by the user
GetOptions (	'help' => \$help,
		'classes:s' => \$accepted_classes);
die $usage if $help;


my @accepted_classes = split(",",$accepted_classes);
my %classes;
$classes{$_}++ for (@accepted_classes);
my %class_match_score = (
	'=' => 1,
	'c' => 2,
	'j' => 3,
	'e' => 4,
	'i' => 5,
	'a' => 6,
	'x' => 7,
);


# Check file input
my $input_file = $ARGV[0];
if ($input_file eq "") {
	print STDERR "\n*********\n";
	error("********* Please supply an input reference file!\n");
	print STDERR "*********\n".$usage."\n";
	exit;
}
else {
	print STDERR "Using file: $input_file\n";
}

my %novel_genes;

my $current_gene = "";
my $processed_genes = 0;
open(INPUT, "<$input_file") || die "\n*********\n********* Failed to open $input_file!\n*********\n".$usage;
progress("Reading file...");
while (<INPUT>) {
	next if substr($_,0,1) eq '#'; # skip header or comment lines
	progress(".") if $processed_genes % 1000 == 0;
	my @fields = split /\t/;
	my $novel_gene = $fields[0];
	my $known_gene = $fields[1];
	if ($novel_gene ne $current_gene) {
		$current_gene = $novel_gene;
		$processed_genes++;
	}
	my $class = $fields[2];
	my @counts = split(",",$fields[3]);
	my $novel_int = $counts[0];
	my $known_int = $counts[1];
	my $common_int = $counts[2];
	my $match_fraction = 0;
	if ($known_int > 0) { $match_fraction = $common_int/$known_int }
	if (exists $classes{$class}) {
		$novel_genes{$novel_gene}{$known_gene}{'class'} = $class;
		$novel_genes{$novel_gene}{$known_gene}{'novel_intron_count'} = $novel_int;
		$novel_genes{$novel_gene}{$known_gene}{'known_intron_count'} = $known_int;
		$novel_genes{$novel_gene}{$known_gene}{'common_intron_count'} = $common_int;
		$novel_genes{$novel_gene}{$known_gene}{'intron_match_fraction'} = $match_fraction;
	}
}
close(INPUT) || die "\n*********\n********* Failed to close $input_file!\n*********\n";
done();

my $total_genes = $processed_genes;
my $multiple_genes = 0;
progress("Total genes: $total_genes\n");

progress("Analyzing genes...");
analyzeGenes();
done();
progress("Multiple genes: $multiple_genes\n");

sub progress {
	my ($message) = @_;
	print STDERR $message;
}

sub done {
	print STDERR "done\n";
}


sub analyzeGenes {
	# loop through the genes
	for my $novel_gene (keys %novel_genes) {
		my $best_gene = "";
		my $best_class = "x"; # actually the worst class, but we put it here to have something to compare to
		my $best_ratio = 0; # start with the worst possible ratio
		my $best_common = 0; # start with the worst possible common overlap of introns
		for my $known_gene (keys %{$novel_genes{$novel_gene}}) {
			my $class = $novel_genes{$novel_gene}->{$known_gene}->{'class'};
			my $common = $novel_genes{$novel_gene}->{$known_gene}->{'common_intron_count'};
			my $ratio = $novel_genes{$novel_gene}->{$known_gene}->{'intron_match_fraction'};
			# is it a better class match than what we had before (lower score)? Then save that instead
			if ($class_match_score{$class} < $class_match_score{$best_class}) {
				$best_gene = $known_gene;
				$best_class = $class;
				$best_ratio = $ratio;
			} elsif ($class_match_score{$class} == $class_match_score{$best_class}) {
					$best_gene = $best_gene.",".$known_gene;
			}
		}
		if ($best_gene =~ /,/) {
			$multiple_genes++;
		}
		print $novel_gene."\t".$best_gene."\t".$best_class."\n";
	}
}

