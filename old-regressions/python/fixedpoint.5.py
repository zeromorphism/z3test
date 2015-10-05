
# Copyright (c) 2015 Microsoft Corporation
from z3 import *

I  = IntSort()
B  = BoolSort()
l0 = Function('l0',I,I,B)
l1 = Function('l1',I,I,B)

s = Fixedpoint()
s.set(engine='datalog',
      compile_with_widening=True,
      unbound_compressor=False)

s.register_relation(l0,l1)
s.set_predicate_representation(l0, 'interval_relation', 'bound_relation')
s.set_predicate_representation(l1, 'interval_relation', 'bound_relation')

m, x, y = Ints('m x y')

s.declare_var(m, x, y)
s.rule(l0(0,m),   0 < m)
s.rule(l0(x+1,m), [l0(x,m), x < m])
s.rule(l1(x,m),   [l0(x,m), m <= x])

print s.query(l1(x,y))
print s.get_answer()

print s.query(l0(x,y))
print s.get_answer()
