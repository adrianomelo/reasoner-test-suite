
ontology_dir = 'scalability'
basic_template = '''Prefix(owl:=<http://www.w3.org/2002/07/owl#>)
Prefix(rdf:=<http://www.w3.org/1999/02/22-rdf-syntax-ns#>)
Prefix(xml:=<http://www.w3.org/XML/1998/namespace>)
Prefix(xsd:=<http://www.w3.org/2001/XMLSchema#>)
Prefix(rdfs:=<http://www.w3.org/2000/01/rdf-schema#>)
Prefix(:=<http://www.adrianomelo.com/>)


Ontology(<http://www.cin.ufpe.br/~astm/or.owl>

%s
)
'''

template_axioms = '''Declaration(Class(:class{0}))
Declaration(Class(:class{1}))
SubClassOf(:class{0} :class{1})'''

def axioms(n):
	sc = [template_axioms.format(2*i, 2*i+1) for i in xrange(n)]
	return '\n'.join(sc)

for i in xrange(1,1000,50):
	n = i * i
	ontology = open('%s/%06d.owl' % (ontology_dir, n), 'w')
	ontology.write(basic_template % axioms(n))
	ontology.close()