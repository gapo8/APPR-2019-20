osebni_podatki_skupni <- rbind(osebni_podatki2009_2010, osebni_podatki2010_2011,
                               osebni_podatki2011_2012, osebni_podatki2012_2013,
                               osebni_podatki2013_2014, osebni_podatki2014_2015,
                               osebni_podatki2015_2016, osebni_podatki2016_2017,
                               osebni_podatki2017_2018, osebni_podatki2018_2019,
                               osebni_podatki2000_2001, osebni_podatki2001_2002,
                               osebni_podatki2002_2003, osebni_podatki2003_2004,
                               osebni_podatki2004_2005, osebni_podatki2005_2006,
                               osebni_podatki2006_2007, osebni_podatki2007_2008) 


osebni_podatki_skupni$PTS <- parse_double(osebni_podatki_skupni$PTS) ##spremeni caracter v double
osebni_podatki_skupni$REB <- parse_double(osebni_podatki_skupni$REB)
osebni_podatki_skupni$AST <- parse_double(osebni_podatki_skupni$AST)



povprecje_osebni_podatki <- osebni_podatki_skupni %>% group_by(PLAYER, COUNTRY) %>% summarise(PTS = mean(PTS), REB = mean(REB), AST = mean(AST))

povprecje_drzave <- osebni_podatki_skupni %>% group_by(COUNTRY) %>% summarise(PTS = mean(PTS), REB = mean(REB), AST = mean(AST))


stevilo_igralcev <- povprecje_osebni_podatki %>% group_by(COUNTRY) %>% summarise(stevilo = n())

povprecje_drzave$COUNTRY[povprecje_drzave$COUNTRY == 'USA'] <- 'United States'
povprecje_drzave$COUNTRY[povprecje_drzave$COUNTRY == 'Russia'] <- 'Russian Federation'
stevilo_igralcev$COUNTRY[stevilo_igralcev$COUNTRY == 'USA'] <- 'United States'
stevilo_igralcev$COUNTRY[stevilo_igralcev$COUNTRY == 'Russia'] <- 'Russian Federation'
stevilo_igralcev$COUNTRY[stevilo_igralcev$COUNTRY == 'South Korea'] <- 'Republic of Korea'

vsi_igralci <- sum(stevilo_igralcev$stevilo)
igralci_amerika <- unlist(stevilo_igralcev[69, 2])
igralci_ostali <- vsi_igralci - igralci_amerika

stevilo <- c(vsi_igralci, igralci_amerika, igralci_ostali)
ime <- c('vsi igralci', 'igralci amerika', 'igralci ostali')
vsi_amerika_svet <- data.frame(stevilo, row.names = ime)
amerika_svet <- data.frame(stevilo[-1], row.names = ime[-1])


stevilo_igralcev_brez_amerike_in_NA <- stevilo_igralcev[-c(69, 73),]
top10_drzav_igralci <- stevilo_igralcev_brez_amerike_in_NA %>% top_n(stevilo, n = 10)

top10_drzav_tocke <- povprecje_drzave %>% top_n(PTS, n =10)


