library(ggplot2)

p <- read.csv("Indicators_of_Anxiety_or_Depression_Based_on_Reported_Frequency_of_Symptoms_During_Last_7_Days.csv")

phaseone <- p[p$Phase == '1',]

phasetwo <- p[p$Phase == '2',]

phasethree <- p[p$Phase == '3 (Jan 6 � Mar 29)',]

four <- p[p$Phase == '3.1',]
  
five <- p[p$Phase == '3.2',]
  
six <- p[p$Phase == '3.3',]


phaseonemean <- mean(phaseone$Value)
phasetwomean <- mean(phasetwo$Value)
phasethreemean <- mean(phasethree$Value)
fourmean <- mean(four$Value)
fivemean <- mean(five$Value)
sixmean <- mean(six$Value)

c1 <- c(phaseonemean, phasetwomean, phasethreemean, fourmean, fivemean, sixmean)
c2 <- c("Phase 1", "Phase 2", "Phase 3", "Phase 4", "Phase 5", "Phase 6")
c3 <- c("July 9 - July 14, 2020","Sep 30 - Oct 12, 2020","Mar 3 - Mar 15, 2021",
        "Apr 28 - May 10, 2021", "Aug 4 - Aug 16, 2021", "Dec 1 - Dec 13, 2021")

means <- data.frame(c1, c2, c3)
write.csv(means, "phases/phasedata.csv", row.names = FALSE)
