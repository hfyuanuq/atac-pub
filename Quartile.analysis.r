### this script is created by Huifang Yuan
### used for quartile analysis 
### also includes scatterplot

library(ggplot2)
library(hrbrthemes)
library(geomtextpath)
library(dplyr)


a<- read.csv("02.comp_down.Motifs.4satistics.csv", header = TRUE)
dim(a)
head(a)

## the summary of motif frequency and lod(odds)score
summary(a$f3)
summary(a$log.odd.score)


## plot 
ggplot(a, aes(x=f3, y=log.odd.score, alpha=stage)) + 
  geom_point(size=2, color="#638AC0") +
  geom_rug(col="grey",alpha=0.1, size=1.5)+
  theme_bw()



# top quartile
F3_quantile <- quantile(a$f3, probs = 0.75)
log_odd_quantile <- quantile(a$log.odd.score, probs = 0.75)

top_25_F3 <- a[a$f3 > F3_quantile, ]

top_25_log_odd <- a[a$log.odd.score > log_odd_quantile, ]

dim(top_25_F3)
dim(top_25_log_odd)


#combine 
combined_data <- merge(top_25_F3, top_25_log_odd, by = "motifss")


# results
head(combined_data)
dim(combined_data)
write.csv(combined_data, file="04.Q3.comp_down.motifs.csv" )

ggplot(combined_data, aes(x=f3.x, y=log.odd.score.x, alpha=stage.x)) + 
  geom_point(size=2, color="#638AC0") +
  geom_rug(col="grey",alpha=0.5, size=1.5)+
  theme_bw()


