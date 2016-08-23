#' Get comments of weibo
#'
#' This function get comments of weibo
#'
#' @param access_token get from http://open.weibo.com/tools/console
#' @param weiboid the id of weibo
#' @param maxpage the max page of weibo comments
#' @export

get_comments = function(access_token, weiboid, maxpage = 10) {
  comments = list()
  df_comments = ldply(comments, get_fields, .id = NULL)
  page = 1
  while(page <= maxpage) {
    url = paste("https://api.weibo.com/2/comments/show.json?id=", weiboid,
                "&page=", page, "&access_token=", access_token, sep = "")
    comments = fromJSON(getURL(url, .opts = list(ssl.verifypeer = FALSE)))$comments
    print(paste("Page", page, ": ", length(comments), "comments"))
    df_comments = rbind(df_comments, ldply(comments, get_fields, .id = NULL))
    page = page + 1
    Sys.sleep(1)
  }
  return(df_comments)
}
