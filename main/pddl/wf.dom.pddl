(define (domain WF)
    (:requirements :strips :typing :equality :negative-preconditions :disjunctive-preconditions :universal-preconditions :existential-preconditions :conditional-effects)
    (:types
        type template - node
        transform
    )
    (:predicates
        (have ?x - type)
        (dirty ?tr - transform)
        (pending_reset ?x - type)
        (raw ?x - type)

        (link ?t - node ?p - type)
        (template_of ?a - template ?b - type)
        (requires ?tr - transform ?in - type)
        (produces ?tr - transform ?out - type)
    )

    (:action mark_for_cleaning
        :parameters (?tr - transform)
        :precondition (and
            (dirty ?tr)
        )
        :effect (and
            (forall
                (?d - type)
                (when
                    (or (requires ?tr ?d) (produces ?tr ?d))
                    (and
                        (pending_reset ?d)
                    )
                )
            )
        )
    )

    (:action clean_node
        :parameters (?x - type ?temp - template)
        :precondition (and
            (pending_reset ?x)
            (template_of ?temp ?x)
        )
        :effect (and
            (not (pending_reset ?x))
            (raw ?x)
            (not (have ?x))
            (forall
                (?a - type)
                (and
                    (not (link ?a ?x))
                    (when
                        (link ?temp ?a)
                        (link ?x ?a)
                    )
                    (when
                        (not (link ?temp ?a))
                        (not (link ?x ?a))
                    )
                )
            )
        )
    )

    (:action indicate_clean
        :parameters (?tr - transform)
        :precondition (and
            (dirty ?tr)
            (forall
                (?d - type)
                (or (and
                        (or (requires ?tr ?d) (produces ?tr ?d))
                        (raw ?d)
                    )
                    (and (not (requires ?tr ?d)) (not (produces ?tr ?d)))
                )
            )
        )
        :effect (and
            (not (dirty ?tr))
        )
    )

    (:action morph
        :parameters (?d ?other - type)
        :precondition (and
            (raw ?d)
            (have ?other)
            (not (raw ?other))
            (not (pending_reset ?other))
            (forall
                (?a - type)
                (or 
                    (= ?a ?d)
                    (= ?a ?other)
                    (and (link ?d ?a) (link ?other ?a))
                    (not (link ?d ?a))
                )
            )
            (forall
                (?tr - transform)
                (not (produces ?tr ?d))
            )
        )
        :effect (and
            (have ?d)
            (not (raw ?d))
            (link ?d ?other)
        )
    )

    (:action apply_transform
        :parameters (?tr - transform)
        :precondition (and
            (not (dirty ?tr))
            (forall
                (?d - type)
                (or
                    (and (requires ?tr ?d) (have ?d) (not (raw ?d)))
                    (not (requires ?tr ?d))
                )
            )
        )
        :effect (and
            (dirty ?tr)
            (forall
                (?in - type)
                (forall
                    (?out - type)
                    (when
                        (and (requires ?tr ?in) (produces ?tr ?out))
                        (and
                            (link ?out ?in)
                            (not (raw ?out))
                            (have ?out)
                        )
                    )
                )
            )
        )
    )

    (:action transitive
        :parameters (?a ?b ?c - type)
        :precondition (and
            (not (raw ?a))
            (not (raw ?b))
            (not (raw ?c))
            (not (pending_reset ?a))
            (not (pending_reset ?b))
            (not (pending_reset ?c))
            (have ?a)
            (have ?b)
            (have ?c)
            (link ?a ?b)
            (link ?b ?c)
        )
        :effect (and
            (link ?a ?c)
        )
    )
)