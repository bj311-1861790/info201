library("shiny")


intro_panel <- tabPanel(
  "Introduction",
  titlePanel("Income Inequality"),
  p("The below diagram was created by the New York Times to illustrate the
    increasing level of inequality in the US."),
  img(src = "img/inequality.png"),
  p(a(href = "https://www.nytimes.com/interactive/2017/08/07/opinion/leonhardt-income-inequality.html", "(source)")),
  p(
    "The graph shows how the richest 1% of people have seen their incomes jump",
    strong("6%"),
    "since 1980",
    "while the bottom 60% have barely seen any increase",
    em("(their income has stagnated).")
  ),
  p('Click on the "Growth Chart" tab to see an interactive diagram.')
)


sidebar_content <- sidebarPanel(
  sliderInput(
    inputId = "percentile",
    label = "Income Percentile", min = 0, max = 100, value = c(0, 100)
  )
)

main_content <- mainPanel(
  plotOutput("plot"),
  p(
    "Source:",
    a(
      href = "http://gabriel-zucman.eu/usdina/",
      "http://gabriel-zucman.eu/usdina/"
    )
  )
)

growth_panel <- tabPanel(
  "Growth Chart",
  titlePanel("Income growth 1980-2014"),
  sidebarLayout(
    sidebar_content,
    main_content
  )
)

ui <- navbarPage(
  "Income Inequality",
  intro_panel,
  growth_panel
)
