library(rvest)
library(dplyr)

# スクレイピングするURL
url <- "https://www.boatrace.jp/owpc/pc/race/raceresult?rno=1&jcd=03&hd=20240704"

# HTMLを読み込む
page <- read_html(url)

# ページのタイトルを取得
title <- page %>% html_node("title") %>% html_text()

# 結果をデータフレームに変換
result <- data.frame(
  timestamp = Sys.time(),
  title = title,
  stringsAsFactors = FALSE
)

# CSVファイルに保存
write.csv(result, "data/results.csv", row.names = FALSE)
