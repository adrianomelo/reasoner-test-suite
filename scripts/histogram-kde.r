
files = list.files('./',recursive=1,pattern='filelist.csv$')

for (file in files)
{
	histogram = paste(file, 'histogram.pdf',sep='.')
	pdf(histogram) 

	data = read.csv(file, header=T)
	axioms = as.matrix(data$logical_axiom_count)
	hist(axioms,
		main='Hitogram of logical axioms',
		ylab="number of ontologies",
		xlab='logical axioms')

	dev.off()

	density = paste(file, 'density.pdf',sep='.')
	pdf(density) 

	d <- density(axioms)
	plot(d)

	dev.off()
}