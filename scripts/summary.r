

args <- commandArgs(TRUE)

files = list.files('./',recursive=1,pattern='filelist.csv$')

for (file in files)
{
	data = read.csv(file, header=T)
	sum = summary(data[c(
		'logical_axiom_count',
		'dataproperty_count',
		'obj_property_count',
		'indiv_count',
		'abox_size',
		'tbox_size',
		'rbox_size',
		'class_count'
	)])

	sum_file = paste(file, 'summary.txt',sep='.')
	sink(file=sum_file)
	print(sum)
	sink(file=NULL)
}