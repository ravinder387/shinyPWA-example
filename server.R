# activate shiny pkg
library(shiny)
library(tidytext)
library(tidyverse)
library(DT)
library(udpipe)

# server script
server <- function(input, output) {
  # create data
  rv <- reactiveValues(data = data.frame(x = c("NLP app")))
  
  # observe event token
  observeEvent(input$token, {
    tb <- tibble(s = input$sen)
    r = unnest_tokens(tb, tokens, s)
    rv$data = r
  })
  
  # observe event pos_tag
  observeEvent(input$pos_tag, {
    df <- data.frame(s = input$sen, stringAsFactors = FALSE)
    udmodel <- udpipe_load_model(file = "english.udpipe")
    x <- udpipe_annotate(udmodel,df$s)
    x <- as.data.frame(x)
    df <- select(x, token, upos)
    rv$data <- as.data.frame(df)
  })
  
  # build output
  output$tbl <- 
    renderDT({
      rv$data
    })
}