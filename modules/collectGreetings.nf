#!/usr/bin/env nextflow

nextflow.enable.dsl = 2


process collectGreetings {
    publishDir "${params.outdir}", mode: 'copy'

    input:
    path greeting_file

    output:
    path "greetings.txt"

    script:
    """
    cat $greeting_file > greetings.txt
    """
}
