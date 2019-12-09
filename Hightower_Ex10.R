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
timesteps=100
N0=100 # Given that the mutation occurred when there were 100 cells

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

# Simulate

