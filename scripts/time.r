
files = list.files('./',recursive=1,pattern='Query-Results-Correctly-Processed-Time.csv$')

s <- function(data, x) {
	return (sum(data[x] > 0))
}

for (file in files)
{
	graphic = paste(file, 'plot.pdf',sep='.')
	pdf(graphic) 

	data = read.csv(file, header=T)
	completed = subset(data, leancor > 0)
	completed = completed[order(completed$leancor),]

	par(mfrow=c(2,2))

	ylim = range(range(data[4]), range(data[3]), range(data[2]))

	plot(sort(completed[,c(2)]),
		ylim=ylim,
		ylab='Processed time (ms)',
		xlab='Problem',
		main=names(data)[c(2)])

	plot(sort(completed[,c(3)]),
		ylim=ylim,
		ylab='Processed time (ms)',
		xlab='Problem',
		main=names(data)[c(3)])

	plot(sort(completed[,c(4)]),
		ylim=ylim,
		ylab='Processed time (ms)',
		xlab='Problem',
		main=names(data)[c(4)])

	counts = c(s(data, 2), s(data, 3), s(data, 4))
	ylim2 = range(c(0, 1.1 * max(counts)))

	bp = barplot(counts,
		ylim=ylim2,
		main="Correctly solved problems", 
  		names.arg=names(data)[c(2,3,4)])

	text(x = bp, y = counts, label = counts, pos = 3, cex = 0.8)
	
	dev.off()
}
