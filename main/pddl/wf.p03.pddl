(define (problem wf_1)
    (:domain WF)
    (:objects
        long_reads short_reads dna_reads - property
        assembly bin contigs - property
        annot_reference annot_table - property
        orfs - property

        megahit-sr megahit-asm - type
        metawrap-reads metawrap-contigs metawrap-bin - type

        prodigal-contigs prodigal-orfs - type
        diamond-orfs diamond-ref diamond-annot - type

        megahit metawrap prodigal diamond - transform

        ref_kegg ref_cog - type
        input-sr target-an - type
        m_asm m_bin m_kegg m_cog - marker
    )
    (:init
        (requires megahit megahit-sr)
        (produces megahit megahit-asm)

        (requires metawrap metawrap-reads)
        (requires metawrap metawrap-contigs)
        (produces metawrap metawrap-bin)

        (requires prodigal prodigal-contigs)
        (produces prodigal prodigal-orfs)

        (requires diamond diamond-orfs)
        (requires diamond diamond-ref)
        (produces diamond diamond-annot)

        (is megahit-sr dna_reads)
        (is megahit-sr short_reads)
        (is megahit-asm contigs)
        (is megahit-asm assembly)

        (is metawrap-reads dna_reads)
        (is metawrap-contigs contigs)
        (is metawrap-contigs assembly)
        (is metawrap-bin contigs)
        (is metawrap-bin bin)

        (is prodigal-contigs contigs)
        (is prodigal-orfs orfs)

        (is diamond-orfs orfs)
        (is diamond-ref annot_reference)
        (is diamond-annot annot_table)

        (is ref_kegg annot_reference)
        (is ref_cog annot_reference)

        (is input-sr dna_reads)
        (is input-sr short_reads)
        (is target-an annot_table)

        (mis m_bin bin)
        (mis m_asm assembly)
        (mis m_kegg ref_kegg)
        (mis m_cog ref_cog)
    )
    (:goal
        (and
            (ancestor input-sr diamond-annot)
        )
    )
)
