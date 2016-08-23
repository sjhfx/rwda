#' The sina weibo dot chart
#'
#' @param df_comments the dataframe of weibo comments
#' @param stopprovince the stop provinces
#' @export
#' @examples 
#' df_comments = get_comments(access_token, weiboid)
#' province_dotchart(df_comments)

province_dotchart = function(df_comments, stopprovince = c(""), title_text = "Users province distribution") {
  df_comments = transform(df_comments, province = substr(df_comments$location, 1, 2))
  x = count(df_comments, c("province"))
  x = x[order(x$freq), ]
  x = subset(x, !x$province %in% stopprovince)
  dotchart(x$freq, labels = x$province, cex=.6, pch = 19)
  title(title_text)
}