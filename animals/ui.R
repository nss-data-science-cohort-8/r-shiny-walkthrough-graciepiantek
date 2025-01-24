
fluidPage(
  theme = shinytheme("united"),
  titlePanel("Animal Data"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("max_days", "Days in Shelter:",
                  min = 0, 
                  max = max(animals$`Days in Shelter`, na.rm = TRUE),
                  value = 10,
                  step = 1
      ),
      selectInput("Type", "Type of Pet:",
                  choices = c("All", unique(animals$Type))
      ),
      selectInput("outcome_type", "Outcome of Pet: ",
                  choices = c("All", unique(animals$`Outcome Type`))
      )
    ), 
    mainPanel(
      plotOutput("barPlot")
    )
  )
)
