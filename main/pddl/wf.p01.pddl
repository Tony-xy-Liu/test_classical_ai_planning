(define (problem wf_1)
    (:domain WF)
    (:objects
        s a b j k x - data
        s_ab aj bk jk_x - function
    )
    (:INIT
        (have s)
        (requires s_ab s)
        (produces s_ab a)
        (produces s_ab b)

        (requires aj a)
        (produces aj j)

        (requires bk b)
        (produces bk k)

        (requires jk_x j)
        (requires jk_x k)
        (produces jk_x x)
    )
    (:goal
        (AND
            (have x)
        )
    )
)