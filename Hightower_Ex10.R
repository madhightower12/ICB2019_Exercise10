# Madeline Hightower
# Exercise 10 Script

# Tumor cell with spontaneous mutation that confers drug resistance
# No positive or negative effects on growth rate of sub-population
# When drug is absent
# When Drug is present, mutant grows at 50% of growth rate
# Non-mutant declines rapidly

# Use model for Sub Populations
  # Nt+1=Nt+((rN*Nt)*((1-(Nt+Mt)/K)) # for non-mutant population
  # Mt+1=Mt+(rM*Mt)*(1-(Nt+Mt)/K) # for mutant population
# Parameters
  # Growth rate in absence is 0.1 (rN=rM=0.1)
  # Carrying capacity (K) is one million cells
  # Mutation occurred when 100 cells were present
  # Non-mutant cells grow at rN=-0.1 when drug is present

# Generate a script that simulates growth of two sub-populations in tumor
# To equilibrium following drug treatment
# Plot with line graph

# Set Parameters
K=1000000
timesteps=300
N0=99 # Given that the mutation occurred when there were 100 cells
M0=1 # and only one was a mutant

# Drug absence (A)
r=0.1 # Growth rate for both populations is 0.1 in absence of drug

# Drug presence (P)
A=-0.1 # Non-mutants grow at -0.1 when drug is present
B=0.5 # Mutants grow at 50% of growth rate for when drug is not present

# Create vector to store N's and set initial N
# Set initial value
Ns=numeric(length=timesteps)
Ns[1]=N0
Ms=numeric(length=timesteps)
Ms[1]=M0

# Simulate
# Mutant Population
for(t in 1:(timesteps-1)){
  if(t<150){
    Ms[t+1]<-Ms[t]+r*Ms[t]*(1-(Ns[t]+Ms[t])/K)
  }else if(t>150){
    Ms[t+1]<-Ms[t]+B*Ms[t]*(1-(Ns[t]+Ms[t])/K)
  }
}
#150 chosen as the cutoff after plotting growth in drug absence
# And seeing approx where slope levels off to 0
# Non-Mutant Population
for(t in 1:(timesteps-1)){
  if(t<150){
    Ns[t+1]<-Ns[t]+r*Ns[t]*(1-(Ns[t]+Ms[t])/K)
  }else if(t>150){
    Ns[t+1]<-Ns[t]+A*Ns[t]*(1-(Ns[t]+Ms[t])/K)
  }
}
# Put simulation into a dataframe
healthy<-data.frame(time=1:timesteps,N=Ns)
tumor<-data.frame(time=1:timesteps,M=Ms)
# Plot data
library(ggplot2)
nonMutant<-ggplot(data=healthy,aes(x=time,y=N))+geom_line(col="green")
mutant<-ggplot(data=cancer,aes(x=time,y=M))+geom_line(col="red")