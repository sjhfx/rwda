#' Get fields of weibo comments
#'
#' This function get fields of weibo comments
#'
#' @param access_token Acess Token
#' @param weiboid the id of weibo
#' @export
#' @examples 
#' get_fields(comments)

get_fields = function(lst) {
  with(lst, c(
    created_at = created_at, 
    text = text,
    user_id = user$idstr,
    gender = user$gender,
    followers = user$followers_count,
    verified = user$verified,
    urank = user$urank,
    screen_name = user$screen_name,
    location = user$location
    )
  )
}
