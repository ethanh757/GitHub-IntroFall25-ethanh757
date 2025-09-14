x <- 1:5
sapply(x, function(v) v^2)

result <- numeric(length(x))
for (i in seq_along(x)) {
  result[i] <- x[i]^2
}

result



q1 <- read.csv("/SYS3501/data/sales_q1-2.csv",  check.names = FALSE, stringsAsFactors = FALSE)
q2 <- read.csv("/SYS3501/data/sales_q2.csv",    check.names = FALSE, stringsAsFactors = FALSE)
lk <- read.csv("/SYS3501/data/products_lookup.csv", check.names = FALSE, stringsAsFactors = FALSE)

norm_names <- function(x) {
  x <- tolower(trimws(x))
  gsub("[^a-z0-9]+", "_", x)
}
names(q1) <- norm_names(names(q1))
names(q2) <- norm_names(names(q2))
names(lk) <- norm_names(names(lk))


q1$quarter <- "Q1"
q2$quarter <- "Q2"
sales <- rbind(q1, q2)

sales$product_key <- sales$product_id            

lk$product_key <- lk$product_code                   

if (!"units" %in% names(sales) && "qty" %in% names(sales)) sales$units <- sales$qty

if (!"unit_price" %in% names(lk) && "price" %in% names(lk)) lk$unit_price <- lk$price


lk_small <- lk[, intersect(c("product_key","unit_price"), names(lk)), drop = FALSE]
sales2 <- merge(sales, lk_small, by = "product_key", all.x = TRUE)

if (!"revenue" %in% names(sales2)) sales2$revenue <- NA_real_

need_fill <- with(sales2, quarter == "Q2" & (is.na(revenue) | revenue == 0) &
                    !is.na(units) & !is.na(unit_price))
sales2$revenue[need_fill] <- with(sales2, units * unit_price)[need_fill]


# totals by quarter
totals <- aggregate(cbind(units = sales2$units, revenue = sales2$revenue),
                    by = list(quarter = sales2$quarter), FUN = function(x) sum(x, na.rm = TRUE))

print(head(unmatched))
print(totals)

write.csv(sales2, "sales_q1_q2_enriched.csv", row.names = FALSE)

#I used chatGPT to help me write and understand the code since I have very little experience with R and only the material taught in lectures so far.
