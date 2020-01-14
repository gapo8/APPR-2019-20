osebni_podatki_skupni <- rbind(osebni_podatki2009_2010, osebni_podatki2010_2011,
                               osebni_podatki2011_2012, osebni_podatki2012_2013,
                               osebni_podatki2013_2014, osebni_podatki2014_2015,
                               osebni_podatki2015_2016, osebni_podatki2016_2017,
                               osebni_podatki2017_2018, osebni_podatki2018_2019) %>% mutate(as.numeric(PTS))


osebni_podatki_skupni$PTS <- parse_double(osebni_podatki_skupni$PTS) ##spremeni caracter v double
osebni_podatki_skupni$REB <- parse_double(osebni_podatki_skupni$REB)


povprecje_osebni_podatki <- osebni_podatki_skupni %>% group_by(PLAYER, COUNTRY) %>% summarise(POVPRECJE = mean(PTS),)
  
