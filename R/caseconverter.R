
### WRAPPERS:

#' Convert to upper case
#'
#' @param x character.
#' @export
upper_case <- function(x) {
  toupper(x)
}

#' Convert to lower case
#'
#' @param x character.
#' @export
lower_case <- function(x) {
  tolower(x)
}

#' Convert to snake case
#'
#' @param x character.
#' @importFrom snakecase to_snake_case
#' @export
snake_case <- function(x) {
  snakecase::to_snake_case(x)
}

#' Convert to camel case
#'
#' @param x character.
#' @importFrom snakecase to_lower_camel_case
#' @export
camel_case <- function(x) {
  snakecase::to_lower_camel_case(x)
}

### ADDIN CALLS:

upperCaseAddin <- function() {
  .case_call("upper_case")
}

lowerCaseAddin <- function() {
  .case_call("lower_case")
}

snakeCaseAddin <- function() {
  .case_call("snake_case")
}

camelCaseAddin <- function() {
  .case_call("camel_case")
}

#' @importFrom rstudioapi getActiveDocumentContext modifyRange document_position
#'   documentSave
.case_call <- function(name) {
  call <- eval(parse(text = name))
  context <- rstudioapi::getActiveDocumentContext()

  for (con in context[["selection"]]) {
    if (!con[["text"]] == '') {
      rstudioapi::modifyRange(location = con[["range"]],
                              text = call(con[["text"]]),
                              id = context[["id"]])
    } else {
      rsrow <- con[["range"]][["start"]][["row"]]
      pos <- rstudioapi::document_position(c(rsrow, 1L), c(rsrow, Inf))
      rstudioapi::modifyRange(location = pos,
                              text = call(context[["contents"]][[rsrow]]),
                              id = context[["id"]])
    }
  }
  if (!context$path == '') {
    rstudioapi::documentSave(context$id)
  }
}
