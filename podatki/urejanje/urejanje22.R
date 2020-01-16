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








