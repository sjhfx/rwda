#' The sina weibo dot chart
#'
#' @param df_comments the dataframe of weibo comments
#' @param stopwords the stop words
#' @export
#' @examples 
#' df_comments = get_comments(access_token, weiboid)
#' verify_vioplot(df_comments)

verify_vioplot = function(df_comments, title_text = "Verify VS Rank") {
  verified = prop.table(table(df_comments$verified))
  vratio = paste("Verified: ", round(verified["TRUE"]*100, 1), "%", sep = "")
  notvratio = paste("Not Verified: ", round(verified["FALSE"]*100, 1), "%", sep = "")
  v1 <- as.numeric(df_comments$urank[df_comments$verified == "TRUE"])
  v2 <- as.numeric(df_comments$urank[df_comments$verified == "FALSE"])
  if (length(v1) == 0) {
    vioplot(v2, names=c(notvratio), col="gold")
  } else {
    vioplot(v1, v2, names=c(vratio, notvratio), col="gold")
  }
  title(title_text)
}
