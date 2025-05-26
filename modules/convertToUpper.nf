#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

process convertToUpper {
    publishDir "${params.outdir}", mode: 'copy'

    input:
    path inputfile

    output:
    path  "Upper.${inputfile}", emit: upper_file

    script:
    """
    cat $inputfile | tr '[a-z]' '[A-Z]' > Upper.${inputfile}
    """
}
