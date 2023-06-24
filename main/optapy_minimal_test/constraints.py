from domain import Slot, Block
from optapy import constraint_provider
from optapy.constraint import Joiners, ConstraintFactory
from optapy.score import HardSoftScore

def slot_conflict(constraint_factory: ConstraintFactory):
    return constraint_factory.for_each(Slot) \
        
            # .join(Lesson,
            #       # ... in the same timeslot ...
            #       Joiners.equal(lambda lesson: lesson.timeslot),
            #       # ... in the same room ...
            #       Joiners.equal(lambda lesson: lesson.room),
            #       # ... and the pair is unique (different id, no reverse pairs) ...
            #       Joiners.less_than(lambda lesson: lesson.id)
            #  ) \
            # .penalize("Room conflict", HardSoftScore.ONE_HARD)

@constraint_provider
def define_constraints(constraint_factory: ConstraintFactory):
    return [
        # Hard constraints
        room_conflict(constraint_factory),
        teacher_conflict(constraint_factory),
        student_group_conflict(constraint_factory),
        # Soft constraints are only implemented in the optapy-quickstarts code
    ]

