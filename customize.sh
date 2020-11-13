#!/bin/bash
# In-place overwrite all project names..

if [ $# -ne 1 ]; then
    echo "Usage: $0 <new project name>"
    echo "WARNING this will irreversibly customize the project to your name!"
    exit 1
fi

# make sure we are working from this directory
if [ ! -s customize.sh ]; then
    echo "This script MUST be run from the source directory,"
    echo "but I can't find customize.sh.  Chickening out."
    exit 1
fi

proj="$1"
PROJ="$(tr '[:lower:]' '[:upper:]' <<< ${proj})"
Proj="${PROJ:0:1}${proj:1}"

convert() {
    name="$(sed -e "s/zero/$proj/g; s/Zero/$Proj/g; s/ZERO/$PROJ/g;" <<< "$1")"
    sed -i.old -e "s/zero/$proj/g; s/Zero/$Proj/g; s/ZERO/$PROJ/g;" "$1"
    rm -f "$1.old"
    # rename if needed
    if [[ x"$1" != x"$name" ]]; then
      mv -f "$1" "$name"
    fi
}
for file in `find . -not -type d`; do
    convert "$file"
done

# Delete the old copyright and customize.sh files:
rm "COPYING"
rm "customize.sh"
rm -fr ".git"

cat <<.
To finish setting up this project, you must still do the following:

  0. Set up git (or other version control system)
    - git init
    - git add .
    - git commit -m "Initial build system."

  1. Create a COPYING file with your license (see https://opensource.org/licenses for help)

  2. Fill out README.md with relevant project data

  3. Run a test compile and check that everything is working (use build.sh)

  4. Check the sections marked ATTENTION in CMakeLists.txt.  You should add
     upstream library dependencies now.

  5. Run a test compile and check that everything is working
     - You might need to fill out CMAKE_PREFIX_PATH="A;B" etc. in build.sh

  6. Start coding, documenting, and testing!

.
