#!/usr/bin/env nextflow

params.dir = "$baseDir/GOREP"
params.exit = "n"
params.cos1 = ""
params.cos2 = ""
params.sim = ""
params.vect = ""
params.update = ""



log.info "GOREP - N F  ~  version 1.0"
log.info "================================="
log.info "Install Directory    : ${params.dir}"


log.info "\n"

/* ---- Install GOREP ---- */

gorep_dir = file(params.dir)

if( !gorep_dir.exists() )  {
    install_dir = params.dir
    log.info "Intalling GOREP..."
    process install_gorep {


        input:
        install_dir
        
        output:
        val "${install_dir}/gorep_2" into dir
          
        script:

         """
         mkdir $install_dir
         cd $install_dir
         git clone https://github.com/Antonio4132/gorep_2.git
         cd gorep_2/
         """
         
    }

}
else {
    dir = "${params.dir}/gorep_2"
}


if(params.exit == "y" || params.update == "y"){

    /* ---- Stop GOREP ---- */

    log.info "Stopping GOREP..."

    process stop_gorep {


        input:
        val x from dir
        
        output:
        val "done" into stopped
          
        script:

         """
         cd $x
         docker-compose stop
         """
         
    }
}
else {
    
    /* ---- Start GOREP ---- */

    log.info "Starting GOREP..."

    process start_gorep {


        input:
        val x from dir
        
        output:
        val "done" into started
          
        script:

         """
         cd $x
         docker-compose up -d
         """
         
    }
}

if(params.update == "y"){

    /* ---- Reinstall GOREP ---- */

    log.info "Updating GOREP..."

    process update_gorep {


        input:
        val a from stopped
          
        script:

         """
         rm -r $params.dir
         
         mkdir $params.dir
         cd $params.dir
         git clone https://github.com/Antonio4132/gorep_2.git
         cd gorep_2/
         
         """
         
    }
}

if(params.cos1 != "" && params.cos2 != ""){

    /* ---- Cosine Query ---- */

    a = params.cos1.replace(" ", "+")
    b = params.cos2.replace(" ", "+")
    log.info "Doing Cosine Query..."
    log.info "Text1: $params.cos1"
    log.info "Text2: $params.cos2"

    process cosine_query {
          
        input:
         val x from started
         val x1 from a
         val x2 from b
         
        output:
          stdout query
        script:

         """
         curl -X GET "http://localhost:5000/cosine?text1=$x1&text2=$x2" -H  "accept: application/json"
         """
         
    }
    
    query.subscribe { println it }
    
}

if(params.sim != ""){

    /* ---- similarity Query ---- */

    a = params.sim.replace(" ", "+")
    log.info "Doing Similarity Query..."
    log.info "text: $params.sim"

    process similarity_query {
          
        input:
         val x from started
         val x1 from a
         
        output:
          stdout query
        script:

         """
         curl -X GET "http://localhost:5000/similarity?text=$x1" -H  "accept: application/json"
         """
         
    }
    
    query.subscribe { println it }
    
}

if(params.vect != ""){

    /* ---- Vectorize Query ---- */

    a = params.vect.replace(" ", "+")
    log.info "Doing Vecotrize Query..."
    log.info "text: $params.vect"

    process vectorize_query {
          
        input:
         val x from started
         val x1 from a
         
        output:
          stdout query
        script:

         """
         curl -X GET "http://localhost:5000/vectorize?text=$x1" -H  "accept: application/json"
         """
         
    }

    query.subscribe { println it }
        
}
