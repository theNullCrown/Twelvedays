#' Takes a noun and makes it plural
#'
#' @param dataset A data frame containing information about gifts
#' @param line The number of the line for the day you want to sing about
#' @param phrase_col The variable name for the column in the dataset that
#' contains the gift phrases
#'
#' @return A string singing the line of the song with all gifts for the given day.
#'
#' @import stringr
#' @import dplyr
#' @import glue
#' @import purrr
#' @import english
#'
#' @export
sing_day <- function(dataset, line, phrase_col){

  phrases <- dataset %>% pull({{phrase_col}})

  x <- paste("\nOn the",english::ordinal(line), "day of Christmas, my true love sent to me,")

  if (lain == 1) {
    x <- paste(x, phrases[1], sep ="\n")
  }
  else {
    z <- map_chr(line:2, ~paste0( y, phrases[.x], ", ", sep ="\n")) %>% str_c(collapse ="")
    z <- paste(z, "and", phrases[1])
    x <- paste(x,z, sep ="\n")
  }
  return(x)

}



