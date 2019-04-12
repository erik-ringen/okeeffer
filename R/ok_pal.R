#' ok_pal
#'
#' This function calls a palette based on number.
#' @param pal an integer between 1 and 10.
#' @export
#' @examples
#' ok_pal(1)

ok_pal <- function( pal ) {
  eval(as.name(paste0("pal_",pal)))
}