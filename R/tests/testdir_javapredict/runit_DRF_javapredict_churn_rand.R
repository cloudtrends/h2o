#----------------------------------------------------------------------
# Purpose:  This test exercises the DRF2 model downloaded as java code
#           for the churn data set while randomly setting the parameters.
#
# Notes:    Assumes unix environment.
#           curl, javac, java must be installed.
#           java must be at least 1.6.
#----------------------------------------------------------------------
    
options(echo=TRUE)    
TEST_ROOT_DIR <- ".."
setwd(normalizePath(dirname(R.utils::commandArgs(asValues=TRUE)$"f")))
source(paste(TEST_ROOT_DIR, "findNSourceUtils.R"  , sep="/"))
    
    
#----------------------------------------------------------------------
# Parameters for the test.
#----------------------------------------------------------------------

# q(save="no")

heading("Choose random parameters")

ntree <- sample(100, 1)
print(paste("ntrees", ntree))
    
depth <- sample(20, 1)
print(paste("depth", depth))
    
nodesize <- sample(10, 1)
print(paste("nodesize", nodesize))

data_dir = "/tmp/c10"
# from "/mnt/0xcustomer-datasets/c10"
train <- paste(data_dir, "churn_train.csv", sep="/")
print(paste("train", train))
    
test <- paste(data_dir, "churn_test.csv", sep="/")
print(paste("test", test))
    
y <- "churn"
print(paste("y", y))

# Remove Customer_ID because it's the right thing to do when building the model.
# Remove last_swap because it doesn't parse properly with date format.
# Remove occu1 because it doesn't parse properly with mixed char/num format.
df <- read.csv(train, nrows=1);
x <- setdiff(colnames(df), c(y, "Customer_ID", "last_swap", "occu1"))
print("x")
print(x)    


#----------------------------------------------------------------------
# Run the test
#----------------------------------------------------------------------
source('../Utils/shared_javapredict_RF.R')
