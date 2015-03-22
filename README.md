# Getting and Cleaning Data - Course Project
`run_analysis.R` script requires `plyr` library, so before launch the script, you need to install it:

`>install.packages("plyr")`

After installing plyr, you can start the script simply invokoing in R shell:

`> source("run_analysis.R")`

The script `run_analysis.R` performs following steps:
1. it creates directory "data"
2. it downloads raw data stored in a compressed file
3. uncompress downloaded file
4. build a tidy dataset, merging test and training data, modifying column names, nad labelling activities
5. build a second dataset with only mean and standard deviation for each measurement
6. stores the second dataset in a text file
