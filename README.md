# generateLists

It contains all the required functions and a simple unit test.  

After installing the package from github you can use the main function:  

```
alphabet <- c("A", "C", "G", "T")
word_length <- 6
min_distance <- 3
required_words <- 96


result <-
  generateLists::generateLists(alphabet = alphabet,
                word_length = word_length,
                required_words = required_words,
                min_dist = min_distance)
```

Access the documentation:  
`?generateLists::generateLists`

Return the distance matrix:

```
m <- matrix(nrow = length(result), ncol = length(result))
i <- 0
j <- 0
m_names <- vector(length = length(result))
for (w1 in result) {
  i <- i + 1
  j <- 0
  m_names[i] <- paste(w1, collapse = "")
  for (w2 in result) {
    j <- j + 1
    m[i,j] <- sum(w1 != w2)
  }
}
colnames(m) <- m_names
rownames(m) <- m_names
m

```



