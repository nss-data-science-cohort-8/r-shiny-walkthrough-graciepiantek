
function(input, output, session) {
    output$distPlot <- renderPlot({   
      
      plot_data <- animals |> 
      filter(`Days in Shelter` <= input$max_days) 
    
    if (input$Type != "All") {
      plot_data <- plot_data |> 
        filter(Type == input$Type)
    }
    
    if (input$`Outcome Type` != "All") {  
      plot_data <- plot_data |> 
        filter(`Outcome Type` == input$`Outcome Type`)
    }
    
    ggplot(plot_data, aes(x = Type, fill = `Outcome Type`)) +
      geom_col() +
      labs(
        title = "Draft",
        x = "Type of Pet",
        y = "Count"
      )
    })
}
    

