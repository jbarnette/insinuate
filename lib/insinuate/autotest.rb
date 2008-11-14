require "insinuate"

Autotest.add_hook(:initialize) { |at| Insinuate.unknown }
Autotest.add_hook(:red) { |at| Insinuate.bad }
Autotest.add_hook(:green) { |at| Insinuate.good }
Autotest.add_hook(:all_good) { |at| Insinuate.good }
