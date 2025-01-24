
function(input, output, session) {
  
    output$barPlot <- renderPlot({   
      
      plot_data <- animals |> 
      filter(`Days in Shelter` <= input$max_days) 
    
    if (input$Type != "All") {
      plot_data <- plot_data |> 
        filter(Type == input$Type)
    }
    
    if (input$outcome_type != "All") {  
      plot_data <- plot_data |> 
        filter(`Outcome Type` == input$outcome_type)
    }
    
    ggplot(plot_data, aes(x = Type, fill = `Outcome Type`)) +
      geom_bar(
        stat = "count") +
      labs(
        x = "Type of Pet",
        y = "Count"
      ) +
      theme_classic() +
      scale_fill_brewer(palette = "RdYlBu")
    })
}

