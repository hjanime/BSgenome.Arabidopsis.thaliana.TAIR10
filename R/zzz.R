###
###

.pkgname <- "BSgenome.Arabidopsis.thaliana.TAIR10"

.seqnames <- NULL

.circ_seqs <- c("MT", "Pltd")

.mseqnames <- NULL

.onLoad <- function(libname, pkgname)
{
    if (pkgname != .pkgname)
        stop("package name (", pkgname, ") is not ",
             "the expected name (", .pkgname, ")")
    extdata_dirpath <- system.file("extdata", package=pkgname,
                                   lib.loc=libname, mustWork=TRUE)

    ## Make and export BSgenome object.
    bsgenome <- BSgenome(
        organism="Arabidopsis.thaliana",
        common_name="Arabidopsis.thaliana",
        genome="TAIR10",
        provider="NA",
        release_date="NA",
        source_url="NA",
        seqnames=.seqnames,
        circ_seqs=.circ_seqs,
        mseqnames=.mseqnames,
        seqs_pkgname=pkgname,
        seqs_dirpath=extdata_dirpath
    )

    ns <- asNamespace(pkgname)

    objname <- pkgname
    assign(objname, bsgenome, envir=ns)
    namespaceExport(ns, objname)

    old_objname <- "Arabidopsis.thaliana"
    assign(old_objname, bsgenome, envir=ns)
    namespaceExport(ns, old_objname)
}

