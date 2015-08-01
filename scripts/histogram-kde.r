
files = list.files('./',recursive=1,pattern='filelist.csv$')

for (file in files)
{
	histogram = paste(file, 'histogram.pdf',sep='.')
	pdf(histogram) 

	data = read.csv(file, header=T)
	axioms = as.matrix(data$logical_axiom_count)
	hist(axioms,
		main='Histogram of logical axioms',
		ylab="Number of ontologies",
		xlab='Logical axioms')

	dev.off()

	density = paste(file, 'density.pdf',sep='.')
	pdf(density) 

	d <- density(axioms)
	plot(d,
		main="Kernel density estimation of logical axioms")

	dev.off()
}