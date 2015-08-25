directories = list.files('./test-cases')

for (benchmark in directories) {
	directory = paste('./test-cases', benchmark, sep='/')
	files = list.files(directory,recursive=1,pattern='Reasoner-Results-')

	if (!identical(benchmark, "scalability"))
		next

	comparison = paste(directory, 'scalability-execution.pdf',sep='/')
	pdf(comparison)

	total = length(files)
	colours = rainbow(total)
	names = c(1:total)


	count = 1
	for (f in files)
	{
		file = paste(directory, f, sep='/')
		data = read.csv(file, header=T)
		data = data[order(data[1]),]
	
		name = unlist( strsplit(f, "Results-"))[2]
		name = substr(name, 1, nchar(name) - 4)
		names[count] = name
		print(name)

		if (count == 1)
			plot(1, type='n', xlim=c(1,length(data[,1])), ylim=c(0,180000),
				 xlab='(x * 50 + 1) ^ 2 logical axioms', ylab='Execution time')

		#print(file)
		#print(data$Correctly.Processed.Time)
		
		#data$Correctly.Processed.Time[data$Correctly.Processed.Time == 0] = 180000
		#lines(data$Correctly.Processed.Time, type='o', col=colours[count], lwd=2)
		data$Execution.Time[data$Execution.Time > 180000] = 180000
		lines(data$Execution.Time, type='o', col=colours[count], lwd=2)
		count = count + 1
	}
	print(names)

 	legend("topleft", legend = names, col=colours, pch=1) # optional legend

	dev.off()
}