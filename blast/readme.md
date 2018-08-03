# Blast
*Note:* blasting is only for molecules < 1kbp. If query sequences are longer, thus the probability that they contain repeats is higher, another software needs to be used. The result will otherwise mostly include alignments of the repeats to many repetitive regions in the genome. For longer queries, minimap2 is a good choice.

creating a database from .fasta file. `-parse_seqids` takes into account the sequence identifiers, so sequences can be
referred to by this ID.
```
makeblastdb -in <genome.fasta> -dbtype nucl -parse_seqids
```
Search query sequences in a genome fasta file with database created.
```
blastn -db <genome.fasta> -query <querysequences.fasta> -out <results.out> -outfmt <6> -perc_identity <80>
```
Extract a sequence from a blast database
```
blastdbcmd -db <genome.fasta> -entry <entryname>
```
# Minimap2
[Minimap2](https://github.com/lh3/minimap2)

create an index first and then map
```
./minimap2 -d <indexname.mmi> genome.fa
```
For longer query sequnces, minimap2 is a good choice.

Align long query sequences to a reference.
```
minimap2 -a <genome.mmi> <queryies.fasta> > tracey.sam
```
