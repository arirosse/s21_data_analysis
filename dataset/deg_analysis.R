### Installing EdgeR
install.packages("BiocManager")
BiocManager::install() ## pas certain que c'est nécessaire!
BiocManager::install("edgeR")
library(edgeR)


### Upload data
counts <- read.delim(, sep=, row.names=)


### Data groups
countsGroup = c()
groups = as.factor(countsGroup)

### Create a model matrix
mm <- model.matrix(~0 + groups)


### Create a DEG object
dgList <- DGEList(counts=counts, genes=rownames(counts), group=factor(countsGroup))


### Apply Voom algorithme
y <- voom(dgList, mm, plot=F)
fit <- lmFit(y, mm)

### See the restults
head(coef(fit))


### Make a contrast table
cont <- makeContrasts(, levels=colnames(coef(fit)))
tmp <- contrasts.fit(fit, cont)
tmp <- eBayes(tmp)


### Create top table
top.table <- topTable(tmp, sort.by = "P", n=Inf)
head(top.table)


### Export table
write.table(top.table, file=, row.names=F, sep="\t", quote=F)
