#############################################################################
##
#W  attrs.tst
#Y  Copyright (C) 2014                                   James D. Mitchell
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##

gap> START_TEST("Digraphs package: attrs.tst");
gap> LoadPackage("digraphs", false);;

#
gap> DigraphsStartTest();

# DigraphDual
gap> gr:= Digraph( [ [ 6, 7 ], [ 6, 9 ], [ 1, 3, 4, 5, 8, 9 ], 
> [ 1, 2, 3, 4, 5, 6, 7, 10 ], [ 1, 5, 6, 7, 10 ], [ 2, 4, 5, 9, 10 ], 
> [ 3, 4, 5, 6, 7, 8, 9, 10 ], [ 1, 3, 5, 7, 8, 9 ], [ 1, 2, 5 ], 
> [ 1, 2, 4, 6, 7, 8 ] ] );;
gap> Adjacencies(DigraphDual(gr));
[ [ 1, 2, 3, 4, 5, 8, 9, 10 ], [ 1, 2, 3, 4, 5, 7, 8, 10 ], [ 2, 6, 7, 10 ], 
  [ 8, 9 ], [ 2, 3, 4, 8, 9 ], [ 1, 3, 6, 7, 8 ], [ 1, 2 ], [ 2, 4, 6, 10 ], 
  [ 3, 4, 6, 7, 8, 9, 10 ], [ 3, 5, 9, 10 ] ]
gap> gr := Digraph( rec( vertices := [ "a", "b" ], 
> source := ["b", "b"], range := ["a", "a"] ) );    
<digraph with 2 vertices, 2 edges>
gap> DigraphDual(gr);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 1st choice method found for `DigraphDual' on 1 arguments
gap> gr := Digraph( [ ] );                  
<digraph with 0 vertices, 0 edges>
gap> DigraphDual(gr);
<digraph with 0 vertices, 0 edges>

# AdjacencyMatrix
gap> gr:=Digraph( rec( vertices := [ 1..10 ], 
> source := [ 1, 1, 1, 1, 1, 1, 1, 1 ], range := [ 2, 2, 3, 3, 4, 4, 5, 5 ] ) );
<digraph with 10 vertices, 8 edges>
gap> AdjacencyMatrix(gr);
[ [ 0, 2, 2, 2, 2, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ]
gap> AdjacencyMatrix( Digraph( [ [ ] ] ) );
[ [ 0 ] ]
gap> AdjacencyMatrix( Digraph( [ ] ) );
[  ]

# AdjacencyMatrix, testing before and after getting IsSimple and Adjacencies
# (with a simple digraph)
gap> r := rec( vertices := [ 1..7 ],
> source := [ 1, 1, 2, 2, 3, 4, 4, 5, 6, 7 ],
> range := [ 3, 4, 2, 4, 6, 6, 7, 2, 7, 5 ] );
rec( range := [ 3, 4, 2, 4, 6, 6, 7, 2, 7, 5 ], 
  source := [ 1, 1, 2, 2, 3, 4, 4, 5, 6, 7 ], vertices := [ 1 .. 7 ] )
gap> gr := Digraph(r);
<digraph with 7 vertices, 10 edges>
gap> adj1 := AdjacencyMatrix(gr);
[ [ 0, 0, 1, 1, 0, 0, 0 ], [ 0, 1, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], 
  [ 0, 0, 0, 0, 0, 1, 1 ], [ 0, 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 1 ], 
  [ 0, 0, 0, 0, 1, 0, 0 ] ]
gap> gr := Digraph(r);
<digraph with 7 vertices, 10 edges>
gap> IsSimpleDigraph(gr);
true
gap> Adjacencies(gr);
[ [ 3, 4 ], [ 2, 4 ], [ 6 ], [ 6, 7 ], [ 2 ], [ 7 ], [ 5 ] ]
gap> adj2 := AdjacencyMatrix(gr);
[ [ 0, 0, 1, 1, 0, 0, 0 ], [ 0, 1, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], 
  [ 0, 0, 0, 0, 0, 1, 1 ], [ 0, 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 1 ], 
  [ 0, 0, 0, 0, 1, 0, 0 ] ]
gap> adj1 = adj2;
true

# AdjacencyMatrix, testing before and after getting IsSimple and Adjacencies
# (with a not simple digraph)
gap> r := rec( vertices := [ 1..1 ], source := [ 1, 1 ], range := [ 1, 1 ] );
rec( range := [ 1, 1 ], source := [ 1, 1 ], vertices := [ 1 ] )
gap> gr := Digraph(r);
<digraph with 1 vertices, 2 edges>
gap> adj1 := AdjacencyMatrix(gr);
[ [ 2 ] ]
gap> gr := Digraph(r);
<digraph with 1 vertices, 2 edges>
gap> IsSimpleDigraph(gr);
false
gap> adj2 := AdjacencyMatrix(gr);
[ [ 2 ] ]
gap> adj1 = adj2;
true

# DigraphTopologicalSort: standard example
gap> r := rec( vertices := [1..20000], source := [], range := [] );;
gap> for i in [1..9999] do
>   Add(r.source, i);
>   Add(r.range, i+1);
> od;
> Add(r.source, 10000);; Add(r.range, 20000);;
> Add(r.source, 10001);; Add(r.range, 1);;
> for i in [ 10001..19999 ] do
>   Add(r.source, i);
>   Add(r.range, i+1);
> od;
gap> circuit := Digraph(r);
<digraph with 20000 vertices, 20000 edges>
gap> topo := DigraphTopologicalSort( circuit );;
gap> Length(topo);
20000
gap> topo[ 1 ] = 20000;
true
gap> topo[ 20000 ] = 10001;
true
gap> topo[ 12345 ];
17656
gap> gr := Digraph( [ [ 2 ], [ 1 ] ] );
<digraph with 2 vertices, 2 edges>
gap> DigraphTopologicalSort(gr);
fail

# DigraphTopologicalSort: testing almost trivial cases
gap> r := rec( vertices := [ 1, 2 ], source := [ 1, 1 ], range := [ 2, 2 ] );;
gap> multiple := Digraph(r);;
gap> DigraphTopologicalSort(multiple);
[ 2, 1 ]
gap> gr := Digraph( [] );
<digraph with 0 vertices, 0 edges>
gap> DigraphTopologicalSort(gr);
[  ]
gap> gr := Digraph([ [ ] ]);
<digraph with 1 vertices, 0 edges>
gap> DigraphTopologicalSort(gr);
[ 1 ]
gap> gr := Digraph([ [ 1 ] ]);
<digraph with 1 vertices, 1 edges>
gap> DigraphTopologicalSort(gr);
[ 1 ]
gap> gr := Digraph([ [ 2 ], [ 1 ] ]);
<digraph with 2 vertices, 2 edges>
gap> DigraphTopologicalSort(gr);
fail

# DigraphTopologicalSort: other small cases
gap> r:=rec( nrvertices := 8,
> source := [ 1, 1, 1, 2, 3, 4, 4, 5, 7, 7 ], 
> range := [ 4, 3, 4, 8, 2, 2, 6, 7, 4, 8 ] );;
gap> grid := Digraph(r);;
gap> DigraphTopologicalSort(grid);
[ 8, 2, 3, 6, 4, 1, 7, 5 ]
gap> adj := [ [ 3 ], [ ], [ 2, 3, 4 ], [ ] ];;
gap> gr := Digraph(adj);
<digraph with 4 vertices, 4 edges>
gap> IsAcyclicDigraph(gr);
false
gap> DigraphTopologicalSort(gr);
[ 2, 4, 3, 1 ]

# DigraphStronglyConnectedComponents
gap> gens := [ Transformation( [ 1, 3, 3 ] ), Transformation( [ 2, 1, 2 ] ), 
> Transformation( [ 2, 2, 1 ] ) ];;
gap> s := Semigroup(gens);
<transformation semigroup on 3 pts with 3 generators>
gap> gr := Digraph(RightCayleyGraphSemigroup(s));
<digraph with 15 vertices, 45 edges>
gap> DigraphStronglyConnectedComponents(gr);
rec( 
  comps := [ [ 1, 11, 15 ], [ 2, 3, 10, 14 ], [ 4, 6, 9, 13 ], 
      [ 5, 7, 8, 12 ] ], id := [ 1, 2, 2, 3, 4, 3, 4, 4, 3, 2, 1, 4, 3, 2, 1 
     ] )
gap> adj := [ [ 3, 4, 5, 7, 10 ], [ 4, 5, 10 ], [ 1, 2, 4, 7 ], [ 2, 9 ],
> [ 4, 5, 8, 9 ], [ 1, 3, 4, 5, 6 ], [ 1, 2, 4, 6 ],
> [ 1, 2, 3, 4, 5, 6, 7, 9 ], [ 2, 4, 8 ], [ 4, 5, 6, 8, 11 ], [ 10 ] ];;
gap> gr := Digraph(adj);
<digraph with 11 vertices, 44 edges>
gap> scc := DigraphStronglyConnectedComponents(gr);
rec( comps := [ [ 1, 3, 2, 4, 9, 8, 5, 6, 7, 10, 11 ] ], 
  id := [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ] )
gap> gr := Digraph( [ ] );
<digraph with 0 vertices, 0 edges>
gap> DigraphStronglyConnectedComponents(gr);
rec( comps := [  ], id := [  ] )

# DigraphStronglyConnectedComponents: weakly connected, 4 strong components
gap> r := rec( nrvertices := 9, 
> range := [ 1, 7, 6, 9, 4, 8, 2, 5, 8, 9, 3, 9, 4, 8, 1, 1, 3 ], 
> source := [ 1, 1, 2, 2, 4, 4, 5, 6, 6, 6, 7, 7, 8, 8, 9, 9, 9 ] );
rec( nrvertices := 9, 
  range := [ 1, 7, 6, 9, 4, 8, 2, 5, 8, 9, 3, 9, 4, 8, 1, 1, 3 ], 
  source := [ 1, 1, 2, 2, 4, 4, 5, 6, 6, 6, 7, 7, 8, 8, 9, 9, 9 ] )
gap> gr := Digraph(r);
<digraph with 9 vertices, 17 edges>
gap> scc := DigraphStronglyConnectedComponents(gr);
rec( comps := [ [ 3 ], [ 1, 7, 9 ], [ 8, 4 ], [ 2, 6, 5 ] ], 
  id := [ 2, 4, 1, 3, 4, 4, 2, 3, 2 ] )

# DigraphStronglyConnectedComponents: weakly conn., 20000 singletonstrong comps
gap> scc := DigraphStronglyConnectedComponents(circuit);;
gap> Length(scc.comps);
20000
gap> Length(scc.comps) = NrVertices(circuit);
true

#
gap> DigraphsStopTest();

#
gap> STOP_TEST( "Digraphs package: attrs.tst", 0);
