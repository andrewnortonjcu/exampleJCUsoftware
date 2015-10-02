# R Basics 
# Author: Andrew N 
# Date: 2/10/15
# Version: 0.01
#
#
#testing version control feature
#
#!/usr/bin/env/ Rscript


# check if installed with  conditional calling
library(ggplot2)
#assume u have  data/gapminder.Rdata  add a condition later or read from csv

load("data/gapminder.RData")

draw_dots_continent <- function(df){
  #plot the continets multi
  p <- ggplot(data=df,aes(x=year,y=lifeExp, color=country))+
       geom_point(aes(color=continent))+
       ggtitle("life exp by Year") +
       facet_grid(.~continent)
  print(p)
}
  
  #create function to create apng plot
make_pngplot <- function(name){
  
  png(file=paste(name,".png",sep=""))
  draw_dots_continent(gapminder)
  dev.off()
  
}


arg <-commandArgs(TRUE)
try(make_pngplot(arg[1]))
