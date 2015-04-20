# NouGAT commands
```
#QC
python ~/opt/de_novo_scilife/sciLifeLab_utils/run_QC_analysis.py --adapter ~/opt/de_novo_scilife/resources/TrueSeq_adapters.fasta --global-config ~/config_de_novo_uppmax.yaml --sample-data-dir /proj/a2012043/INBOX/V.Passoth_13/V.Passoth_13_01/ --orientation innie --insert 180 --std 30 --email remi-andre.olsen@scilifelab.se --project a2012043 --qos seqver

python ~/opt/de_novo_scilife/sciLifeLab_utils/run_QC_analysis.py --adapter ~/opt/de_novo_scilife/resources/TrueSeq_adapters.fasta --global-config ~/config_de_novo_uppmax.yaml --sample-data-dir /proj/a2012043/INBOX/V.Passoth_13/V.Passoth_13_02/ --orientation innie --insert 500 --std 120 --email remi-andre.olsen@scilifelab.se --project a2012043 --qos seqver

python ~/opt/de_novo_scilife/sciLifeLab_utils/run_QC_analysis.py --adapter ~/opt/de_novo_scilife/resources/nextera_linkers.txt --global-config ~/config_de_novo_uppmax.yaml --sample-data-dir /proj/a2012043/INBOX/V.Passoth_13/V.Passoth_13_03/ --orientation outtie --insert 3000 --std 450 --email remi-andre.olsen@scilifelab.se --project a2012043 --qos seqver

python ~/opt/de_novo_scilife/sciLifeLab_utils/run_QC_analysis.py --adapter ~/opt/de_novo_scilife/resources/nextera_linkers.txt --global-config ~/config_de_novo_uppmax.yaml --sample-data-dir /proj/a2012043/INBOX/V.Passoth_13/V.Passoth_13_04/ --orientation outtie --insert 6000 --std 900 --email remi-andre.olsen@scilifelab.se --project a2012043 --qos seqver


#Assembly
python ~/opt/de_novo_scilife/sciLifeLab_utils/run_assemblies.py --global-config ~/config_de_novo_uppmax.yaml --sample-data-dir /proj/a2012043/nobackup/private/projects/denovo/V.Passoth_13/01-QC/V.Passoth_13_01 --assemblers allpaths abyss spades soapdenovo --kmer 60 --genomeSize 14717419 --afterQC --email remi-andre.olsen@scilifelab.se --time 4-00:00:00 --project a2012043 --threads 16 --qos seqver --orientation innie --insert 180 --std 30


#Validation
python ~/opt/de_novo_scilife/sciLifeLab_utils/run_validation.py --assembly-dirs /proj/a2012043/nobackup/private/projects/denovo/V.Passoth_13/03-assembly/meta/V.Passoth_13/ --global-config ~/config_de_novo_uppmax --multiple-lib-proj --project a2012043 --email remi-andre.olsen@scilifelab.se --qos seqver


#Report / std. contiguity stats
python ~/opt/de_novo_scilife/sciLifeLab_utils/run_assembly_report.py --validation-dirs /proj/a2012043/nobackup/private/projects/denovo/V.Passoth_13/05-evaluation/V.Passoth_13/V.Passoth_13/ --assemblies-dirs /proj/a2012043/nobackup/private/projects/denovo/V.Passoth_13/03-assembly/meta/V.Passoth_13/ --global-config ~/config_de_novo_uppmax --no-uppmax --sample-name V.Passoth_13

```

# Opgen
```
# Base composition
cat V.Passoth_13.scf.40000.fasta | bioawk -c fastx '{print $seq}' | sed 's/\(.\)/\1\n/g' | sort | uniq -c
## mac:
cat V.Passoth_13.scf.40000.fasta | bioawk -c fastx '{print $seq}' | sed 's/\(.\)/\1\'$'\n/g' | sort | uniq -c

# Make 40k scf, and consensus
python ~/code/de_novo_scilife/utils/OpGen_util.py --assembly ../VPassoth_allpaths/V.Passoth_13.scf.fasta --genome-size 15000000 --min-contig 40000 --opgen-report ../VPassoth_allpaths/V.Passoth_13_chr1_allpaths_report.txt --output chr1

## Make consensus sequence
python ~/code/de_novo_scilife/utils/OpGen_util.py --assembly ../02-renamed_asm/joined/V.Passoth_13.scf.40000.fasta --genome-size 15000000 --min-contig 40000 --output chr1 --opgen-report ../reports/V.Passoth_13_chr1_allpaths_reportv2.txt --place-last pac

# Find unique placed contigs
cat reports/*.placement | awk '{print $5}' | sort | uniq > placed_contigs.txt
cat reports/V.Passoth_13_chr1_allpaths_reportv2.txt.placement reports/V.Passoth_13_chr2_allpaths_pac_report.txt.placement reports/V.Passoth_13_chr3_allpaths_pac_report.txt.placement reports/V.Passoth_13_chr4_allpaths_pac_report.txt.placement reports/V.Passoth_13_chr5_allpaths_pac_report.txt.placement | awk '{print $5}' | sort | uniq > placed_contigs1-5.txt

# find all allpaths contigs
grep ">" 02-renamed_asm/allpaths/V.Passoth_13.scf.40000.fasta | sed 's/>//g' | sort > ap_contigs.txt

# find unplaced ap contigs
diff ap_contigs.txt placed_contigs.txt
< ap_contig21
17,19d17
< ap_contig24
< ap_contig25
< ap_contig26
21,22d18
< ap_contig28
< ap_contig29
24,25d19
< ap_contig30
< ap_contig32

# getting unknowns, then renaming them
cat 02-renamed_asm/allpaths/V.Passoth_13.scf.40000.fasta | bioawk -c fastx '{if($name=="ap_contig21") {print ">"$name;print $seq}}' >> unk.fasta
cat unk.fasta | ruby -ne 'BEGIN{$u=1}; if $_.start_with?(">") then print ">"+"unknown"+$u.to_s+":"+$_.slice(1..-1); $u+=1 else print $_ end' > unknown.fasta
rm unk.fasta

```

# Computing allpaths-HGAP overlaps
https://github.com/remiolsen/OGParse

