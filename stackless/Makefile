all:
	@echo
	@echo '*******'
	@echo Use stackless datalog
	@echo Run datalog
	time -p lua -l datalog even.lua 3045
	@echo
	@echo '*******'
	@echo Use standard datalog
	cd ..; time -p lua -l datalog stackless/even.lua 3045
	@echo
	@echo '*******'
	@echo Use stackless datalog
	@echo Run datalog
	time -p lua -l datalog even.lua 6045
	@echo
	@echo '*******'
	@echo Use standard datalog
	cd ..; time -p lua -l datalog stackless/even.lua 6045
