#!/bin/bash -e

BOOST_DIR=${HOME}/dev/lib/boost_1_34_1/
YASMIC_DIR=${HOME}/dev/yasmic

CCFILES="components.cc max_flow.cc orderings.cc searches.cc shortest_path.cc
spanning_trees.cc statistics.cc"
OFILES=`echo ${CCFILES} | sed -e 's/\.cc/\.o/g'`

CFLAGS="-O2 -DMATLAB_BGL_LARGE_ARRAYS -fPIC -c -I${BOOST_DIR} -I${YASMIC_DIR}"
#CFLAGS="-g -DMATLAB_BGL_LARGE_ARRAYS -fPIC -c -I${BOOST_DIR} -I${YASMIC_DIR}"

function echocmd {
    echo $@
    $@
}

for file in ${CCFILES}; do
    echocmd g++-4.1 $CFLAGS $file
done

echocmd ar rc libmbgl-linux-64-large.a ${OFILES} 
    
echocmd rm ${OFILES}    
