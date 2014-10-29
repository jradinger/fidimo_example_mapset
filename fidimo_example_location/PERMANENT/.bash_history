v.in.ascii -n input=/home/radinger/Documents/GRASS_locations/fidimo_example/PERMANENT/.tmp/grassgis/32482.0 output=outflow_point fs=,
g.remove
g.remove vect=outflow_point@PERMANENT
v.in.ascii -n input=/home/radinger/Documents/GRASS_locations/fidimo_example/PERMANENT/.tmp/grassgis/486.0 output=outflow_point
v.in.ascii -n input=/home/radinger/Documents/GRASS_locations/fidimo_example/PERMANENT/.tmp/grassgis/486.0 output=outflow_point fs=,
g.region n=5360000 s=5270000 e=450000 w=540000 res=150 
g.region n=5360000 s=5270000 e=450000 w=540000 res=150 g.region n=5360000 s=5270000 e=540000 w=450000 res=150                          
g.region n=5360000 s=5270000 e=540000 w=450000 res=150                          
r.proj input=n45e010_dem location=European_Rivers mapset=PERMANENT resolution=150
r.proj input=n45e015_dem location=European_Rivers mapset=
r.proj input=n45e010_dem location=HydroSheds mapset=PERMANENT resolution=150
r.proj input=n45e015_dem location=HydroSheds mapset=PERMANENT resolution=150
r.patch input=n45e010_dem,n45e015_dem output=fidimo_example_dem
r.watershed -f --overwrite elevation=fidimo_example_dem accumulation=accumulation
r.stream.extract --overwrite elevation=fidimo_example_dem threshold=750 stream_rast=all_streams direction=dirs
r.stream.basins --overwrite dir = dirs coors = "510975,5331275" basins=example_basin
r.stream.basins --overwrite dir=dirs coors = "510975,5331275" basins=example_basin
r.stream.basins
r.stream.basins --overwrite dir=dirs coors="510975,5331275" basins=example_basin
r.mapcalc "example_stream = example_basin && all_streams"
v.in.ascii -n stdin="510975,5331275" output=outflow_point fs=","
v.in.ascii
r.stream.basins
exit
r.random input=example_stream@PERMANENT n=5% raster_output=source_populations_5percent vector_output=source_populations_5percent
exit
exit
