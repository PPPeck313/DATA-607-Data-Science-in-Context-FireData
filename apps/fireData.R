library(shiny)
library(firebase)

ui <- fluidPage(
    useFirebase(
        #analytics = TRUE,
        #firestore = TRUE
    ),
    #useFirebaseUI(),
    #reqSignin(actionButton("signout", "Sign out")),
    #uiOutput("msg"),
    #plotOutput("plot"),

    #uiOutput("uploadUI"),
    #uiOutput("downloadUI"),
    #uiOutput("deleteUI")
    
    
    
    # phone
    textInput(
        "number",
        "Number"
    ),
    actionButton("verify", "Verify"),
    recaptcha(),
    textInput("code", "Code"),
    actionButton("confirm", "Confirm")
)

server <- function(input, output) {
    f <- FirebaseUI$
        new("session")$
        set_providers(
            email = TRUE, 
            google = TRUE,
            facebook = TRUE,
            twitter = TRUE,
            github = TRUE,
            microsoft = TRUE,
            apple = TRUE,
            yahoo = TRUE,
            phone = TRUE
        )$
        launch()
    
    
    
    f <- firebase:::FirebasePhone$new()
    
    observeEvent(input$verify, {
        f$verify(input$number)
    })

    
    observeEvent(input$confirm, {
        f$confirm(input$code)
    })
    
    observeEvent(f$get_confirmation(), {
        print(f$get_confirmation())
    })
    
    
    
    output$plot <- renderPlot({
        f$req_sign_in() # require sign in
        plot(cars)
    })
    
    output$msg <- renderUI({
        f$req_sign_in() # require sign in
        user <- f$get_signed_in() # get logged in user info
        print(user)
        
        h4("Welcome,", user$response$displayName)
    })
    
    observeEvent(input$signout, {
        f$sign_out()
    })
    
    
    
    # upload a file
    #output$uploadUI <- renderUI({
    #    f$req_sign_in()
    #    
    #    actionButton("upload", "Upload Image")
    #})
    #
    #observeEvent(input$upload, {
    #    s$upload_file("/path/to/file.png")
    #})
    #
    #observeEvent(s$get_response(), {
    #    print(s$get_response())
    #})
    
    
    
    # download a file
    #output$downloadUI <- renderUI({
    #    f$req_sign_in()
    #    
    #    actionButton("download", "Download Image")
    #})
    #
    #observeEvent(input$download, {
    #    s$download_file("dl")
    #})
    #
    #observeEvent(s$get_response("dl"), {
    #    print(s$get_response("dl"))
    #})
    
    
    
    # delete file
    #output$deleteUI <- renderUI({
    #    f$req_sign_in()
    #    
    #    actionButton("delete", "Delete Image")
    #})
    #
    #observeEvent(input$delete, {
    #    s$delete_file("del")
    #})
    #
    #observeEvent(s$get_response("del"), {
    #    print(s$get_response("del"))
    #})
}

shinyApp(ui = ui, server = server)

#a <- Analytics$
#    new()$
#    launch()
#
#observeEvent(f$get_signed_in(), {
#    f$req_sign_in()
#    
#    a$log_event('notification_received');
#    a$set_user_properties(level = "free")
#})