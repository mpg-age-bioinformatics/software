#!/usr/bin/env perl

use strict; use warnings;

# External libraries
use Getopt::Long; # Get options supplied by the user

my $program = "annotate_novel_segments.pl";

# Initialize option variables
my $help = '';

my $usage = "
Program:	$program
Author:		Thomas Koed Doktor - SDU, Denmark - thomaskd\@bmb.sdu.dk
Description:	Reads a bedtools intersect output file produced by:
		bedtools intersect -s -f 1.0 -r -loj -a novel.gff -b known.gff > novel_overlap_known_stringent.gff

Usage:		$program [OPTIONS] novel_overlap_known_stringent.gff > novel_segments_from_overlap_stringent.tsv

Options:	-h/--help		Print this help screen.

";

# Read the options supplied by the user
GetOptions (	'help' => \$help);
die $usage if $help;


# Check file input
my $input_file = $ARGV[0];
if ($input_file eq "") {
	print STDERR "\n*********\n";
	error("********* Please supply an input file!\n");
	print STDERR "*********\n".$usage."\n";
	exit;
}
else {
	print STDERR "Using file: $input_file\n";
}

my %novel2known_genes;
my %regions;

my $current_gene = "";
my $processed_genes = 0;
open(INPUT, "<$input_file") || die "\n*********\n********* Failed to open $input_file!\n*********\n".$usage;
progress("Reading file...");
while (<INPUT>) {
	next if substr($_,0,1) eq '#'; # skip header or comment lines
	progress(".") if $processed_genes % 10000 == 0;
	chomp;
	my @fields = split /\t/;
	my $chr = $fields[0];
	my $source = $fields[1];
	my $feature = $fields[2];
	my $start = $fields[3];
	my $end = $fields[4];
	my $strand = $fields[6];
	my ($gene) = $fields[8] =~ /gene_id=([^";]+)/;
	if ($gene ne $current_gene) {
		$current_gene = $gene;
		$processed_genes++;
	}
	my ($known_gene) = $fields[17] =~ /gene_id=([^";]+)/;
	if (defined $known_gene) {
		if (!exists $novel2known_genes{$gene}) {$novel2known_genes{$gene} = []}
		push(@{$novel2known_genes{$gene}}, $known_gene);
	}
        if ($feature eq "segment") {
                my ($number) = $fields[8] =~ /segment_id=$gene.s(\d+)/;
                my $id = $gene.".s".$number;
		if (!defined $known_gene) { # no known segment matches this, keep as candidate for novel splicing and novel gene
			$regions{$id}{'gene_id'} = $gene;
			$regions{$id}{'chr'} = $chr;
			$regions{$id}{'start'} = $start;
			$regions{$id}{'end'} = $end;
			$regions{$id}{'strand'} = $strand;
		}
		else {
			print $id."\tKnownSplice\n";
		}
                next;
        }
        elsif ($feature eq "intron") {
                my ($number) = $fields[8] =~ /intron_id=$gene.i(\d+)/;
                my $id = $gene.".i".$number;
		my ($known_gene) = $fields[17] =~ /gene_id=([^";]+)/;
		if (!defined $known_gene) { # no known intron matches this, keep as candidate for novel splicing and novel gene
			$regions{$id}{'gene_id'} = $gene;
			$regions{$id}{'chr'} = $chr;
			$regions{$id}{'start'} = $start;
			$regions{$id}{'end'} = $end;
			$regions{$id}{'strand'} = $strand;
		}
		else {
			print $id."\tKnownSplice\n";
		}
                next;
        }
}
close(INPUT) || die "\n*********\n********* Failed to close $input_file!\n*********\n";
done();

my $total_genes = $processed_genes;
progress("Total genes: $total_genes\n");

progress("Analyzing genes...");
for my $id (keys %regions) {
	if (exists $novel2known_genes{$regions{$id}->{'gene_id'}}) {
		print $id."\tNovelSplice\n";
	}
	else {
		print $id."\tNovelGene\n";
	}
}
done();

sub progress {
	my ($message) = @_;
	print STDERR $message;
}

sub done {
	print STDERR "done\n";
}

