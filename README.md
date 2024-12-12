# Logistic growth - Reproducible research assignment

## Question 1

This analysis involved modelling population growth of E. coli to estimate the initial population size of the bacteria, the growth rate, and the carrying capacity using experimental data. Three scripts were used to plot the data, fit linear models, and assess the fit of the model to the data graphically. The data used throughout this analysis is ‘experiment.csv’ which can be found [here](https://osf.io/vk3zn). 

This analysis uses the logistic growth model. Logistic growth can be described using this equation where $`N_0`$ is initial population size, $`r`$ is growth rate, $`K`$ is carrying capacity, and $`t`$  is time:
```math
\begin{equation}
N(t) = \frac{K N_0 e^{rt}}{K-N_0+N_0 e^{rt}}
\end{equation}
```
### plot_data.R
Started the analysis by plotting the data using the ‘ggplot2’ package. First, the data was plotted with $`N_0`$ (number of cells) on the y-axis and time on the x-axis. This plotted a graph that showed a population that appears to grow exponentially but then slows down once it reaches equilibrium. 
