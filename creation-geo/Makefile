all: z5/x0y0.png z4/x0y0.png z3/x0y0.png z3/x0y0.png z2/x0y0.png z1/x0y0.png z0/x0y0.png

map-z4.png: map-z5.png
	convert -scale 50% map-z5.png map-z4.png

map-z3.png: map-z4.png
	convert -scale 50% map-z4.png map-z3.png

map-z2.png: map-z3.png
	convert -scale 50% map-z3.png map-z2.png

map-z1.png: map-z2.png
	convert -scale 50% map-z2.png map-z1.png

map-z0.png: map-z1.png
	convert -scale 50% map-z1.png map-z0.png

z5/x0y0.png: map-z5.png
	mkdir z5 -p
	convert map-z5.png -crop 256x256 -set filename:tile "x%[fx:page.x/256]y%[fx:page.y/256]" +repage +adjoin "z5/%[filename:tile].png"

z4/x0y0.png: map-z4.png
	mkdir z4 -p
	convert map-z4.png -crop 256x256 -set filename:tile "x%[fx:page.x/256]y%[fx:page.y/256]" +repage +adjoin "z4/%[filename:tile].png"

z3/x0y0.png: map-z3.png
	mkdir z3 -p
	convert map-z3.png -crop 256x256 -set filename:tile "x%[fx:page.x/256]y%[fx:page.y/256]" +repage +adjoin "z3/%[filename:tile].png"

z2/x0y0.png: map-z2.png
	mkdir z2 -p
	convert map-z2.png -crop 256x256 -set filename:tile "x%[fx:page.x/256]y%[fx:page.y/256]" +repage +adjoin "z2/%[filename:tile].png"

z1/x0y0.png: map-z1.png
	mkdir z1 -p
	convert map-z1.png -crop 256x256 -set filename:tile "x%[fx:page.x/256]y%[fx:page.y/256]" +repage +adjoin "z1/%[filename:tile].png"

z0/x0y0.png: map-z0.png
	mkdir z0 -p
	convert map-z0.png -crop 256x256 -set filename:tile "x%[fx:page.x/256]y%[fx:page.y/256]" +repage +adjoin "z0/%[filename:tile].png"

clean:
	rm -f *~
	rm -rf z*
	rm -f map-z4.png
	rm -f map-z3.png
	rm -f map-z2.png
	rm -f map-z1.png
	rm -f map-z0.png
