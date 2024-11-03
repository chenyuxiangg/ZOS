current_path=`pwd`
source ${current_path}/script/env.sh

pre_compiler() {
    rm -rf ${OUTPUT_PATH}
}

do_compiler() {
    make clean && make all
}

pre_compiler
do_compiler