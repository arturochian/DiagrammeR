#' Render diagram in viewer pane
#' @description This function renders the diagram code in RStudio's viewer pane.
#' @export render_diagram

render_diagram <- function(diagram_code){
  
  # Create a blank 'index.html' file in a temporary directory
  tempDir <- tempfile()
  dir.create(tempDir)
  htmlFile <- file.path(tempDir, "index.html")
  
  # Add HTML to index.html file
  writeLines(paste0("
  <!DOCTYPE html>
    <html>
    <head>
    <script src=\"https://cdn.rawgit.com/knsv/mermaid/master/dist/mermaid.full.min.js\"></script>
      <meta charset=\"utf-8\">
        <title></title>
          <style>
              body {
                    margin: 0;
                    font-family: 'Open sans', sans-serif;
                    }
                    .page {
                    display: -webkit-box;
                    display: -moz-box;
                    display: -webkit-flex;
                    display: -ms-flexbox;
                    display: flex;
                    -webkit-box-direction: normal;
                    -moz-box-direction: normal;
                    -webkit-box-orient: horizontal;
                    -moz-box-orient: horizontal;
                    -webkit-flex-direction: row;
                    -ms-flex-direction: row;
                    flex-direction: row;
                    }
                    .header {
                    display: -webkit-box;
                    display: -moz-box;
                    display: -webkit-flex;
                    display: -ms-flexbox;
                    display: flex;
                    -webkit-box-pack: start;
                    -moz-box-pack: start;
                    -ms-flex-pack: start;
                    -webkit-justify-content: flex-start;
                    justify-content: flex-start;
                    width: 100%;
                    height: 50px;
                    background: #282828;
                    color: #d4d8df;
                    padding: 10px;
                    }
                    .header-logo {
                    color: #282828;
                    }
                    .header-title {
                    color: #d4d8df;
                    font-size: 16.25px;
                    }
                    .column {
                    display: -webkit-box;
                    display: -moz-box;
                    display: -webkit-flex;
                    display: -ms-flexbox;
                    display: flex;
                    width: 35%;
                    height: 100%;
                    background: #282828;
                    color: #d4d8df;
                    max-width: 350px;
                    overflow-y: scroll;
                    overflow-x: hidden;
                    padding: 20px 10px;
                    margin: 0 20px 0 0;
                    }
                    .column h2 {
                    font-size: 16.25px;
                    font-weight: bold;
                    }
                    .content {
                    display: -webkit-box;
                    display: -moz-box;
                    display: -webkit-flex;
                    display: -ms-flexbox;
                    display: flex;
                    -webkit-box-direction: normal;
                    -moz-box-direction: normal;
                    -webkit-box-orient: vertical;
                    -moz-box-orient: vertical;
                    -webkit-flex-direction: column;
                    -ms-flex-direction: column;
                    flex-direction: column;
                    -webkit-box-pack: justify;
                    -moz-box-pack: justify;
                    -ms-flex-pack: justify;
                    -webkit-justify-content: space-between;
                    justify-content: space-between;
                    width: 100%;
                    padding: 0 10px;
                    }
                    .editor {
                    display: -webkit-box;
                    display: -moz-box;
                    display: -webkit-flex;
                    display: -ms-flexbox;
                    display: flex;
                    width: 90%;
                    height: 40%;
                    font-family: 'Open sans', sans-serif;
                    border: 1px solid rgba(40, 40, 40, 0.6);
                    }
                    .button {
                    -webkit-border-radius: 4px;
                    -webkit-background-clip: padding-box;
                    -moz-border-radius: 4px;
                    -moz-background-clip: padding;
                    border-radius: 4px;
                    background-clip: padding-box;
                    display: -webkit-box;
                    display: -moz-box;
                    display: -webkit-flex;
                    display: -ms-flexbox;
                    display: flex;
                    -webkit-box-pack: center;
                    -moz-box-pack: center;
                    -ms-flex-pack: center;
                    -webkit-justify-content: center;
                    justify-content: center;
                    font-size: 16.25px;
                    background: #282828;
                    color: #d4d8df;
                    padding: 5px 15px;
                    text-transform: uppercase;
                    text-align: center;
                    border: 0;
                    width: 50%;
                    max-width: 150px;
                    margin: 5px auto;
                    }
                    .group {
                    display: -webkit-box;
                    display: -moz-box;
                    display: -webkit-flex;
                    display: -ms-flexbox;
                    display: flex;
                    -webkit-box-direction: normal;
                    -moz-box-direction: normal;
                    -webkit-box-orient: vertical;
                    -moz-box-orient: vertical;
                    -webkit-flex-direction: column;
                    -ms-flex-direction: column;
                    flex-direction: column;
                    width: 100%;
                    height: 50%;
                    }
                    .group:first-of-type {
                    border-bottom: 1px solid rgba(40, 40, 40, 0.2);
                    padding: 10px 0;
                    height: 40%;
                    }
          </style>
        </head>
        <body>
        <div class=\"mermaid\">",
  diagram_code,
  "     </div>
      </body>
    </html>
  "), con = htmlFile)
  
  # Display diagram in viewer pane
  rstudio::viewer(htmlFile)
  
}
