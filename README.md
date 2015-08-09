# Gender of Italian Names

A dataset of over 32,000 Italian first names and the associated gender frequency (SOURCE: Anagrafe amministratori locali 1985-2014)

To upload the file with R:

```{r}
library(RCurl)
x <- getURL("https://raw.githubusercontent.com/mrblasco/genderNamesITA/master/gender_firstnames_ITA.csv")
y <- read.csv(text = x)
```

# Notes

- niccolo’ instead of niccolò