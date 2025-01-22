
fluidPage(
  titlePanel("Animal Data"),

max_days <- max(animals$`Days in Shelter`, na.rm = TRUE),

    sidebarLayout(
      sidebarPanel(
        sliderInput("max_days","Maximum Days in Shelter:",
          min = 0, 
          max = max_days,
          value = 10, #need to change depending on result
                  step = 1
        ),
          selectInput("Type", "Type of Pet:",
                      choices = c("All", unique(animals$Type))
          ),
          selectInput("Outcome Type", "Outcome of Pet:",
                      choices = c("All", unique(animals$`Outcome Type`))
            
          )
          ), 
        mainPanel(
            plotOutput("bar_plot")
        )
    )
)

