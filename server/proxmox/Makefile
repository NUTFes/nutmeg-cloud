init:
	cp -r envs/template envs/$(DIR_NAME)
	cd envs/$(DIR_NAME) && terraform init

plan:
	cd envs/$(DIR_NAME) && terraform plan

apply:
	cd envs/$(DIR_NAME) && terraform apply