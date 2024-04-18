# ANSI escape codes for colors
RED := \033[0;31m
GREEN := \033[0;32m
RESET := \033[0m
BLUE := \033[0;34m
YELLOW := \033[0;33m
PURPLE := \033[0;35m
FIRE := \033[0;91m

ssh-key:
	@read -p "Enter SSH key name: " key_name; \
	read -p "Enter path to save key: " key_path; \
	ssh-keygen -t rsa -b 4096 -C "$$key_name" -f "$$key_path/$$key_name"; \
	eval "$(ssh-agent -s)"; \
	ssh-add "$key_path/$$key_name"; \
	cat "$key_path/$$key_name.pub"

create-alias:
	@read -p "Enter allias name: " allias_name; \
	read -p "Enter command: " command; \
	echo "alias $$allias_name='$$command'" >> ~/.bashrc; \
	source ~/.bashrc

remove-alias:
	@read -p "Enter allias name: " allias_name; \
	sed -i "/alias $$allias_name/d" ~/.bashrc; \
	source ~/.bashrc

help:
	@echo "$(PURPLE)🚀 Usage: make [target]$(RESET)"
	@echo "$(BLUE)  ssh-key              $(GREEN)Generate SSH key$(RESET)"
	@echo "$(BLUE)  create-alias         $(GREEN)Create alias$(RESET)"
	@echo "$(BLUE)  remove-alias         $(GREEN)Remove alias$(RESET)"
	@echo ""
