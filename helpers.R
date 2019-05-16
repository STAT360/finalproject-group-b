# Note: percent map is designed to work with the counties data set
# It may not work correctly with other data sets if their row order does 
# not exactly match the order in which the maps package plots counties
percent_map <- function(var, color, legend.title, min = 1, max = 50) {

  # generate vector of fill colors for map
  shades <- colorRampPalette(c("white", color))(50)
  
  # constrain gradient to percents that occur between min and max
  var <- pmax(var, min)
  var <- pmin(var, max)
  fills <- shades[var]

  # plot choropleth map
  map("state", fill = TRUE, col = fills, 
    resolution = 0, lty = 0, projection = "polyconic", 
    myborder = 0, mar = c(0,0,0,0))
  
  # overlay state borders
  map("state", col = "white", fill = FALSE, add = TRUE,
    lty = 1, lwd = 1, projection = "polyconic", 
    myborder = 0, mar = c(0,0,0,0))
  
  # add a legend
  inc <- (max - min) / 5
   legend.text <- c(
    paste0(min, " - 10"),
    paste0(min + inc, " - 20"),
    paste0(min + 2 * inc, " - 30"),
    paste0(min + 3 * inc, " - 40"),
    paste0(max, " - 50"))
  
  legend("bottomleft", 
    legend = legend.text, 
    fill = shades[c(10,20,30,40,50)], 
    title = legend.title)
}