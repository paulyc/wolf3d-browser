#!/bin/bash
#    makemaps.js.sh Create maps.js from original wolf3d map data
#    Pass directory containing wxx.map files as parameter
#
#    Copyright (C) 2018 Paul Ciarlo <paul.ciarlo@gmail.com>
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#    or to the author at PO Box 1172, New York NY 10028-0008, USA

MAPSJSOUT=maps.js

echo "Wolf.MapData = {" >> $MAPSJSOUT

for MAPFILE in $1/*.map; do
	basename=$( basename "$MAPFILE" )
	b64=$( base64 -b 0 "$MAPFILE" )
	echo "\"maps/$basename\":\"$b64\"," >> $MAPSJSOUT
done

echo "};" >> $MAPSJSOUT
