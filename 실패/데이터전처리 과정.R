---
title: "def_project"
author: "곽명빈"
date: 'r.sys.date()'
output: html_document
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


```{r}
library(readxl)
library(dplyr)
library(stringr)
library(tidyr)
```

# 데이터 읽기
```{r}
weather <- read.csv("기상데이터.csv")
city <- read.csv("city.csv")
city2 <- read.csv("행열전환city.csv")

```

#생산량, 면적당 생산량만 나타내게 처리
```{r}
production <- city2[, seq(from=4, to=796, by=3)] # 생산량

production2 <- city2[, seq(from=3, to=796, by=3)] # 면적당

day <- city2$행정구역별 # 날짜 데이터만 추출해서

production <- cbind(day, production) #붙이기

production2 <- cbind(day, production2) #붙이기
```

# 면적당 
```{r}
name <- gsub(".1", "", names(production2)) # 뒤에 붙은 .1 제거
colnames(production2) = c(name)  # 제거된 .1, .4로 변경


a <- gather(production2, key="day") # 한줄로 만들기

production2 <- cbind(day, a)
```

# 생산량 
```{r}
name1 <- gsub(".2", "", names(production)) # 뒤에 붙은 .1 제거
colnames(production) = c(name1)  # 제거된 .1, .4로 변경
a1 <- gather(production, key="day") # 한줄로 만들기
```

# 두개 합치기

```{r}
p <- a1$value # a1의 value를 p로 저장

production <- cbind(production2, p) # production에 생산량과 면적당을 합치기

names(production)

colnames(production) <- c("Day", "Area", "10a", "All")

```







