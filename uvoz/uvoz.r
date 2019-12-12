# 2. faza: Uvoz podatkov

link <- "https://stats.nba.com/stats/leaguedashplayerstats?College=&Conference=&Country=&DateFrom=&DateTo=&Division=&DraftPick=&DraftYear=&GameScope=&GameSegment=&Height=&LastNGames=0&LeagueID=00&Location=&MeasureType=Base&Month=0&OpponentTeamID=0&Outcome=&PORound=0&PaceAdjust=N&PerMode=Totals&Period=0&PlayerExperience=&PlayerPosition=&PlusMinus=N&Rank=N&Season=2017-18&SeasonSegment=&SeasonType=Regular+Season&ShotClockRange=&StarterBench=&TeamID=0&TwoWay=0&VsConference=&VsDivision=&Weight="
data <- GET(link) %>% content()
tabela <- lapply(1:65, . %>% { sapply(data$resultSets[[1]]$rowSet, function(x) x[.]) } %>% unlist()) %>% data.frame()
names(tabela) <- data$resultSets[[1]]$headers %>% unlist()
