library(shiny)
library(fireData)

ui <- fluidPage(
    titlePanel("Password protected Shiny app"),
    uiOutput("app")
)

server <- function(input, output) {
    apiKey <- ""

    authDomain <- ""
    
    clientId <- ""
    clientSecret <- ""
    
    
    
    USER <- reactiveValues(Logged = FALSE)
    
    output$app = renderUI(if (!isTRUE(USER$Logged)) {
        shiny_auth_server(
            USER,
            input,
            output,
            project_api = apiKey,
            web_client_id = clientId,
            web_client_secret = clientSecret,
            request_uri = authDomain
        )
    } else {
        fluidPage(
            sidebarLayout(
                sidebarPanel(
                    sliderInput("obs", "Number of observations:", min = 10, max = 500, value = 100)
                ),
                mainPanel(plotOutput("distPlot"))
            )
        )
    })
    
    output$distPlot <- renderPlot({
        hist(rnorm(input$obs), col = 'darkgray', border = 'white')
    })
}

shinyApp(ui = ui, server = server)
