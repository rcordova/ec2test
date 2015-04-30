#devtools::install_github('ramnathv/htmlwidgets')
#devtools::install_github("rstudio/DT")

#mydata
fieldbooks <- ec2test::list.dirs("./data/potato")
data <- c()
for(i in 1:length(fieldbooks)) {
  if (fieldbooks[i] != "backups"){
    data <- c(data, "Potato", fieldbooks[i], "<img src = '/check.png'/>", "<img src = '/check.png'/>")
  }
}
  
#ec2test::ui_compress.dirs("./data/potato/TEST1", "TEST1", "./data/potato")
#fieldbooks <- matrix(c(1,2,3,4))
mydata <-  t(matrix(data, 4))
colnames(mydata) <- c('<b>Crop</b>', '<b>Fieldbook</b>', '<b>Compress</b>', '<b>Send</b>')

#ui
shinyUI(fluidPage(
  img(src = '/cip_banner.png', align = "center"),
  #hr(),
  fluidRow(
    column(
    12,
    hr(),
    br(),
    h2("Fieldbooks status"),
    datatable(mydata, escape = FALSE)
  ))
)
)