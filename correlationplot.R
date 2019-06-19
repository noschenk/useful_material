
# CORRELATION
# spearman or pearson. pearson : linear, spearman : rank-based --> can be nonlinear
M <- Hmisc::rcorr(as.matrix(nce[, !"Plotn", with=F]), type = "spearman")
mr <- M$r # the correlations themseles
mp <- M$P # the p values

# nice plot, optimal if names are long
corrplot::corrplot(mr,type="lower",addCoef.col = "black",method="color",diag=F, tl.srt=1, tl.col="black", mar=c(0,0,0,0), number.cex=0.6, order = "hclust")


# NETWORK PLOT
mat[mat < 0.5 & mat > -0.5] <- 0

network <- igraph::graph_from_adjacency_matrix(mat, weighted=T, mode="undirected", diag=F)
plot(network)

# QUICK ALTERNATIVE
# nice to get an overview quickly
# http://www.sthda.com/english/wiki/correlation-matrix-a-quick-start-guide-to-analyze-format-and-visualize-a-correlation-matrix-using-r-software#correlation-matrix-with-significance-levels-p-value
library("PerformanceAnalytics")
my_data <- mtcars[, c(1,3,4,5,6,7)]
chart.Correlation(my_data, histogram=TRUE, pch=19)
