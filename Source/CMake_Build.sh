#!/usr/bin/env bash
# 
# This code is part of Toolkit
# DNSPing and FileHash, a useful and powerful toolkit
# Copyright (C) 2012-2017 Chengr28
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either
# version 2 of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.


# Create release directories.
if (uname -s | grep -iq "Darwin"); then
	ThreadNum=`sysctl -n hw.ncpu`
else 
	ThreadNum=`nproc`
fi
rm -Rrf Object
mkdir Release

# Build DNSPing.
mkdir Object
cd Object
cmake ../DNSPing
make -j${ThreadNum}
cd ..
mv -f Object/DNSPing Release
rm -Rrf Object

# Build FileHash.
mkdir Object
cd Object
cmake ../FileHash
make -j${ThreadNum}
cd ..
mv -f Object/FileHash Release
rm -Rrf Object

# Program settings
chmod -R 755 Release
