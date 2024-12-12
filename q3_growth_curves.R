#Plotting a graph comparing exponential and logistic growth curves

library(ggplot2)

growth_data <- read.csv("experiment.csv")

#Previously estimated parameters
N0 <- 986.507
r <- 0.0100086
K <- 5.993e+10

#Logistic growth function
logistic_fun <- function(t) {
  N <- (N0 * K * exp(r * t)) / (K - N0 + N0 * exp(r * t))
  return(N)
}

#Exponential growth function
exponential_fun <- function(t) {
  N <- N0 * exp(r * t)
  return(N)
}


#Creating the plot
ggplot(data = growth_data, aes(x = t)) +
  #Log transform the y-axis
  scale_y_continuous(trans = 'log10') +
  #The logistic growth curve
  geom_function(fun = logistic_fun, colour = "red", size = 1.3) +
  #The exponential growth curve
  geom_function(fun = exponential_fun, colour = "blue", size = 1) +
  #Axis labels and title
  labs(x = "Time (t)", y = "Population (LogN)", 
       title = "Comparison of Exponential and Logistic Growth Curves") +
  #Add legend manually using colors
  theme(legend.position = "none") + #removing default legend
  annotate("text", x = 2300, y = 1e+10, label = "Logistic", color = "red", size = 4.5, hjust = 0) +
  annotate("text", x = 1400, y = 1e+15, label = "Exponential", color = "blue", size = 4.5, hjust = 0)
