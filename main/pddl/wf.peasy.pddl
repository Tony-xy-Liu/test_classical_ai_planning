(define (problem wf_1)
    (:domain WF)
    (:objects
        primeable primed - type

        p p_primed - type
        primer - transform

        a a_prime - type
    )
    (:init
        (is p primeable)
        (is p_primed primed)
        (requires primer p)
        (produces primer p_primed)

        (is a primeable)
        (have a)

        (is a_prime primed)
    )
    (:goal
        (and
            ; (have p)
            (have a_prime)
        )
    )
)

; specify group by source to specify domain of data
