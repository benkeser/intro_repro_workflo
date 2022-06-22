#! /bin/bash

Rscript -e "renv::restore(prompt = FALSE)"

#--------------------------------------------------------
# build lectures and homeworks from Rmd 
#--------------------------------------------------------

# finds all .Rmd lecture files
RMD_LECTURE_FILES=$(find "lectures" -maxdepth 2 -type f -name "*.Rmd")

# build Rmd lecture files
for RMD_FILE in ${RMD_LECTURE_FILES}
do 
	FILE_PATH=${RMD_FILE%/*}
	FILE_NAME=${RMD_FILE##*/}
	# build rmarkdown slides
	Rscript -e "renv::activate(); setwd('${TRAVIS_BUILD_DIR}/${FILE_PATH}/'); rmarkdown::render('${FILE_NAME}')"
	# grab bash code from slides if it exists
	BASH_FILE_NAME="$(echo "${FILE_NAME}" | cut -f 1 -d '.').sh"
	if [ -f "${TRAVIS_BUILD_DIR}/${FILE_PATH}/.grab-bash" ]; then
        awk -F ', *' '/^```$/{p = 0} p; /```{bash/ && !/ (echo)/{print "\n###", $2, "###"; p=1}' ${TRAVIS_BUILD_DIR}/${FILE_PATH}/${FILE_NAME} > ${TRAVIS_BUILD_DIR}/${FILE_PATH}/${BASH_FILE_NAME}
	fi	
done

# make a directory for recording information
mkdir -p ${TRAVIS_BUILD_DIR}/website/_recordings

# run python script to populate lecture and homework data
${TRAVIS_BUILD_DIR}/website/make_lecture_data.py ${TRAVIS_BUILD_DIR}

