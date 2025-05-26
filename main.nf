#!/usr/bin/env nextflow
/*
1- Process 
    sayHello, convertToUpper, collectGreetings
2- Workflow
    chain the processes together
3- Modules
    move processes to modules and import them in the main.fnf
3- containers
    modify a process to use a container
4- Configuration
    port configuration in nextflow.config file
5- nef-test
create boiler plate for testing the process (nf-test init, generate process, ntf-test --help for more )
6- ci/cd
    setup the enviroment
    checkout the repos
    install dependencies
    run the test
    gather the results
*/

include { sayHello } from './modules/sayHello.nf'
include { convertToUpper } from './modules/convertToUpper.nf'
include { collectGreetings } from './modules/collectGreetings.nf'



workflow {
    greeting_ch = Channel.fromPath(params.greetings)
            //.view()
            .splitCsv()
            //.view()
            .map(item -> item[0]) // Assuming greetings.txt has a single column with names

    sayHello(greeting_ch)
    // Convert the output of sayHello to uppercase
    convertToUpper(sayHello.out.greeting_file)
    // Collect the results
    collected_ch = convertToUpper.out.collect()
   // collected_ch.view()
    collected_greetings = collectGreetings(collected_ch)
    //collected_greetings.view()

} 