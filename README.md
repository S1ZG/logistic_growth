# Logistic growth - Reproducible research assignment

## Question 1

This analysis involved modelling population growth of E. coli to estimate the initial population size of the bacteria, the growth rate, and the carrying capacity using experimental data. Three scripts were used to plot the data, fit linear models, and assess the fit of the model to the data graphically. The data used throughout this analysis is ‘experiment.csv’ which can be found [here](https://osf.io/vk3zn). 

This analysis uses the logistic growth model. Logistic growth can be described using this equation where $`N_0`$ is initial population size, $`r`$ is growth rate, $`K`$ is carrying capacity, and $`t`$  is time:
```math
\begin{equation}
N(t) = \frac{K N_0 e^{rt}}{K-N_0+N_0 e^{rt}}
\end{equation}
```

&nbsp;
## plot_data.R
Started the analysis by plotting the data using the ‘ggplot2’ package. First, the data was plotted with $`N_0`$ (number of cells) on the y-axis and time on the x-axis. This plotted a graph that showed a population that appears to grow exponentially but then slows down once it reaches equilibrium. 

<p align="center">
<img src="https://github.com/S1ZG/logistic_growth/blob/main/Q1_plot_1.png" width="754.6" height="709.8">
</p>
Next, the data was plotted as a semilog-plot with the x-axis remaining linear as time, but the y-axis log-transformed, Log10(N). This is a graphical representation of the logistic model, where we initially observe an increasing linear relationship at the start, then a plateau where population size remains constant. 
<p align="center">
<img src="https://github.com/S1ZG/logistic_growth/blob/main/Q1_plot_2.png" width="754.6" height="709.8">
</p>

## fit_linear_model.R
I then fit the linear models. Used the ‘dyplr’ package. Based on the observation that when $`K`$ ≫ $`N_0`$ and $`t`$ is small, there is exponential population growth, we can approximate how the population would have behaved at the start time, $N(t) = N_0 e^{rt}$. We also observe that when t tends to infinity, the population size is equal to the carrying capacity which is a constant. 
```math
\begin{equation}
\lim\limits_{t \to \infty} N(t) = K
\end{equation}
```
These observations are then used with a linear approximation to estimate the values of the model parameters $`N_0`$, $`r`$, and $`K`$ from the data set. The linear approximation when $`K`$ ≫ $`N_0`$ and $`t`$ is small gives us the regression equation $`ln(N) = ln(N_0)+ rt`$, while when $`t`$ tends to infinity we can use $`N(t) = K + 0 ⋅ t`$. For model 1, when $`K ≫ N_0`$ and $`t`$ is small I set $`t`$ < 1500 as until this point it is a linear shape showing population growth rate in the semilog-plot. For model 2, when $`t`$ tends to infinity, I set $`t`$ > 2100 as after this point carrying capacity has been reached.
</p>


### Results
Estimates:

$`N_0`$ = 986.507

- Using model 1, found the y-intercept of the initial line, which is the log of the estimate at *t*=0, which would be the population size at the start so is $`ln(N_0)`$. So, $`N_0 = e^{6.8941709} = 986.507`$

$`r`$ = 0.0100086

- Using model 1, we get the coefficient estimate for t of 0.0100086 which is the estimated slope of the initial line, and therefore is the growth rate.

$`K`$ = 5.993e+10

- Using model 2, finding the intercept of the line gives us the carrying capacity as it is when the population has plateaued after population growth.
</p>

### plot_data_and_model.R
Then assessed the fit of the model to the data graphically. Used the parameter estimates from the linear approximations to plot a logistic growth model which is the red curve. Assessed the fit of this to the growth data from ‘experiment.csv’ which is plotted in black dots. Can see that there is a very close fit between the model and the observed data, suggesting the parameter estimates are appropriate to use to describe this population of *E. coli*. 




