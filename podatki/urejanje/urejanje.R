statistika_skupna <- rbind(statistika2014_2015, statistika2015_2016, statistika2016_2017,
                           nova_statistika2017_2018, nova_statistika2018_2019) %>% mutate(as.numeric(PTS))
A <- statistika_skupna                      
A[2] <- NULL
A$DD2 <- NULL



povprecje_statistika <- statistika_skupna %>% group_by(PLAYER, ) %>% summarise(POVPRECJE = mean(PTS))

statistika_skupna$PTS <- parse_double(statistika_skupna$PTS) ##spremeni caracter v double
