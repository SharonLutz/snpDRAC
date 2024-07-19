\name{snpDRAC}
\alias{snpDRAC}
\title{snpDRAC}
\description{
Determines the proportion of simulations the null hypothesis is rejected to detect a genetic association for dominant, recessive, additive, and co-dominant models.
}
\usage{
snpDRAC(n = 1000, MAF = 0.3, mu0 = 0.6, mu1 = 0.8, mu2 = 1, varY = 1, nSim = 1000, alpha = 0.05, SEED = 1)
}
\arguments{
  \item{n}{
 is the sample size
}
  \item{MAF}{
is the minor allele frequency for the SNP X
}
  \item{mu0}{
is the means of Y given the SNP X=0
}
  \item{mu1}{
is the means of Y given the SNP X=1
}
  \item{mu2}{
is the means of Y given the SNP X=2
}
  \item{varY}{
 is the variance of Y
}
  \item{nSim}{
 is the number of simulations
}
  \item{alpha}{
 is the significance level, 0.05
}
  \item{SEED}{
is seed for reproducibility
}
}
\value{
For n subjects, the SNP x is generated from a binomial distribution with minor allele frequency inputted by the user (input:MAF). The outcome y is generated form a normal distribution with a mean for x=0 (input:mu0), x=1 (input:mu1), x=2 (input:mu2). The user can specify the number of simulations (input: nSim), the significance level (input: alpha), and the seed(input: SEED). After the SNP x and the outcome y are generated, then 4 linear regression models are fit: (1) a dominant model for the SNP x, (2) a recessive model for the SNP x, (3) an additive model for the SNP x, and (4) a co-dominant for the SNP x. Then, the proportion of simulations the null hypothesis is rejected is outputted for all for models (i.e. the proportion of simulations the null hypothesis is rejected at the specified alpha level).
}
\author{
Sharon Lutz
}
\examples{
snpDRAC(n=1000,MAF=0.3,mu0=0.6,mu1=0.7,mu2=0.8)
}
\keyword{snpDRAC}
