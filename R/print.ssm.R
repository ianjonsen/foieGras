##' @title print \code{ssm} fit object summary information
##'
##' @method print ssm
##'
##' @param x a foieGras ssm fit object
##' @param ... unused. For compatibility with the generic method.
##'
##' @examples
##' ## see summary fit output
##' ## load example foieGras ssm fit object (to save time)
##' data(fit)
##' fit
##'
##' @export

print.ssm <- function(x, ...)
{
  pm <- x$pm
  timeStep <- ifelse(length(x$ts) == 1, x$ts, "multiple time.steps")
  nbrStates <- nrow(x$predicted)
  nbStates <- nrow(x$fitted)
  parm <- x$par
  if("objective" %in% names(x$opt)) {
    nll <- x$opt$objective
  } else{
    nll <- x$opt$value
  }
  cat("Process model:", pm, "\n")
  cat("Time interval:", timeStep, if(is.numeric(timeStep)) {"hours"}, "\n")
  cat("number of observations:", nbStates, "\n")
  cat("number of regularised state estimates:", nbrStates, "\n\n")
  cat("parameter estimates\n")
  cat("-------------------\n")
  print(round(parm, 3), justify = "right")
  cat("-------------------\n")
  cat("negative log-likelihood:", nll, "\n")
  cat("convergence:", x$opt$message, "\n\n")

}