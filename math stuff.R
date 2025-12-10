#8. Code up a small simulation to verify that this process indeed follows the 
#hypergeometric distribution.
#a. First, create an urn with 10 white balls and 5 black balls in it, 
#and generate 1000 iterations of 3 draws
#from this urn, without replacement. 
#Save the number of white balls drawn in each iteration into a vector

#urn2<- list("white":10, "black":5")
#sample (urn2, 3, replace = FALSE)
set.seed(123)
n.sims<- 1000


urn<-c( rep("white", 10),
       rep("black", 5))
       
white_balls <-rep(NA, 1000)  

for (i in 1:1000){
  draw<- sample(urn, 3, replace=FALSE)
    white_balls[i]<- sum(draw == "white")
    print(white_balls[i])
  }
max(white_balls)
min(white_balls)
print(summary(white_balls))

#b. Now, use the rhyper function in R to do the same thing. Summarize the two distributions you’ve made
#and compare them.

y_rhyper<- rhyper(1000, m=10, n=5, k=3)

summary(y_rhyper)

toplot<- data.frame(x=white_balls, y=y_rhyper)

ggplot(toplot) +
  geom_histogram(aes(x=y_rhyper), color="gray25", fill="gray25", alpha=0.5)+
  geom_histogram(aes(x=white_balls), color="blue", fill="blue", alpha=0.25)+
  xlab("Numberofwhiteballs")+
  ylab("frequency")
#+ matters!!!
#+ 
#d. Perform a Kolmogorov-Smirnov test to see if the two distributions are the same.

ks.test(white_balls, y_rhyper)
#I did this wrong :

#Disease Testing Simulation
#First, create a vector called flu that determines whether every member of 
#a population of size 100,000 is healthy or sick. 
#Let the probability of being sick be 1%.
flu<- sample(c("Sick", "Healthy"),
             size = 100000,
             replace = TRUE,
             prob= c(0.01, 0.99))
#Now, create a vector called test that determines whether the person tested positive. 

df <- data.frame(flu=flu)
df$test<- NA

#specificity probability of a negative test for an individual is healthy, reflects
#sensitivity porbability that the test is positive for the population of sick individuals
#both 0.95
#sensitivity & specificity
df$test[df$flu=="Sick"] <-sample(c("Positive", "Negative"),
                                size = sum(df$flu=="Sick"),
                                replace = TRUE,
                                prob = c(0.95, 0.05))
                                
df$test[df$flu=="Healthy"] <-sample(c("Positive", "Negative"),
                                size = sum(df$flu=="Healthy"),
                                replace = TRUE,
                                prob = c(0.05, 0.95))
df$accurate <- FALSE
df$accurate[df$flu=="Sick" &df$test=="Positive"] <- TRUE
df$accurate[df$flu=="Healthy" &df$test=="Negative"] <- TRUE
head(df)
 
             



