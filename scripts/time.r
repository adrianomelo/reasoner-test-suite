
files = list.files('./',recursive=1,pattern='Query-Results-Correctly-Processed-Time.csv$')

for (file in files)
{
	graphic = paste(file, 'plot.pdf',sep='.')
	pdf(graphic) 

	data = read.csv(file, header=T)
	completed = subset(data, leancor > 0)
	completed <- completed[order(completed$leancor),]

	par(mfrow=c(2,2))
	plot(sort(completed[,c(2)]), main=names(data)[c(2)])
	plot(sort(completed[,c(3)]), main=names(data)[c(3)])
	plot(sort(completed[,c(4)]), main=names(data)[c(4)])
	
	dev.off()
}