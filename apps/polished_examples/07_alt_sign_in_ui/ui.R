

ui <- fluidPage(
  fluidRow(
    column(
      10,
      h1("Polished Example 07 - Social Sign In with ", tags$em("sign_in_module_2")),
      br()
    ),
    column(
      2,
      br(),
      actionButton(
        "sign_out",
        "Sign Out",
        icon = icon("sign-out-alt"),
        class = "pull-right"
      )
    ),
    column(
      12,
      verbatimTextOutput("secure_content")
    )
  )
)

secure_ui(
  ui,
  sign_in_page_ui = sign_in_ui_default(
    sign_in_module = sign_in_module_2_ui("sign_in"),
    color = "#FEEE96",
    company_name = "FireData",
    logo_top = tags$img(
        src = "placeholder_company_logo.jpg",
        alt = "Placeholder Logo",
        style = "width: 125px; margin-top: 30px; margin-bottom: 30px;"
    ),
    logo_bottom = tags$img(
      src = "placeholder_company_logo.jpg",
      alt = "Placeholder Logo",
      style = "width: 200px; margin-bottom: 15px; padding-top: 15px;"
    )
  )
)
