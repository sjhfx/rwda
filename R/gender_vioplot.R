#' The sina weibo dot chart
#'
#' @param df_comments the dataframe of weibo comments
#' @param stopwords the stop words
#' @export
#' @examples 
#' df_comments = get_comments(access_token, weiboid)
#' gender_vioplot(df_comments)

gender_vioplot = function(df_comments, title_text = "Gender VS Rank") {
  gender = prop.table(table(df_comments$gender))
  mratio = paste("Male: ", round(gender["m"]*100, 1), "%", sep = "")
  fratio = paste("Female: ", round(gender["f"]*100, 1), "%", sep = "")
  x1 <- as.numeric(df_comments$urank[df_comments$gender == "m"])
  x2 <- as.numeric(df_comments$urank[df_comments$gender == "f"])
  vioplot(x1, x2, names=c(mratio, fratio), col="gold")
  title(title_text)
}
