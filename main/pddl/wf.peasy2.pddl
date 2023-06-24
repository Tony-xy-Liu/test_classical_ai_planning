(define (problem plan_wf)
    (:domain WF)
    (:objects
        primeable prime - type

        p p_prime - type
        tp tp_prime - template
        primer - transform

        a a_prime - type
        b b_prime - type
    )
    (:init
        (have primeable)
        (have prime)

        (link tp primeable)
        (template_of tp p)
        (link tp_prime prime)
        (template_of tp_prime p_prime)
        (requires primer p)
        (produces primer p_prime)
        (dirty primer)

        (link a primeable)
        (have a)

        (link b primeable)
        (have b)

        (link a_prime a)
        (link a_prime prime)
        (raw a_prime)

        (link b_prime b)
        (link b_prime prime)
        (raw b_prime)
    )
    (:goal
        (and
            ; (pending_reset p)
            ; (raw p)
            ; (not (dirty primer))
            ; (have p_prime)
            ; (link p_prime a)
            ; (link p_prime b)

            (have a_prime)
            (have b_prime)
        )
    )
)
