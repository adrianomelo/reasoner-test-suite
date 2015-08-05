
files = list.files('./',recursive=1,pattern='filelist.csv$')

for (file in files)
{
	# -------- Histogram --------
	histogram = paste(file, 'histogram.pdf',sep='.')
	pdf(histogram) 

	data = read.csv(file, header=T)
	axioms = as.matrix(data$logical_axiom_count)
	hist(axioms,
		main='Histogram of logical axioms',
		ylab="Number of ontologies",
		xlab='Logical axioms')

	dev.off()

	# -------- KDE --------

	density = paste(file, 'density.pdf',sep='.')
	pdf(density) 

	d <- density(axioms)
	plot(d,
		main="Kernel density estimation of logical axioms")

	dev.off()

	# -------- Histogram limited --------

	histogram2 = paste(file, 'pie.pdf',sep='.')
	pdf(histogram2)

	m = as.matrix(table(data$constructs))
	total = sum(m[,1])
	limit = total / 40
	m1 = subset(m, m[,1] > limit)
	m2 = subset(m, m[,1] <= limit)
	c = matrix(c(sum(m2)), dimnames=list(c('Other',c())))

	result = rbind(m1,c)

	options(digits=2)
	result = round(result / (total * 0.01), digits=2)

	print(m1)
	
	labs = paste(names(result[,]), "\n", result[,],"%", sep="")
	pie(result[,],
		labels = labs,
		col=gray(seq(0,1,length=length(result))),
		main="Expressivity of ontologies")

	dev.off()
}