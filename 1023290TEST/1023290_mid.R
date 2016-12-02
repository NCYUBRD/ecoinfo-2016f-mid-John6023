library(data.table)
library(curl)
library(MASS)
setwd('C:/Users/John6023/Documents/demo1006/期中考試/ecoinfo-2016f-mid-John6023/1023290TEST')
p01 <- fread('C:\\Users\\John6023\\Documents\\demo1006\\期中考試\\ecoinfo-2016f-mid-John6023\\penghu_env.csv')

##第一題
##設定X為1到10000000的正整數
X <- 1:10000000

##並且隨機抽取出10000個正整數出來
a <- c(sample(X,10000,replace=FALSE))

##轉換成list向量的形式
a.list <- list(a.name=a)

##用MASS package的write.matrix將它存成random10k.csv檔案
write.matrix(a.list, file = "random10k.csv", sep = ",")

#第二題
##設定f數列15個數字
##並且設定費布納西(Fibonacci)數列的規律
f <- integer(15)
  f[1] <- 0
  f[2] <- 1
  f[3] <- 2
  for ( i in 4:15 ){
    f[i] <- f[i-2] + f[i-1]
  }
list(f)

#第三題
#a小題
##將 sample_data.txt 輸入進 R 內，並且將-9999、-9998等資料轉成NA
s01 <- fread('C:\\Users\\John6023\\Documents\\demo1006\\期中考試\\ecoinfo-2016f-mid-John6023\\sample_data.txt', na.strings = c('-9991','-9995','-9996','-9997','-9998','-9999'))

##將 yyyymmddhh 轉成 POSIXct 時間戳記格式，並且新增timestamp欄。
s01[, timestamp := as.POSIXct(strptime(yyyymmddhh-1,'%Y%m%d%H'))]

##新增年欄位
s01[, year:= year(timestamp)]
##新增月欄位
s01[, month:= month(timestamp)]
##新增日欄位
s01[, day:= mday(timestamp)]

##輸出成為sample_data_parsed.csv檔案
write.matrix(s01, file = "sample_data_parsed.csv", sep = ",")

#b小題

第四題
i44 <- read.csv('C:\\Users\\John6023\\Documents\\demo1006\\期中考試\\ecoinfo-2016f-mid-John6023\\penghu_env.csv', fileEncoding = "utf8")
##篩選鋤頭嶼
filter(i44,island=="鋤頭嶼")
##鋤頭嶼各項平均
summarise(filter(i44,island=="鋤頭嶼"), mean(total_cover),mean(C),mean(EC),mean(K),mean(Na),mean(N), na.rm = TRUE)
summarise(i44, mean(total_cover, na.rm = TRUE))