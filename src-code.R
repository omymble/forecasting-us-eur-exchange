library(readxl)
library(lmtest) 
library(forecast)
library(DIMORA)
library(fpp2)
library(ggplot2)
library(plotly)

folder_path = "~/Desktop/unipd/time-series/project/data/"

shares_file <- paste0(folder_path, "us-total-share-prices.csv")
m2_file <- paste0(folder_path, "us-M2.csv")
usir_file <- paste0(folder_path, "us-interest-rate.csv")
euir_file <- paste0(folder_path, "eu-interest-rate.csv")
uscpi_file <- paste0(folder_path, "us-consumer-price-index.csv")
eucpi_file <- paste0(folder_path, "eu-consumer-price-index.csv")

shares<- read.csv(shares_file)
usm2 <- read.csv(m2_file)
usir <- read.csv(usir_file)
euir <- read.csv(euir_file)
uscpi <- read.csv(uscpi_file)
eucpi <- read.csv(eucpi_file)

shares$DATE <- as.Date(shares$DATE)

# plot(shares$DATE, shares$SPASTT01USM661N, xlab = "Time", ylab = "Price")
gg <- ggplot(shares, aes(x = DATE, y = SPASTT01USM661N))+
  geom_line(aes(group = 1), color = "blue", linewidth = 0.5) +
  geom_point() +
  labs(
    title = "Total Share Prices Change with Time",
    x = "Time",
    y = "Index 2015 = 100"
  ) +
  scale_x_date(date_labels = "%Y-%m", date_breaks = "1 year") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

plotly_gg <- ggplotly(gg)

plotly_gg



