# Rt per visualizzazione con Datawrapper

link <- "https://raw.githubusercontent.com/opencovid-mr/stima_rt/main/output/Rt_sint/Rt_sint_Ita_updated_latest.csv"

data <- read.csv(link)
data <- data[, c("Data", "R.medio", "Consolidato")]
data$Data <- as.Date(data$Data)
data <- data[data$Data >= "2022-01-01",]

data <- reshape(data, idvar = "Data", timevar = "Consolidato", direction = "wide")
colnames(data) <- c("Data", "Consolidato", "Sottostima", "Forte sottostima")

write.csv(data, file = "Rt_sint_Ita_updated_latest.csv", row.names = F)
