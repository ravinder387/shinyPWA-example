# activate shiny pkg
library(shiny)
library(DT)

# build user interface
htmlTemplate("index.html",
             ui = fluidPage(
  # input-1
  textInput(inputId = "sen",
            label = "Write a Sentence"), 
  
  # input-2
  actionButton(inputId = "token",
               label = "Get Tokens"),
  
  # input-3
  actionButton(inputId = "pos_tag",
               label = "Get the Pos Tag"),
  
  # output-1
  DTOutput(outputId = "tbl")
  
))