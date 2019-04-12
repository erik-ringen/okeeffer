#' plot_pal
#'
#' This function plots the colors from a ok palette, and displays the source painting.
#' @param pal palette to display; can be the name or an integer between 1 and 10.
#' @export
#' @examples
#' plot_pal(pal_1)

plot_pal <- function( pal ) {

par(mar=c(1,1,1,1))
plot(NULL, xlim=c(0,10), ylim=c(0,12), axes=F, xlab="", ylab="")

# Users can call the palettes directly, or use just the number
if (is.numeric(pal)==T) pal2 <- eval(as.name(paste0("pal_",pal)))
else pal2 <- pal

# Plot colors as rectangles
for (c in 1:5) {
  rect(2*(c-1), 0.5, 2*(c-1)+2, 3, col=pal2[c], border=pal2[c])
  text(x=2*(c-1) + 1, y=0, labels=pal2[c])
}
# plot hex names
text(x=5, y=3.5, labels=comment(pal2)[2])
# read image file
image <- jpeg::readJPEG(paste0(comment(pal2)[1], ".jpg"))
dims <- dim(image)
ratio <- dims[1]/dims[2]
# scaling image based on dims
rasterImage(image,0,5,7,5 + 7*ratio)
}
