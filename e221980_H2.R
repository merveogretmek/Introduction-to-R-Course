library(dplyr)
library(ggplot2)
library(WDI)
library(data.table)


# The data used
df <- as.data.table(WDI( country = c("TR", "CN", "KR", "DE", "US"),
                         indicator = c("FP.CPI.TOTL.ZG", "NY.GDP.PCAP.KD.ZG","BN.CAB.XOKA.GD.ZS"),
                         start = 1990,
                         end = 2020,
                         extra = FALSE,
                         cache = NULL,
                         latest = NULL,
                         language = "en"))

# Naming columns
names(df)[4] <- "CPI"
names(df)[5] <- "GDP"
names(df)[6] <- "CAB"


# Custom ggplot theme: themerve
themerve <- function (base_size = 11, base_family = "", base_line_size = base_size/22, 
               base_rect_size = base_size/22) 
           {
               theme_gray(base_size = base_size, base_family = base_family, 
                 base_line_size = base_line_size, base_rect_size = base_rect_size) %+replace% 
                   theme(
                     # Background color of the plot
                     panel.background = element_rect(fill = "snow"), 
                     
                     # Borders of the chart
                     panel.border = element_rect(colour = "slateblue4", fill = NA, linetype = 1),
                     
                     # Vertical strips in the chart
                     panel.grid.major.y =  element_line(colour = "purple", linetype = 3, size = 0.5),
                     
                     # Horizontal strips in the chart
                     panel.grid.major.x = element_line(colour = "purple", linetype = 3, size = 0.5),
                      
                     # Legend area   
                     legend.key = element_rect(fill = "snow", colour = NA), 
                     
                     # Legend text
                     legend.text = element_text(colour = "slateblue4", family = "Palatino"),
                     
                     # Legend title
                     legend.title = element_text(colour = "slateblue4", family = "Palatino"),
                     
                     # Axis values
                     axis.text = element_text(colour = "slateblue4", family = "Palatino", size = 7.5),
                     
                     # Axis titles
                     axis.title = element_text(colour = "slateblue4", family = "Palatino", size = 9),
                     
                     # Plot
                     plot.title = element_text(colour = "slateblue4", family = "Palatino",face = 'bold'),
                     
                     # Plot caption
                     plot.caption = element_text(colour = "slateblue4", family = "Palatino", face = 'italic'),
                         complete = TRUE)
  
  
  
         }


# Line plot
line <- ggplot(data = df, aes(x = year, y = CPI, group = country, color = country)) +
  geom_line()+
  geom_point() + labs(title = "CPI between 1980 and 2020", caption = "Source: WDI") + themerve()

line

# Scatter plot
scatter <- ggplot(data = df, aes(x = GDP, y = CAB, color= country)) + geom_point() +  labs(title="CPI and GDP Growth between 1990-2020",
x="GDP Growth", y = "Consumer Price Index", caption = "Source: WDI") + themerve() 

scatter

# Bar plot
bar <- ggplot(data = df, aes(x = country, y = CPI, fill=country)) + geom_bar(stat="identity", width = 0.8) + coord_flip() + scale_fill_brewer(palette = "Pastel2") + labs(title = "CPI between 1980 and 2020", caption = "Source: WDI") + themerve()

bar
