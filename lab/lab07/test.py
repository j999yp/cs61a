from lab07 import *


make_counter = make_advanced_counter_maker()
tom_counter = make_counter()
tom_counter('count')
1
tom_counter('count')
2
tom_counter('global-count')
1
jon_counter = make_counter()
jon_counter('global-count')
2
jon_counter('count')
1
jon_counter('reset')
jon_counter('count')
1
tom_counter('count')
3
jon_counter('global-count')
3
jon_counter('global-reset')
tom_counter('global-count')
1