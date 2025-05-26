#!/usr/bin/env nextflow

nextflow.enable.dsl=2

process sayHello {
    publishDir "${params.outdir}", mode: 'copy'

    input:
    val greeting

    output:
    path "${greeting}.output.txt", emit: greeting_file

    script:
    """
    echo "Hello, $greeting!" > ${greeting}.output.txt
    """
}
