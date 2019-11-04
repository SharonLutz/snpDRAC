snpDRAC <-
function(n=1000,MAF=0.3,mu0=0.6,mu1=0.8,mu2=1.0,varY=1,nSim=1000,alpha=0.05,SEED=1){
    ###################################
    #Input
    ###################################
    # n is the sample size
    # MAF is the minor allele frequency for the SNP X
    # mu0,mu1,mu2 are the means of Y given the SNP X=0,1,2
    # varY is the variance of Y
    # nSim is the number of simulations
    # alpha is the significance level, 0.05
    # set seed for reproducibility
    
    ################################### 
   # Error checks
   ###################################     
  if((MAF<0|MAF>1)|(MAF==0|MAF==1)){stop("MAF1 must be between 0 and 1")}
  if(!(n>0)){stop("n must be positive")}
  if(floor(n)!=ceiling(n)){stop("n must be an integer")}
  if((alpha<0|alpha>1)|(alpha==0|alpha==1)){stop("alpha must be between 0 and 1")}
  if(!(varY>0)){stop("varY must be greater than 0")}
  
   ################################### 
   # Set the seed for reproducibility
   ###################################
    set.seed(SEED)
    
    ###################################
    #matrix to store results
    ###################################
    matR<-matrix(0,ncol=4,nrow=1)
    colnames(matR)<-c("dominant","recessive","additive","codominant")
    
    ###################################
    #run through each iteration of the nSim simulations
    ###################################
    for(ss in 1:nSim){
    	if(floor(ss/500)==ceiling(ss/500)){print(paste("Simulation",ss,"of",nSim))}
    	
    	#generate the SNP X
    	x<-rbinom(n,2,MAF) 
    	
    	#genrate the outcome y
    	y<-rep(NA, n) 
    	y[x==0]<-rnorm(length(y[x==0]),mean=mu0,sd=sqrt(varY))
    	y[x==1]<-rnorm(length(y[x==1]),mean=mu1,sd=sqrt(varY))
    	y[x==2]<-rnorm(length(y[x==2]),mean=mu2,sd=sqrt(varY))
    	
    #dominant model for SNP
    xd<-rep(0, n) 
    xd[x==2|x==1]<-1
    # fit linear regression for dominant model
    modelD<-summary(lm(y~xd))$coef
    if(	modelD[2,4]<alpha){matR[1,"dominant"]<-matR[1,"dominant"]+1}
    	
    	#recessive model for SNP
    	xr<-rep(0, n) 
    	xr[x==2]<-1
    	# fit linear regression for recessive model
    modelR<-summary(lm(y~xr))$coef
    if(	modelR[2,4]<alpha){matR[1,"recessive"]<-matR[1,"recessive"]+1}
    
    #additive model for SNP
    xa<-x
    # fit linear regression for additive model
    modelA<-summary(lm(y~xa))$coef
    if(	modelA[2,4]<alpha){matR[1,"additive"]<-matR[1,"additive"]+1}
    
    #categorical model for SNP
    x1<-rep(0, n) 
    x1[x==1]<-1
    x2<-rep(0, n)
    x2[x==2]<-1
    # fit linear regression for categorical model (F-test)
    modelC<-summary(lm(y~x1+x2))$fstatistic #over all F test
    modelCp<-df(modelC[1],modelC[2],modelC[3]) #p value for overall F test
    if(	modelCp <alpha){matR[1,"codominant"]<-matR[1,"codominant"]+1}
    			    	
    }#end of simulation loop
    list(matR/nSim)
    }
