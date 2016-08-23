#' The sina weibo wordcloud
#'
#' This function generates wordcloud of weibo comments.
#'
#' @param df_comments the dataframe of weibo comments
#' @param stopwords the stop words
#' @export
#' @examples
#' df_comments = get_comments(access_token, weiboid)
#' weibo_cloud(df_comments)

weibo_cloud = function(df_comments, stopwords = c(""), maxrow = 100) {
  str_comments = gsub("[^\u4e00-\u9fa5]", "", df_comments$text)
  wk = worker()
  segWords = wk[str_comments]
  segWords = filter_segment(segWords, stopwords)
  wordfraq = freq(segWords)
  wordfraq = transform(wordfraq, nc = nchar(wordfraq$char))
  wordfraq = subset(wordfraq, nc > 1, select = -nc)
  wordfraq = arrange(wordfraq, desc(freq))
  wordcloud2(wordfraq[1:min(maxrow, nrow(wordfraq)), ])
}