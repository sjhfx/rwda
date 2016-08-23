#' The sina weibo data analysis
#'
#' Analysis the weibo comments.
#'
#' @param df_comments the dataframe of weibo comments
#' @export
#' @examples 
#' library(rwda)
#' df_comments = get_comments(access_token, weiboid)
#' weiboda(df_comments)

weiboda = function(df_comments) {
  gender_vioplot(df_comments)
  yorn = readline("Continue?(y/n) ")
  if (yorn != "n") {
    verify_vioplot(df_comments)
    yorn = readline("Continue?(y/n) ")
    if (yorn != "n") {
      weibo_cloud(df_comments)
    }
  }
}

