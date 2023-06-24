(define (problem wf_1)
    (:domain WF)
    (:objects
        asm bin ann tax sum - type
        annable taxable - type

        a_in a_out - type
        ta_in ta_out - template
        anner - transform

        t_in t_out - type
        tt_in tt_out - template
        taxer - transform

        ; t-sumer-ann t-sumer-tax t-sumer-out - template
        ; sumer-ann sumer-tax sumer-out - type

        in-asm in-bin - type
        out-asm-sum out-bin-sum - type
    )
    (:init
        ; (have asm)
        ; (have bin)
        ; (have ann)
        ; (have tax)
        ; (have sum)
        ; (have annable)
        ; (have taxable)

        (dirty anner)
        (requires anner a_in)
        (produces anner a_out)
        (template_of ta_in a_in)
        (link ta_in annable)
        (template_of ta_out a_out)
        (link ta_out ann)

        (dirty taxer)
        (requires taxer t_in)
        (produces taxer t_out)
        (template_of tt_in t_out)
        (link tt_in taxable)
        (template_of tt_out t_out)
        (link tt_out tax)

        ; (dirty sumer)
        ; (requires sumer sumer-ann)
        ; (requires sumer sumer-tax)
        ; (produces sumer sumer-out)
        ; (template_of t-sumer-ann)
        ; (link t-sumer-ann ann)
        ; (template_of t-sumer-tax)
        ; (link t-sumer-tax tax)
        ; (template_of t-sumer-out sumer-out)
        ; (link t-sumer-out sum)

        (link in-asm asm)
        (link in-asm annable)
        (link in-asm taxable)
        (have in-asm)
        
        (link in-bin bin)
        (link in-bin annable)
        (link in-bin taxable)
        (have in-bin)

        ; (link out-asm-sum sum)
        ; (link out-asm-sum asm)

        ; (link out-bin-sum sum)
        ; (link out-bin-sum tax)
    )
    (:goal
        (and
            ; (pending_reset anner-in)
            ; (raw a_in)
            (have a_out)

            ; (have out-asm-sum)
            ; (have out-bin-sum)
        )
    )
)

; specify group by source to specify domain of data