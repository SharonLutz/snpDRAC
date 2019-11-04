## snpDRAC
Determines the power to detect a genetic association for dominant, recessive, additive, and co-dominant models.


## Installation
```
install.packages("devtools") # devtools must be installed first

devtools::install_github("SharonLutz/snpDRAC")
```

## Input
For n subjects, the SNP x is generated from a binomial distribution with minor allele frequency inputted by the user (input:MAF). The outcome y is generated from a normal distribution with a mean for x=0 (input:mu0), x=1 (input:mu1), x=2 (input:mu2). The user can specify the number of simulations (input: nSim), the significance level (input: alpha), and the seed(input: SEED).

See the manpage for more detail regarding the input of the snpDRAC function.

```
library(snpDRAC)
?snpDRAC # For details on this function
```

## Output
After the SNP x and the outcome y are generated, then 4 linear regression models are fit: (1) a dominant model for the SNP x, (2) a recessive model for the SNP x, (3) an additive model for the SNP x, and (4) a co-dominant for the SNP x. Then, the empirical power is outputted for all for models (i.e. the proportion of simulations the null hypothesis is rejected at the specified alpha level).

## Example 1: Generative a SNP under the additive model
For 1,000 subjects (input:n=1000), we generate a SNP with a minor allele frequncy of 0.3 (input:MAF=0.3) under an additive model such that mean of Y given x=0,1,2 equals 0.6, 0.7, 0.8, repectively (input:mu0=0.6,mu1=0.7,mu2=0.8).

```
library(snpDRAC)
snpDRAC(n=1000,MAF=0.3,mu0=0.6,mu1=0.7,mu2=0.8)
```

### Output 1: 
The additive model has the most power in this scenario.
```
#     dominant recessive additive codominant
#[1,]    0.456     0.282    0.534      0.424
```

## Example 2: Generative a SNP under the dominant model
For 1,000 subjects (input:n=1000), we generate a SNP with a minor allele frequncy of 0.3 (input:MAF=0.3) under a dominant model such that mean of Y given x=0,1,2 equals 0.7, 0.8, 0.8, repectively (input:mu0=0.7,mu1=0.8,mu2=0.8).

```
library(snpDRAC)
snpDRAC(n=1000,MAF=0.3,mu0=0.7,mu1=0.8,mu2=0.8)
```

### Output 2: 
The dominant model has the most power in this scenario, but the additive model has the second highest power.
```
#     dominant recessive additive codominant
#[1,]    0.339     0.076      0.3      0.259
```

## Example 3: Generative a SNP under the recessive model
For 1,000 subjects (input:n=1000), we generate a SNP with a minor allele frequncy of 0.3 (input:MAF=0.3) under a recessive model such that mean of Y given x=0,1,2 equals 0.7, 0.7, 0.8, repectively (input:mu0=0.7,mu1=0.7,mu2=0.8).

```
library(snpDRAC)
snpDRAC(n=1000,MAF=0.3,mu0=0.7,mu1=0.7,mu2=0.8)
```

### Output 3: 
The recessive model has the most power in this scenario, but the codominant and additive models have the second and third highest power.
```
#     dominant recessive additive codominant
#[1,]    0.054     0.143    0.086      0.111
```

## Example 4: Generative a SNP under the co-dominant model
For 1,000 subjects (input:n=1000), we generate a SNP with a minor allele frequncy of 0.3 (input:MAF=0.3) under a co-dominant model such that mean of Y given x=0,1,2 equals 0.5, 0.7, 0.8, repectively (input:mu0=0.5,mu1=0.7,mu2=0.8).

```
library(snpDRAC)
snpDRAC(n=1000,MAF=0.3,mu0=0.5,mu1=0.7,mu2=0.8)
```

### Output 4: 
The additive model has the most power in this scenario.
```
#     dominant recessive additive codominant
#[1,]     0.92     0.472    0.925       0.88
```

## Note:
This is just a learning tool for BST 227: Introduction to Statistical Genetics.
