init:
	@cp -r template/$(resource_type) envs/$(product)
	@cd envs/$(product) && terraform init

plan:
	@cd envs/$(product) && terraform plan

apply:
	@cd envs/$(product) && terraform apply