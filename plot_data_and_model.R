#Script to plot data and model

growth_data <- read.csv("experiment.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- exp(6.8941709) #log transformed initial population size

r <- 0.0100086 #log transformed growth rate

K <- 5.993e+10 #log transformed carrying capacity

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() +
  
  scale_y_continuous(trans='log10')


