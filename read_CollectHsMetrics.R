#### Parse metrics file from Picard tool CollectHsMetrics in R
#### Vincenzo A. Ellis
#### 24 September 2018

read_CollectHsMetrics <- function(file){
  dat <- readLines(file)
  line.breaks <- which(dat %in% "")
  stats <- read.delim(text = paste(dat[seq.int(line.breaks[1]+2, line.breaks[2]-1)], sep = "\t"))
  hist.data <- read.delim(text = paste(dat[seq.int(line.breaks[2]+2, line.breaks[3]-1)], sep = "\t"))
  dat.f <- setNames(list(stats, hist.data), c("stats", "hist.data"))
  return(dat.f)
}