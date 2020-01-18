library(tmap)
source("https://raw.githubusercontent.com/jaanos/APPR-2019-20/master/lib/uvozi.zemljevid.r")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/cultural/ne_50m_admin_0_countries.zip",
                        "ne_50m_admin_0_countries", encoding="UTF-8")

zemljevid_stevila_igralcev <- tm_shape(merge(svet, stevilo_igralcev, by.x="NAME_LONG", by.y="COUNTRY")) + tm_polygons("stevilo")


zemljevid_povprecja_tock <- tm_shape(merge(svet, povprecje_drzave, by.x="NAME_LONG", by.y="COUNTRY")) + tm_polygons("PTS")
