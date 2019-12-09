# Madeline Hightower
# Exercise 10 Script

# Tumor cell with spontaneous mutation that confers drug resistance
# No positive or negative effects on growth rate of sub-population
# When drug is absent
# When Drug is present, mutant grows at 50% of growth rate
# Non-mutant declines rapidly

# Use model for Sub Populations
  # Nt=Nt+(rN*Nt)*(1-(Nt+Mt)/K) # for non-mutant population
  # Mt=Mt+(rM*Mt)*(1-(Nt+Mt)/K) # for mutant population
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
timesteps=200
N0=99 # Given that the mutation occurred when there were 100 cells
M0=1 # and only one was a mutant

# Drug absence (A)
rNA=0.1 # Growth rate for both populations is 0.1 in absence of drug
rMA=0.1

# Drug presence (P)
rNP=-0.1 # Non-mutants (N) grow at -0.1 when drug is present
rMP=0.05 # Mutants (M) grow at 50% of growth rate for when drug is not present

# Create vector to store N's and set initial N
# Set initial value
Ns=numeric(length=timesteps)
Ns[1]=N0
Ms=numeric(length=timesteps)
Ms[1]=M0

# Simulate
# When drug is not present
for(t in 1:100){
  Ns[t+1]=Ns[t]+(rNA*Ns[t])*((1-(Ns[t]+Ms[t]))/K)
  Ms[t+1]=Ms[t]+(rMA*Ms[t])*((1-(Ns[t]+Ms[t]))/K) 
}
# When drug is present
for(t in 1:100){
  Ns[t+1]=N[t]+(rN*N[t])*(1-(N[t]+M[t])/K)
  Ms[t+1]=M[t]+(rM*M[t])*(1-(N[t]+M[t])/K) 
}

# Put simulation into a dataframe
library(ggplot2)
healthy<-data.frame(time=1:timesteps,N=Ns)
tumor<-data.frame(time=1:timesteps,M=Ms)