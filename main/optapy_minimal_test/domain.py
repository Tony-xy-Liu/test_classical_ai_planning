from dataclasses import dataclass
from optapy import problem_fact, planning_id

@dataclass
@problem_fact
class Slot:
    id: str
    size: int

    @planning_id
    def get_id(self):
        return self.id


from optapy import planning_entity, planning_variable

@dataclass
@planning_entity
class Block:
    id: str
    size: int

    @planning_id
    def get_id(self):
        return self.id