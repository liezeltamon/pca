################################################################################
# Make plot of data point projection on PCs
################################################################################
wk_dir = "~/GitHub/PCA/data"
setwd(wk_dir)

load("./pc_mx.RData")

xlim <- c(-3,3)
ylim <- c(0,1)

pc_len <- ncol(pc_mx)
points_len <- nrow(pc_mx)
py <- rep(1, points_len)

pdf("./pc_plot.pdf", width=7, height=5)
par(mfrow=c(pc_len, 1))

# PC1 shows x-axis tick labels

par(xaxs="i", yaxs="i", mar=c(4,4,1,1))
plot(NA, xlim=xlim, ylim=ylim, axes=FALSE, ann=FALSE)
axis(side=1, lwd=3, col="black", cex.axis=2)
points(pc_mx[, 1], py, pch=16, xpd=NA, cex=3, 
       col=adjustcolor("darkred", alpha.f=0.35))

# No x-axis tick labels for rest of PCs

for(i in 2:pc_len){

  px <- pc_mx[, i]

  par(xaxs="i", yaxs="i", mar=c(4,4,1,1))
  plot(NA, xlim=xlim, ylim=ylim, axes=FALSE, ann=FALSE)
  axis(side=1, lwd=3, col="black", labels=FALSE)
  points(px, py, pch=16, xpd=NA, cex=2.5, 
         col=adjustcolor("darkred", alpha.f=0.35))

}

dev.off()