# https://www.fast-downward.org/PlannerUsage

# PATH=/home/tony/workspace/grad/pddl_fast_downward/builds/release/bin:$PATH

    # --plan-file blocks.txt \
    # ./blocks.domain.pddl ./blocks.p01.pddl \



echo $1
# popf ./wf.peasy2.pddl ./wf.dom.pddl

# /home/tony/workspace/grad/LAPKT-public/planners/at_bfs_f/at_bfs_f.py \
#     ./wf.dom.pddl ./wf.p$1.pddl $1.plan


    # --evaluator "hff=ff()" --evaluator "hcea=cea()" \
    # --search "lazy_greedy([hff, hcea], preferred=[hff, hcea])" \

/home/tony/workspace/grad/pddl_fast_downward/fast-downward.py \
    --keep-sas-file \
    --overall-time-limit 10s \
    --overall-memory-limit 4G \
    --plan-file wf${1}.out \
    ./wf.dom.pddl ./wf.p${1}.pddl \
    --evaluator "hff=ff()" \
    --search "lazy_greedy([hff], preferred=[hff])"

    # --translate-options --full-encoding

# /home/tony/workspace/grad/pddl_fast_downward/fast-downward.py -h