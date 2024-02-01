install.packages("igraph")
install.packages("tidyverse")
install.packages("data.table")
install.packages("ggthemes")
install.packages('R.utils')

library(igraph)
library(tidyverse)
library(data.table)
library(ggthemes)

setwd("C:/Users/yabec/Desktop/dependencynet/githubcode/")

city_name = 'boston'

net_summ <- fread(paste0("./", "networkvizinput.csv"))

#real
#only big wij and only top dependences
net_real <- net_summ %>% 
  filter(cat_a!=cat_b) %>% 
  filter(dep_avg > 0.1 & dep_count > 100) %>% 
  group_by(cat_a) %>% top_n(dep_avg,n=3) %>%
  ungroup()
g <- graph.data.frame(net_real)
gg <- igraph::simplify(g,remove.multiple = F)
gg

bb <- unique(net_summ %>% ungroup() %>% select(cat_a,Taxonomy_a))
V(gg)$tax <- bb$Taxonomy_a[match(V(gg)$name,bb$cat_a)]
uu <- unique(V(gg)$tax)
cols <- tableau_color_pal(palette="Tableau 20")(length(uu))
V(gg)$color <- cols[match(V(gg)$tax,uu)]
V(gg)$size <- sqrt(10*degree(gg,mode="in"))+3

layout <- layout_with_kk(gg)

plot(gg,edge.width=E(gg)$dep_avg*1,vertex.label="",edge.arrow.size=.4,
     layout=layout,
     vertex.size=sqrt(10*degree(gg,mode="in"))+3,
     vertex.frame.color=V(gg)$color, edge.color = rgb(0.9, 0.9, 0.9))

dpi <- 300
width_inch <- 6  # Adjust as needed
height_inch <- 7  # Adjust as needed
width_px <- width_inch * dpi
height_px <- height_inch * dpi

#con labels
png(paste0("plot_real_labels_", city_name, "_v2.png"), width = width_px, height = height_px, res = dpi)
plot(gg,edge.width=E(gg)$dep_avg*1,vertex.label=V(gg)$name,edge.arrow.size=.4,
     layout=layout,
     vertex.size=sqrt(10*degree(gg,mode="in"))+3,
     vertex.frame.color=V(gg)$color,
     vertex.label.family="sans",vertex.label.cex=0.2, edge.color = rgb(0.9, 0.9, 0.9))
dev.off()

