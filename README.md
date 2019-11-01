# snpDRAC
Determines the power to detect a genetic association for dominant, recessive, additive, and co-dominant models

# Generative a SNP under the additive model
snpDRAC(n=1000,MAF=0.3,mu0=0.6,mu1=0.7,mu2=0.8)
#     dominant recessive additive codominant
#[1,]    0.456     0.282    0.534      0.424

# Generative a SNP under the dominant model
snpDRAC(n=1000,MAF=0.3,mu0=0.7,mu1=0.8,mu2=0.8)
#     dominant recessive additive codominant
#[1,]    0.339     0.076      0.3      0.259

# Generative a SNP under the recessive model
snpDRAC(n=1000,MAF=0.3,mu0=0.7,mu1=0.7,mu2=0.8)
#     dominant recessive additive codominant
#[1,]    0.054     0.143    0.086      0.111

# Generative a SNP under the co-dominant model
snpDRAC(n=1000,MAF=0.3,mu0=0.5,mu1=0.7,mu2=0.8)
#     dominant recessive additive codominant
#[1,]     0.92     0.472    0.925       0.88
