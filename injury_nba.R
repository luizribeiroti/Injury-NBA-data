library("dplyr")
install.packages("lubridate")
library(lubridate)

pop <- dados$Team
length(pop)

# Renaming the Relinquished column to injured
dados <- rename(dados, Injured = Relinquished)

# Renaming some columns
colnames(dados)[4] <- "Healthy"
colnames(dados)[1] <- "Index"

# Checking the data
summary(dados)

#Listing the teams from the data frame
equipes <- c("Bullets", "Knicks", "Lakers", "Zephyrs", "Pistons", "Bucks", "Colonels (ABA)", "Squires (ABA)", "Chaparrals (ABA)", "Cavaliers", "Tams (ABA)", "Kings", "Bulls", "Rockets", "Nets (ABA)", "Spirits (ABA)", "Hawks", "Stars (ABA)", "Celtics", "Braves", "76ers", "Jazz", "Nuggets (ABA)", "Sonics", "Warriors", "Suns", "Nets", "Spurs", "Blazers", "Clippers", "Cavailers", "Nuggets", "Pacers", "Mavericks", "Hornets", "Heat", "Timberwolves", "Magic", "Raptors", "Grizzlies", "Wizards", "Bobcats", "Thunder", "Pelicans")

#Creating an empty list to fill the numbers of injured players for each team
lista_num_lesionados <- list()

#Creating a loop to filter how many player we have for each team
for (equipe in equipes) {
  injured2 <- filter(dados, dados$Team == equipe & dados$Healthy == "")
  num_lesionados <- nrow(injured2)
  lista_num_lesionados[[equipe]] <- num_lesionados
}

#Showing the number of each player for each teamhttp://127.0.0.1:37881/graphics/plot_zoom_png?width=1920&height=1017
for (equipe in equipes) {
  print(paste("Equipe:", equipe, "- Número de jogadores lesionados:", lista_num_lesionados[[equipe]]))
}

#Createing "num_lesionados" that will fill the numbers of the injured players
num_lesionados <- unlist(lista_num_lesionados)

#Createing "nomes_equipes" that will show the team names
nomes_equipes <- names(lista_num_lesionados)

#Ploting a graph
barplot(num_lesionados, names.arg = nomes_equipes, xlab = "Equipes", ylab = "Número de Jogadores Lesionados", main = "Número de Jogadores Lesionados por Equipe", cex.names = 0.4)

#This way we can check all injurys of any player on the dataset
dados %>%
  filter(dados$Injured %in% c(" DeMar DeRozan"))
